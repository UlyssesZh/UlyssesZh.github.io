---
title: Ways of reducing mass rebuilds in Nix without changing Nix
date: 2026-04-16 09:45:36 -0700
categories:
- programming
tags:
- nix
layout: post
excerpt: 'One serious problem with Nix is the amount of mass rebuilds happening in Nixpkgs
every time some package with many dependents and indirect dependents gets an update.
Such updates often result in headaches in package maintaining
as they cost much time on both the package maintainers and the CI machines that actually run the rebuilds.
Is there any way to reduce mass rebuilds?'
---

## Introduction

Nix as a software package manager is amazing in its reproducibility,
the cost of which, however, is the problem of mass rebuilds.
When a package gets an update,
every package that depends on it, directly or indirectly, will be rebuilt.
This means that even a small update can lead to conceptually unnecessary mass rebuilds
involving thousands of packages or even much more
if the update touches a package on which many packages depend,
such as `glibc`.
This imposes huge burden on all kinds of resources,
such as CPU resources (compiling software is generally CPU intense),
storage resources (different rebuilds of a software reside in different store paths),
and network resources (all users of rebuilt packages
have to redownload them from the binary caches).

Nixpkgs has staging branches to manage such mass rebuilds.
Every update in Nixpkgs that triggers mass rebuilds will go through a staging process,
which takes some time for it to be merged into the master branch.
If updates that conceptually do not require mass rebuilds
can actually be done without mass rebuilds,
then they can be applied to the master branch much more quickly than going through the staging process.

This article aims at brainstorming some ways to reduce mass rebuilds
without changing Nix itself.
In other words, I will think of some ways in which we can refactor Nixpkgs
or develop alternative package sets to avoid some mass rebuilds
without switching to another implementation of Nix language
or ditching Nix altogether.

The most common kinds of dependencies between Nix derivations are:

1. The output of the dependent derivation includes the out path of the depended derivation.
   This happens when you use `autoPatchelf` and `patchShebangs`.
2. Besides the point above, the builder of the dependent derivation actually also needs to
   look at the file contents of the output of the depended derivation.
   This happens when you compile a software against the depended library.
3. The builder of the dependent derivation runs executables
   or calls functions in the depended derivation.
   This happens when the depended software is a compiler
   used to compile the dependent software.

<p class="no-indent">
I am going to try to pose some ideas
to improve the situation for each of the three kinds of dependencies.
</p>

## Store path replacements

For the first kind of dependencies, conceptually there is absolutely no need
to rebuild the dependent software.
Building the dependent derivation is bound to succeed,
and the result in the output will differ by nothing more than the updated store path
of the depended derivation.
Therefore, the idea to solve this is simple:
instead of rebuilding the dependent derivation from scratch, simply substitute the store path
in the output of the dependent derivation.

Now, let us take a simple example.
Assume that `foo_1` is a program that simply outputs `hello` to the standard output
and that `foo_2` is a program that simply outputs `howdy` to the standard output.
Assume that `bar` is simply a wrapper around `foo` made using `makeWrapper`.
In the builder of `bar`, I will include a `sleep` command to simulate a time-consuming building process.
An update in its dependent is then simulated as we switch from `foo = foo_1` to `foo = foo_2`.
When you build `bar`, it will take you 5 seconds of waiting during the build.
Then, when you switch to `foo = foo_2` and build `bar` again,
it will take you another 5 seconds of waiting during the build,
which is conceptually totally unnecessary because that part
does not change for the `foo` update at all.

<details><summary>Supposed packaging in Nixpkgs</summary>

This is what it would look like if `bar` is packaged in Nixpkgs:

```nix
# bar.nix
{
	lib,
	stdenv,
	writeShellScriptBin,
	makeWrapper,
}:

let
	foo_1 = writeShellScriptBin "foo" "echo hello";
	foo_2 = writeShellScriptBin "foo" "echo howdy";
	foo = foo_1;
in
stdenv.mkDerivation {
	pname = "bar";
	version = "1.0.0";

	dontUnpack = true;

	nativeBuildInputs = [ makeWrapper ];

	buildPhase = ''
		runHook preBuild
		sleep 5 # simulate a time-consuming building process
		runHook postBuild
	'';

	installPhase = ''
		runHook preInstall
		makeWrapper ${lib.getExe foo} $out/bin/bar
		runHook postInstall
	'';

	meta.mainProgram = "bar";
}
```

<p class="no-indent">
To build it, run
</p>

```bash
nix-build -E '(import <nixpkgs> {}).callPackage ./bar.nix {}'
```

<p class="no-indent">
After that, you can run `bar` by running `result/bin/bar`.
</p>

</details>

How can we prevent this rebuild?
We can have an intermediate derivation `barWithStub`,
which references the out path of a derivation `fooStub` instead of `foo`.
Because `fooStub` does not care about `foo`, neither does `barWithStub`.
Then, the builder of `bar` then takes everything from the output of `barWithStub`,
and replace the store path of `fooStub` with that of `foo`.

<details><summary>Implementation</summary>

Here is an implementation of this idea:

```nix
# bar.nix
{
	lib,
	stdenv,
	writeScriptBin,
	writeShellScriptBin,
	makeWrapper,
}:

let
	fooStub = writeScriptBin "foo" "";

	foo_1 = writeShellScriptBin "foo" "echo hello";
	foo_2 = writeShellScriptBin "foo" "echo howdy";
	foo = foo_1;

	barWithStub = stdenv.mkDerivation {
		pname = "bar";
		version = "1.0.0";

		dontUnpack = true;

		nativeBuildInputs = [ makeWrapper ];

		buildPhase = ''
			runHook preBuild
			sleep 5 # simulate a time-consuming building process
			runHook postBuild
		'';

		installPhase = ''
			runHook preInstall
			makeWrapper ${lib.getExe fooStub} $out/bin/bar
			runHook postInstall
		'';

		meta.mainProgram = "bar";
	};
in
stdenv.mkDerivation {
	inherit (barWithStub) pname version meta;
	dontUnpack = true;

	installPhase = ''
		runHook preInstall
		cp -ar ${barWithStub} $out
		chmod +w $out/bin/bar
		substituteInPlace $out/bin/bar --replace-fail ${fooStub} ${foo}
		runHook postInstall
	'';
}
```

It still needs some polishing because the package as it is right now cannot
have overridden attributes.
However, you can easily fix it by exposing `barWithStub` in `bar.passthru`.
The fully polished packaging is not important here as this code snippet already presents my idea neatly.

The code snippet also looks a bit redundant with boilerplate codes,
but we can fix this by defining a packaging helper function to remove the common codes.
We can also add a feature to `makeWrapper` to let it write something to `$out/nix-support`
of the intermediate package with stub
to instruct the builder of the final package about where and what the stub store paths are.

</details>

Notice that for cases resembling this specific example,
there is actually another pattern commonly used in Nixpkgs,
which is to have an intermediate package called `bar-unwrapped`,
which does not use `makeWrapper` in its install phase.
The final package `bar` is a `symlinkJoin` that takes the unwrapped intermediate package
into its output through symbolic links instead of copying,
and it has `makeWrapper` in its builder.
This approach is better for this example for two reasons:
(1) it saves the operation of copying the entire output of the intermediate package,
which can be heavy on disk IO;
(2) it does not require users consuming the binary caches to download the entire store path
if the unwrapped package does not change.
However, the approach of substituting stub store paths can be extended to more use cases
than `makeWrapper`, notably those with `autoPatchelf` and `patchShebangs`.
A natural thought is to combine the advantages of the two:
use symbolic links for files that do not contain stub store paths
and copy files that contain stub store paths.
This interesting approach, however, has its own downsides:
(1) it makes the stub derivation included in the closure of the final package;
(2) it takes up more space than both alternatives if the copied files take up most of the space.

As a side note, it is actually a separate problem that a user consuming binary caches
has to download entire store paths
for what could be very small changes from store paths that already exist on the user's machine.
There is a [blog article](https://alternativebit.fr/posts/nixos/future-of-nix-substitution)
by [PicNoir](https://alternativebit.fr) that explores
how Nix may be improved to solve this very problem.

## Separating compiling and linking

It sounds completely reasonable that a software should be rebuilt
when the library it depends on gets an update.
However, a certain fact makes this statement only half-true:
building a software from its source code actually involves two steps,
compiling and linking.
What compiling needs from the depended library is only the header files,
and what linking needs from the depended library is only the library files.
The catch is that, in most cases, the resources taken in the build phase
are dominantly taken by the compiling,
but the library files are often the only files that get updated.

This observation is especially important for indirect dependencies.
Supose that `foo` and `bar` are libraries, where `bar` depends on `foo`,
and that `baz` is a program that depends on `bar`.
When `foo` gets an update, `bar` is rebuilt.
However, because `bar` does not get an update, its header files do not change,
so `baz` does not need to be recompiled.
However, how people typically package `baz` in Nixpkgs will make it have to recompile
whenever `foo` gets an update.

<details><summary>Supposed packaging in Nixpkgs</summary>

First, I will give the source codes of `foo`, `bar`, and `baz`.
For simplicity, they will be very simple: `foo` contains a function `kat`;
`bar` contains a function `mar` that returns the return value of `kat`;
and `baz` has a `main` function that returns the return value of `mar`.
After that, I will give the Nix code that packages them.

```c
// foo/foo.h
#ifndef FOO_H
#define FOO_H
#ifndef FOO_VERSION
#define FOO_VERSION 1
#endif
int kat();
#endif
```

```c
// foo/foo.c
#include "foo.h"
int kat() { return FOO_VERSION; }
```

```makefile
# foo/Makefile
libfoo.so: foo.o
	$(CC) -shared -o libfoo.so foo.o

foo.o:
	$(CC) -c foo.c -o foo.o

install: install-lib install-include

install-lib: libfoo.so
	install -Dm644 libfoo.so -t $(out)/lib

install-include:
	install -Dm644 foo.h -t $(out)/include
```

```c
// bar/bar.h
#ifndef BAR_H
#define BAR_H
int mar();
#endif
```

```c
// bar/bar.c
#include "bar.h"
#include <foo.h>
int mar() { return kat(); }
```

```makefile
# bar/Makefile
libbar.so: bar.o
	$(CC) -shared -o libbar.so bar.o -lfoo

bar.o:
	$(CC) -c bar.c -o bar.o

install: install-include install-lib

install-lib: libbar.so
	install -Dm644 libbar.so -t $(out)/lib

install-include:
	install -Dm644 bar.h -t $(out)/include
```

```c
// baz/baz.c
#include <bar.h>
int main() { return mar(); }
```

```makefile
# baz/Makefile
baz: baz.o
	$(CC) -o baz baz.o -lbar

baz.o:
	$(CC) -c baz.c -o baz.o
	sleep 5 # simulate time-consuming building process

install: baz
	install -Dm755 baz -t $(out)/bin
```

```nix
# baz.nix
{ stdenv }:

let
	foo_1 = stdenv.mkDerivation {
		pname = "foo";
		version = "1.0.0";
		src = ./foo;
		outputs = [ "out" "dev" ];
	};
	foo_2 = foo_1.overrideAttrs { NIX_CFLAGS_COMPILE = [ "-DFOO_VERSION=2" ]; };
	foo = foo_2;

	bar = stdenv.mkDerivation {
		pname = "bar";
		version = "1.0.0";
		src = ./bar;
		buildInputs = [ foo ];
		outputs = [ "out" "dev" ];
	};

in
stdenv.mkDerivation {
	pname = "baz";
	version = "1.0.0";
	src = ./baz;
	buildInputs = [ bar ];
	meta.mainProgram = "baz";
}
```

<p class="no-indent">
Build `baz` by running
</p>

```bash
nix-build -E '(import <nixpkgs> {}).callPackage ./baz.nix {}'
```

<p class="no-indent">
and then you can run `result/bin/baz`.
It will immediately terminate with exit code `1`.
If you switch from `foo = foo_1` to `foo = foo_2` and build `baz` after that,
`baz` will be recompiled,
and `result/bin/baz` now will terminate with exit code `2`.
</p>

Note that this is very bare-bone and overlooks a lot of things.
For example, using `pkgsStatic.callPackage` on it will not work.

</details>

However, in principle, we should be able to skip recompiling `baz` when `foo` updates
because compiling `baz` only needs the header files of `bar`.
We can have an intermediate derivation `bazObj`,
whose builder only compiles but not links `baz`,
and the derivation output is the unlinked object files.
The final package `baz` then uses `bazObj` as an input and produces the linked binaries.
The input of `bazObj` consists of `baz.src` and `bar.dev`,
and the input of `baz` consists of `bazObj` and `bar.out`
(we are assuming `bar` has two outputs `dev` and `out`,
respectively containing the header files and the library files).

There is still one problem here, though,
which is that a change in `foo` will lead to a change in `bar.dev` for two reasons:
(1) Nix derivations are input-addressed but not content-address,
which means that even if the contents of `bar.dev` does not change,
it is still a different derivation if the input `foo` changes;
(2) the default fixup phase of `stdenv.mkDerivation` in Nixpkgs
will put `bar.out`, which helplessly has to reference `foo`,
in the propagated build inputs of `bar.dev`.
Therefore, instead of relying on the default fixup phase of `stdenv.mkDerivation` in Nixpkgs
to create `bar.dev` for us,
we have to write our own implementation
so that it does not reference `foo` directly or indirectly.

<details><summary>Implementation</summary>

```nix
# baz.nix
{ stdenv }:

let
	foo_1 = stdenv.mkDerivation {
		pname = "foo";
		version = "1.0.0";
		src = ./foo;
		outputs = [ "out" "dev" ];
	};
	foo_2 = foo_1.overrideAttrs { NIX_CFLAGS_COMPILE = [ "-DFOO_VERSION=2" ]; };
	foo = foo_1;

	bar = stdenv.mkDerivation (finalAttrs: {
		pname = "bar";
		version = "1.0.0";
		src = ./bar;
		buildInputs = [ foo ];
		installTargets = [ "install-lib" ];
		passthru.dev = stdenv.mkDerivation {
			inherit (finalAttrs) pname version src;
			dontBuild = true;
			installTargets = "install-include";
		};
	});

	bazObj = stdenv.mkDerivation {
		pname = "baz";
		version = "1.0.0";
		src = ./baz;
		buildInputs = [ bar.dev ];
		buildPhase = ''
			runHook preInstall
			make baz.o SHELL="$SHELL"
			runHook postInstall
		'';
		installPhase = ''
			runHook preInstall
			install -Dm644 baz.o Makefile -t $out
			runHook postInstall
		'';
	};

in
stdenv.mkDerivation {
	inherit (bazObj) pname version;
	src = bazObj;
	buildInputs = [ bar.out ];
	meta = bazObj.meta // { mainProgram = "baz"; };
}
```

Notice that you have to use `bar.out` instead of just `bar` in `buildInputs` of `baz`
because `stdenv.mkDerivation` "cleverly" selects `bar.dev` when it sees `bar` in `buildInputs`.

Again, this packaging needs some further polishing, but it explains the idea
of separating compiling and linking.
You may try switching from `foo = foo_1` to `foo = foo_2`,
and `baz` will only be compiled once.

</details>

This looks good, but here is the bad news:
none of GNU Autotools, pkg-config, or CMake is designed with the idea
that compiling and linking may happen in different environments.
The configure script typically tries to compile and link small programs
to test whether the build environment has all the required header files and library files.
If compiling and linking are in separate environments,
we really need two different configure scripts,
one for checking compilers and header files and the other for checking linkers and library files.
The problem about pkg-config is that the `.pc` files contain information about
both the header files and the library files.
Then, since `libbar.pc` has to live in `bar.dev`, this means that `bar.dev`
has to reference `bar.out` and ultimately references `foo`.
As for CMake, it is possible to patch CMake
to ask it to always look for `INTERFACE` libraries whenever the CMake script uses `add_library`
and have the properties `INTERFACE_INCLUDE_DIRECTORIES` or `IMPORTED_LOCATION` defined
according to whether it is in the compiling builder or the linking builder.
However, this is still a mess and requires workarounds on a case-by-case basis.

The only way to solve this problem is again using stubs.
This time, the stub derivations are much more complicated than the ones
for simple store path replacements.
This time, the stub derivations have to have libraries that actually contains the symbols
against which the linker can link the object files.
If there were a tool that can generate stub libraries from header files,
a generally useful definition of such stub derivations could in principle be implemented.
However, considering the diversity of header files in C/C++ header files,
such a tool is very hard to implement.
If we do not restrict ourselves to keeping Nix unchanged, however,
there is a way out of this: making Nix store paths content-addressed instead of input-addressed.
Generating stubs from header files is difficult,
but generating stubs from library files is much easier.
Although the library files change when some dependency updates,
the stubs generated from the library files will not change.
If Nix store paths were content-addressed, this would be an ideal way of
generating and using stub libraries.

## Ditching check phases

At first glance, it seems that it cannot be helped if
a depended software actually runs in the dependent builder.
However, a lot of such dependencies that cause mass rebuilds are actually only for tests,
used in the check phase,
especially things like `gtest`.
Changes in such depended packages usually do not change the output of the dependent derivation.
Conceptually, if a tool used for testing gets an update,
we do not have to rebuild a software that uses it for tests
but only have to test the built software again with the new test tools.

Take a simple example here again.
Let us say `foo` is a test helper that compares the standard output of an executable
with an expected value,
and `bar` is a very simple program that outputs `hello` to the standard output.
In the install check phase of `bar`, we use `foo` to test that the output of the executable
is indeed `hello`.
Typically for this case, in Nixpkgs, `foo` enters the `nativeInstallCheckInputs` of `bar`,
so `bar` needs a rebuild when `foo` updates.

<details><summary>Supposed packaging in Nixpkgs</summary>

```nix
# bar.nix
{
	stdenv,
	writeShellScriptBin,
	runtimeShell,
}:

let
	foo_1 = writeShellScriptBin "foo" "[ `$1` = $2 ]";
	foo_2 = writeShellScriptBin "foo" "[[ `$1` == $2 ]]";
	foo = foo_1;
in
stdenv.mkDerivation {
	pname = "bar";
	version = "1.0.0";
	dontUnpack = true;

	buildPhase = ''
		runHook preBuild
		sleep 5 # simulate time-consuming building process
		runHook postBuild
	'';

	installPhase = ''
		runHook preInstall
		mkdir -p $out/bin
		echo '#!${runtimeShell}' > $out/bin/bar
		echo 'echo hello' >> $out/bin/bar
		chmod +x $out/bin/bar
		runHook postInstall
	'';

	doInstallCheck = true;
	nativeInstallCheckInputs = [ foo ];
	installCheckPhase = ''
		runHook preInstallCheck
		foo $out/bin/bar hello
		runHook postInstallCheck
	'';
}
```

<p class="no-indent">
To build it, run
</p>

```bash
nix-build -E '(import <nixpkgs> {}).callPackage ./bar.nix {}'
```

<p class="no-indent">
After that, you can run `bar` by running `result/bin/bar`.
Observe that `bar` needs rebuilding when you switch from `foo = foo_1`
to `foo = foo_2`.
</p>

</details>

For this example, preventing rebuilding is very simple: simply remove the install check phase.
However, tests are still important, so we still need to include them somewhere.
Fortunately, people conventionally put such tests in `passthru.tests` for this very purpose.
Therefore, all we have to do is to put the tests in `passthru.tests` instead.

<details><summary>Supposed packaging in Nixpkgs</summary>

```nix
# bar.nix
{
	stdenv,
	writeShellScriptBin,
	runtimeShell,
	runCommand,
}:

let
	foo_1 = writeShellScriptBin "foo" "[ `$1` = $2 ]";
	foo_2 = writeShellScriptBin "foo" "[[ `$1` == $2 ]]";
	foo = foo_1;

	bar = stdenv.mkDerivation {
		pname = "bar";
		version = "1.0.0";
		dontUnpack = true;

		buildPhase = ''
			runHook preBuild
			sleep 5 # simulate time-consuming building process
			runHook postBuild
		'';

		installPhase = ''
			runHook preInstall
			mkdir -p $out/bin
			echo '#!${runtimeShell}' > $out/bin/bar
			echo 'echo hello' >> $out/bin/bar
			chmod +x $out/bin/bar
			runHook postInstall
		'';

		passthru.tests.installCheck = runCommand "bar-installCheck" {
			nativeBuildInputs = [ foo bar ];
		} "foo bar hello && touch $out";
	};
in bar
```

<p class="no-indent">
To run the test, run
</p>

```bash
nix-build -E '((import <nixpkgs> {}).callPackage ./bar.nix {}).tests.installCheck'
```

Now, `bar` does not need rebuilding when `foo` updates,
but only `bar.tests.installCheck` needs rebuilding.

</details>

Moving the check phase to `passthru.tests`, however, is more difficult.
The reason is that the configure script will disable the tests in `Makefile`
if it cannot find the test dependencies.
This, again, can be solved by using stub libraries for the test dependencies,
but there is an easier solution.
First, copy everything (configure script, source code, and built binaries)
to the environment with test dependencies.
Then, run the configure script again to generate a new `Makefile`.
Then we can run the check phase.
Hopefully, nowhere in the source code does it use test-related macros.

If we ditch the check phases and the install check phases
and move all of them to `passthru.tests` like this, a lot of rebuilds can be avoided.

Notice that avoiding rebuilds due to test depenencies is also related to
content-addressed derivations.
In a content-addressed model,
if `foo` is a test dependency of `bar`, and `bar` is a build dependency of `baz`,
then `baz` does not need rebuilding if `foo` gets an update
because it does not change the output of `bar`.
However, `bar` still needs a rebuild, which is unnecessary
if it does not use check phases and install check phases but use `passthru.tests`.

## Conclusion

I proposed some ways to reduce mass rebuilds without changing Nix.
However, each of them has some downsides and requires major refactoring of Nixpkgs.
