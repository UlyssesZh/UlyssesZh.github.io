---
title: Imperative programming in Nix language
date: 2025-11-06 23:47:51 -0800
categories:
- programming
tags:
- nix
- functional programming
layout: post
excerpt: 'Nix is a functional programming language primarily used for package management and system configuration.
However, it may be interesting to emulate imperative programming constructs within Nix.
This post explores how to achieve imperative-style programming in Nix.'
---

Nix, a purely functional language best known for describing reproducible systems,
seems to have just enough power to *model* imperative behavior.
This article walks through a small experiment: an embedded DSL in Nix
that lets you write programs with imperative features, such as
mutable variables, loops, exceptions, functions, and I/O.

This article is an expansion of my earlier
[forum post](https://discourse.nixos.org/t/interactive-program-written-in-nix-lang/71536)
about writing an interactive program in Nix.

## Assign and print

Monads are the standard abstraction for mutation of states.
A monad wraps values with extra information (such as side effects).
A monadic operation can be seen as a function from some *state* to a new *state*,
possibly with side effects encoded as data rather than real I/O.

This DSL adopts that idea.
Each statement is a function of a state
that returns an instruction of how to mutate the state.
Consider this `do` function that "executes" a statement:

```nix
do = statement: state: state // statement state state;
````

<p class="no-indent">
Each statement receives the current state and returns a function that mutates the current state into an updated one.
It is equivalent to a monadic bind, but the monads are very trivial here
because the unit operation is just the identity function.
</p>

Let us define some simple statements such as assignment and printing to the console:

```nix
#!/usr/bin/env nix-build

let
	do = statement: state: state // statement state state;
	assign = variables: state: state // variables;
	print = builtins.trace;

	state0 = { };
	state1 = do (state: assign { i = 1; }) state0;
	state2 = do (state: print "Current value: ${toString state.i}") state1;
	state3 = do (state: assign { i = state.i + 1; }) state2;
	state4 = do (state: print "Current value: ${toString state.i}") state3;

in builtins.seq state4 { }
```

<p class="no-indent">
The final `builtins.seq` call forces the final state to be evaluated
so that all the statements will be executed.
There is no need for a `builtins.deepSeq` because any data that we wish to see
via `print` will be force evaluated.
The output:
</p>

```plain
trace: Current value: 1
trace: Current value: 2
```

<p class="no-indent">
This is nice!
We can slightly modify `do` to make it handle a list of statements instead
so that we do not have to call `do` for each statement.
We can also rename `state` to just `_` so that the code does not look too verbose.
</p>

```nix
#!/usr/bin/env nix-build

let
	do = statements: _:
		if statements == [ ] then _
		else do (builtins.tail statements) (_ // builtins.head statements _ _);
	assign = variables: _: _ // variables;
	print = builtins.trace;

in builtins.seq (do [
	(_: assign { i = 1; })
	(_: print "Current value: ${toString _.i}")
	(_: assign { i = _.i + 1; })
	(_: print "Current value: ${toString _.i}")
] { }) { }
```

<p class="no-indent">
This gives the same output as before.
I used a recursion to iterate over the list of statements instead of just using `builtins.foldl'`
because this form is easier to be modified later to incorporate exception handling.
</p>

## Exception handling

Next, we add exception handling to the DSL.
I introduce it before control flow because I will make loops rely on exceptions to implement `break` and `continue`.

For simplicity, I will make throwing an exception just setting a special variable `_thrown_` in the state:

```nix
throw = thrown: assign { _thrown_ = thrown; };
```

<p class="no-indent">
(Notice that this shadows the built-in `throw` function,
so we will refer to the built-in one as `builtins.throw` if needed.)
In `do`, we need to check whether an exception has been thrown after each statement.
If so, we stop executing further statements.
</p>

```nix
do = statements: _:
	if statements == [ ] then _
	else let result = _ // builtins.head statements _ _; in
		if builtins.hasAttr "_thrown_" result then result
		else do (builtins.tail statements) result;
```

<p class="no-indent">
Then, in the `try` statement, we check for `_thrown_` after executing the `try` block.
If an exception was thrown, we execute the `catch` block with the exception value passed to it
(after unsetting the `_thrown_` variable).
</p>

```nix
try = statements: catch: _: let result = do statements _; in
	if builtins.hasAttr "_thrown_" result then
		do (catch result._thrown_) (removeAttrs result [ "_thrown_" ])
	else result;
```

<p class="no-indent">
With these definitions, we can now write code that throws and catches exceptions:
</p>

```nix
let # ...
in builtins.seq (do [
	(_: try [
		(_: throw "Some error message.")
	] (exception: [
		(_: print "Caught exception: ${exception}")
	]))
] { }) { }
```

## Control flow

The control flow statements include `if` and `while`,
and the latter is accompanied by `break` and `continue`.
Both of them needs a condition expression that evaluates to a boolean value.
The `while` condition will be evaluated multiple times for different states,
so it at least needs to be a function that maps the state to a boolean
instead of just a boolean.
While the `if` condition can be a simple boolean expression,
I will make it a function as well for consistency.

```nix
if' = condition: trueStatements: falseStatements: _:
	do (if condition _ then trueStatements else falseStatements) _;
whileWithoutJump = condition: body:
	if' condition [ body (_: whileWithoutJump condition body) ] [ ];
```

<p class="no-indent">
Now, to implement `break` and `continue`, we can use exception handling.
Define them as throwing special exception values:
</p>

```nix
break = throw "_break_";
continue = throw "_continue_";
```

<p class="no-indent">
Then, define `while` to use `try` to catch these exceptions.
The `"_continue_"` exception is caught inside the loop body,
and the `"_break_"` exception is caught outside the loop to terminate the loop.
</p>

```nix
catchOnly = handled: thrown: if thrown == handled then [ ] else [ (_: throw thrown) ];
while = condition: statements: try [
	(_: whileWithoutJump condition (_: try statements (catchOnly "_continue_")))
] (catchOnly "_break_");
```

We can now write some loops.

```nix
let # ...
in builtins.seq (do [
	(_: assign { i = 0; })
	(_: while (_: _.i < 5) [
		(_: if' (_: _.i == 4) [
			(_: break)
		] [ ])
		(_: if' (_: _.i == 2) [
			(_: assign { i = _.i + 1; })
			(_: continue)
		] [ ])
		(_: print "Current i: ${toString _.i}")
		(_: assign { i = _.i + 1; })
	])
] { }) { }
```

<p class="no-indent">
This prints:
</p>

```plain
trace: Current i: 0
trace: Current i: 1
trace: Current i: 3
```

## Functions

Defining functions is already possible without any special constructs,
but only `assign` and `do` is needed:

```nix
let # ...
in builtins.seq (do [
	(_: assign { hello = name: do [
		(_: print "Hello, ${name}!")
	]; })
	(_: _.hello "world")
] { }) { }
```

<p class="no-indent">
We can make it nicer by having it support `return` to exit early from the function.
Similar to `break` and `continue`, we can implement `return` using exceptions.
</p>

```nix
return = throw "_return_";
function = functions: assign (builtins.mapAttrs (name: fun: arg: try (fun arg) (catchOnly "_return_")) functions);
```

Then, we can define functions with `return` support:

```nix
let # ...
in builtins.seq (do [
	(_: function { hello = arg: [
		(_: if' (_: arg == "") [
			(_: print "What's your name?")
			(_: return)
		] [ ])
		(_: print "Hello, ${arg}!")
	]; })
	(_: _.hello "")
	(_: _.hello "world")
] { }) { }
```

<p class="no-indent">
This prints:
</p>

```plain
trace: What's your name?
trace: Hello, world!
```

## Input

We can use `builtins.readFile` to read input from files.
To read from stdin, we need to use Lix to do that
because the vanilla implementation of Nix
[does not](https://github.com/NixOS/nix/issues/9330)
support `builtins.readFile /dev/stdin`.

```nix
let # ...
	read = builtins.readFile;
in builtins.seq (do [
	(_: assign { input = read /dev/stdin; })
	(_: print "You entered: ${_.input}")
] { }) { }
```

Because `builtins.readFile` reads the entire file until EOF,
when you finish input, you need to send an EOF signal,
typically by pressing <kbd>Ctrl</kbd>+<kbd>D</kbd> on an empty line.
Notice that you need to press this combination on a empty line,
so the input you get in Nix probably ends with a newline character that you want to trim.

If you want to read from stdin multiple times,
to ensure that the Nix interpreter tries to reopen `/dev/stdin` each time,
you must not write `input = builtins.readFile /dev/stdin;` in the first `let` block
and refer to `input` every time you want to read from stdin.
Instead, you should use `read /dev/stdin` every time,
or wrap it in a function and call the function every time.

## Other minor improvements

We may want to separate all those things in the first `let` block
into a separate file, which let us call `imperative.nix`,
so that we do not need to write out all those things like `assign`, `print` every time we write an imperative program.
However, this would still mean that we have to pass a bunch of variables like this:

```nix
let
	inherit (import ./imperative.nix) do assign print throw;
	# ...
in builtins.seq (do [
	# ...
] { }) { }
```

<p class="no-indent">
One way to avoid this is to use `builtins.scopedImport` in `imperative.nix`,
but in my opinion, a better approach is to simply put all those things in the initial state `_`.
Now, the actually executable Nix file just contain the list of statements,
and `imperative.nix` will import it to run it.
All the keywords like `while` and `assign` become variables in `_`,
so nothing needs to be imported or scoped in the executable Nix file.
However, this would also mean that we need to `import` the program in `imperative.nix` instead of the other way around.
To make `imperative.nix` know which file to import,
we can provide it with an argument, so it looks like this:
</p>

```nix
{ input }: let # ...
in builtins.seq (
	do
	(import (if builtins.match input "^/" != null then input else "${toString ./.}/${input}"))
	{ inherit assign if' while print throw break continue return function read try; }
) { }
```

<p class="no-indent">
To run a program in `program.nix`, you need to run `nix-build imperative.nix --argstr input program.nix`.
You may encapsulate it in a shebang in `imperative.nix`:
</p>

```nix
#!/usr/bin/env nix-shell
#!nix-shell --pure -i "nix-build --no-out-link" -p lix
```

<p class="no-indent">
If you now make `imperative.nix` executable, you can run a program using `imperative.nix --argstr input program.nix`.
</p>

This now enables us to implement an `import` function that runs programs from other files:

```nix
import = file: do (builtins.import file);
```

<p class="no-indent">
(This shadows the built-in `import` function, so we will refer to the built-in one as `builtins.import` if needed.)
You can now do something like this:
</p>

```nix
# program.nix
[
	(_: _.import ./other-program.nix)
]
```

where the program written in another file is run:

```nix
# other-program.nix
[
	(_: _.print "Hello from other program!")
]
```

<p class="no-indent">
When you run `imperative.nix --argstr input program.nix`,
it will print:
</p>

```plain
trace: Hello from other program!
```

We may improve it further by removing the need of `--argstr input`
and also adding support for passing command line arguments to the program,
at the cost of having to write a little bit of shell script and jq in the shebang
(so really we cannot call it a "purely Nix" implementation now,
but the nix-shell shebang is simply too powerful):

```nix
#!/usr/bin/env nix-shell
#!nix-shell --pure -i "sh -c '_1=\$1; _2=\$2; shift 2; exec nix-build --no-out-link \"\$_1\" --argstr input \"\$_2\" --argstr argvJSON \"\$(printf \"%s\\\\0\" \"\$@\" | jq -Rsc \"split(\\\"\\\\u0000\\\")[:-1]\")\"' --" -p lix jq

{ input, argvJSON }: let # ...
	argv = builtins.fromJSON argvJSON;
in builtins.seq # ...
```

<p class="no-indent">
The mechanism is that the shell script in the shebang
extracts the first two command line arguments as the Nix file to run and the input file,
and the rest of the command line arguments are concatenated with null characters
and converted to a JSON array using `jq`.
In `imperative.nix`, we parse the JSON array back to a Nix list and
provide it as the variable `argv` in the initial state `_`.
You can now simply use a shebang `#!/usr/bin/env imperative.nix` in `program.nix`,
and then you can run it with `./program.nix arg1 arg2` if you make it executable,
and the command line arguments will be available in the list `_.argv`.
</p>

Finally, we can use `try` instead of `do` in the ultimate `builtins.seq` call
to catch any uncaught exceptions in the program.
Here is the final version of `imperative.nix`:

```nix
#!/usr/bin/env nix-shell
#!nix-shell --pure -i "sh -c '_1=\$1; _2=\$2; shift 2; exec nix-build --no-out-link \"\$_1\" --argstr input \"\$_2\" --argstr argvJSON \"\$(printf \"%s\\\\0\" \"\$@\" | jq -Rsc \"split(\\\"\\\\u0000\\\")[:-1]\")\"' --" -p lix jq

{ input, argvJSON }: let
	do = statements: _:
		if statements == [ ] then _
		else let result = _ // builtins.head statements _ _; in
			if builtins.hasAttr "_thrown_" result then result
			else do (builtins.tail statements) result;
	assign = variables: _: _ // variables;
	read = builtins.readFile;
	print = builtins.trace;
	if' = condition: trueStatements: falseStatements: _:
		do (if condition _ then trueStatements else falseStatements) _;
	whileWithoutJump = condition: body:
		if' condition [ body (_: whileWithoutJump condition body) ] [ ];
	catchOnly = handled: thrown: if thrown == handled then [ ] else [ (_: throw thrown) ];
	while = condition: statements: try [
		(_: whileWithoutJump condition (_: try statements (catchOnly "_continue_")))
	] (catchOnly "_break_");
	throw = thrown: assign { _thrown_ = thrown; };
	break = throw "_break_";
	continue = throw "_continue_";
	return = throw "_return_";
	try = statements: catch: _: let result = do statements _; in
		if builtins.hasAttr "_thrown_" result then
			do (catch result._thrown_) (removeAttrs result [ "_thrown_" ])
		else result;
	function = functions: assign (builtins.mapAttrs (name: fun: arg: try (fun arg) (catchOnly "_return_")) functions);
	import = file: do (builtins.import file);
	argv = builtins.fromJSON argvJSON;
in builtins.seq (
	try
	(builtins.import (if builtins.match input "^/" != null then input else "${toString ./.}/${input}"))
	builtins.throw
	{ inherit assign if' while print throw break continue return function read try import builtins argv; }
) { }
```

<p class="no-indent">
and an example `program.nix` that uses most of the features we introduced:
</p>

```nix
#!/usr/bin/env imperative.nix

[
	(_: _.import (_.builtins.toFile "other-input.nix" "[ (_: _.print \"Hello from other file!\") ]"))
	(_: _.function { hello = arg: [
		(_: _.if' (_: arg == "") [
			(_: _.print "What's your name?")
			(_: _.return)
		] [ ])
		(_: _.print "Hello, ${arg}!")
	]; })
	(_: _.hello "")
	(_: _.hello "World")
	(_: _.while (_: _.argv != [ ]) [
		(_: _.hello (_.builtins.head _.argv))
		(_: _.assign { argv = _.builtins.tail _.argv; })
	])
	(_: _.assign { i = 0; })
	(_: _.while (_: _.i < 5) [
		(_: _.if' (_: _.i == 4) [
			(_: _.break)
		] [ ])
		(_: _.if' (_: _.i == 2) [
			(_: _.assign { i = _.i + 1; })
			(_: _.continue)
		] [
			(_: _.hello "${_.builtins.toString _.i}")
		])
		(_: _.assign { i = _.i + 1; })
	])
	(_: _.try [
		(_: _.throw "Some error message.")
	] (exception: [
		(_: _.print "Caught exception: ${exception}")
	]))
	(_: _.print "Goodbye!")
]
```

<p class="no-indent">
When you run `./program.nix Kat "Ulysses Zhan"`, it will print:
</p>

```plain
trace: Hello from other file!
trace: What's your name?
trace: Hello, World!
trace: Hello, Kat!
trace: Hello, Ulysses Zhan!
trace: Hello, 0!
trace: Hello, 1!
trace: Hello, 3!
trace: Caught exception: Some error message.
trace: Goodbye!
```

## Possible improvements

Maybe I can improve it further by adding support for local variables.
It would also be nice if functions with side effects can also have return values,
but this would be tricky to implement.
