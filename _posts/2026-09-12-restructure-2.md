---
title: Reducing build time of my blog by 88% by optimizing cross-language invocations
date: 2026-09-12 20:06:46 +0800
categories:
  - update
tags:
  - jekyll
  - tex
  - update
  - web
layout: post
excerpt: >
  Waiting for my blog to build has been making writing articles unpleasant for me.
  In order to speed up the building, I revamped my Markdown engine to call Pandoc through FFI
  and call KaTeX through MiniRacer.
  I am careful to ensure that the cross-language invocations support multithread operations.
  This reduces the build time of the full site in production configurations
  on the CI machine (GitHub provided runners)
  from 156 seconds to 19 seconds, marking a 88% reduction.
---

## Introduction

In a past [post]({% post_url 2023-11-06-restructure %}), I shared my experience of restructuring my blog
to use Pandoc and $\KaTeX$ to convert the articles from Markdown to HTML.
However, the cost is that building the blog becomes very slow.
I developed a [plugin](https://github.com/UlyssesZh/UlyssesZh.github.io/issues/95)
to make Jekyll support multithread rendering, but the boost is not enough.
Generating the full site in production configurations takes 49 seconds on my local development machine
and 156 seconds on the CI machine (GitHub Actions runners provided by GitHub).

The main reason of the slow building is the slow conversion from Markdown to HTML.
The full pipeline of converting a piece of Markdown into HTML is as follows.
Paru invokes Pandoc CLI. Then, Pandoc CLI invokes three filters:
my Pandoc filter written in Ruby, pandoc-crossref written in Haskell,
and pandoc-katex written in Rust (which in turn invokes JavaScript codes using QuickJS),
the input and output of each of which are JSON representation of Pandoc AST.
The order of languages being executed is Haskell, Ruby, Haskell, native (Rust) (embedded JavaScript).
A lot of repetitive work is done for each converted document:

- Spawning a Haskell process (Pandoc CLI).
- Spawning a Ruby process and loading gems (Paru and Rouge).
- Spawning another Haskell process (pandoc-crossref).
- Sawpning a native binary (pandoc-katex) that initializes a JavaScript engine (QuickJS).
- Serialize and deserialize the entire AST to JSON between every two steps.

## Optimization of calling JavaScript

The most natural idea is simply to ditch pandoc-katex and directly call JavaScript from Ruby.

At first I thought it might be difficult because it is quite complicated
to achieve multithread parallellism in Node.js.
However, it seems that multithread parallellism is quite easy with MiniRacer
(much easier than in Node.js)
because different JavaScript contexts can run parallelly in different threads.
However, calling functions in the same JavaScript context from different threads
does not make the function calls parallel but merely concurrent.

I note that `require` and `import` does not work in MiniRacer,
so I have to bundle all dependencies into one JavaScript file.
I can achieve this using esbuild.

The Pandoc filter for rendering math equations can now be written in Ruby.
The order of executed languages is now
Haskell, Ruby, Haskell, and Ruby (embedded JavaScript).
I then should reorder the filters so that the two Ruby filters can be combined
so that the order of executed language can then be
Haskell, Haskell, and Ruby (embedded JavaScript).
The reason that my custom Ruby filter was before pandoc-crossref was that
pandoc-crossref introduces `MetaInlines` nodes, which greatly
[reduces](https://github.com/htdebeer/paru/issues/91#issuecomment-3315990670)
performance of Paru filters
by having it spawning additional Pandoc CLI processes.
Therefore, to make this reorder, I also need to ditch Paru for writing the filter.
Fortunately, writing a custom Pandoc filter without an external library is quite easy.

I also note that, to avoid repeatedly serializing the same $\KaTeX$ rendering options,
I should pass the options only once to each JavaScript context.

## Optimization of calling Haskell

How to reduce the startup overhead when using Pandoc with JSON filters to convert a large amount of documents?
I thought of a few candidates that may not work:

- Using Lua filters: Pandoc has built-in Lua interpreter,
  so using Lua avoids JSON serialization and spawning external processes.
  However, this is not possible because of the complexity of Rouge and pandoc-crossref.
- Using Pandoc server: This keeps Pandoc process running to avoid the startup overhead of Pandoc CLI.
  It introduces overhead due to network protocols, but it is much smaller.
  However, the improvement is limited because the major overhead is in spawning filter processes.
- Batching documents: Combining multiple Markdown documents into one large
  Markdown and then split out separate HTML codes from the resultant HTML
  greatly reduces the number of spawned processes.
  However, this requires major rewriting of the filters and Jekyll itself,
  which imposes huge maintenance workload in the future.

It seems that the only way out is to write my own program in Haskell for document processing,
using Pandoc and pandoc-crossref as libraries.
There are two ways that it may work:

- A custom server with IPC: I can write a separate program at standby, handling requests from Jekyll and returning converted documents.
  Each program handle requests from one Ruby thread, and they communicate with Jekyll through Unix domain socket.
- An FFI library: I can write a library that can be called using FFI.
  If compiled with the `-threaded` flag of GHC, the functions can be invoked parallelly in different threads.
  Note that one needs to initialize the Haskell RTS with the same number of capabilities as threads in the Ruby side
  ([document](https://wiki.haskell.org/index.php?title=Foreign_Function_Interface#Enhancing_performance_and_advanced_topics)).

<p class="no-indent">
Both approaches are actually straight forward,
but it is not obvious which one should have higher performance.
For the IPC approach, there is the process startup overhead of the Haskell program for each Ruby thread,
and there is the overhead of IPC.
For the FFI approach, there is the overhead of managing bound threads and parallellism.
</p>

Before I decided, I asked an AI agent to write a
[benchmark](https://github.com/UlyssesZh/call-haskell-from-ruby)
to compare the two different approaches.
The result is that the FFI approach performs better in most cases,
so I decided to take the FFI approach.

## Optimization of serialization

MessagePack is faster than JSON, so using MessagePack instead of JSON is an improvement.

I also avoid sending configuration options through cross-language barriers.
Instead of calling `convert(payload, options)` from Ruby,
call `init(options)` once and then `convert(payload)` afterwards.
This makes sure that the same options are only serialized at most once.
For JavaScript, one can simply store the options in a local variable.
For Haskell, there are several ways for storing some persistent data:
`IORef`, `MVar`, and `StablePtr` are all viable solutions,
between which there should be negligible difference in terms of performance.

The data flow between language barriers for each document conversion is now as follows:

- Ruby to Haskell: raw string (Markdown).
- Haskell to Ruby: MessagePack (AST).
- Ruby to JavaScript: multiple raw strings ($\TeX$).
- JavaScript to Ruby: multiple raw strings (HTML).
- Ruby to Haskell: MessagePack (AST).
- Haskell to Ruby: raw string (HTML).

<p class="no-indent">
As we can see, there are only two serializations and deserializations for the full AST.
All other cross-language communications are direct string copying.
</p>

## Result

The time spent on generation of the full site in production configurations on the CI machine
(GitHub provided runners for GitHub Actions) before and after the revamp on the Markdown engine
is 156 seconds and 19 seconds respectively, marking a 88% reduction.

## Local development

For local development, I usually only edit one post at a time,
so it should not be necessary to build the full site.
Fortunately, Jekyll has the feature of incremental build,
which only renders the documents that depend on the changed files.
However, for changes in a single blog article,
besides the article itself,
there are actually a lot of things that get rebuilt because they all depend on the article:

- Homepage.
  The homepage lists articles, so any change in any article changes the homepage.
  Note that because the homepage is paginated, every paginated page of the homepage gets rebuilt.
- Archives.
  In my blog, the archives are lists of articles categorized by dates, categories, and tags.
  Because changing one article modifies the full list of articles, all archive pages are rebuilt.
- Atom feed.
  The Atom feed directly contains the HTML contents of articles,
  so it gets rebuilt when an article changes.
- All articles.
  It sounds absurd at first, but you may note that there are navigation links
  to the previous article and the next article at the bottom of every article page.
  This makes all articles depend on each other.

The cost of rendering the homepage is still manageable, so I passed it for now.
However, the other items are quite slow to generate because of the large amount of contents.
I added some patches to Jekyll and some Jekyll plugins to disable the archives and the Atom feed
and to cut the dependency between articles
when some environment variables are set.

Now, the time for incremental build of the site when one article is changed
is 0.3 seconds on my development machine.
It is now on the level of Jekyll without any plugins.
