---
title: I restructured my blog but not quite
date: 2023-11-03 20:21:27 -0700
categories:
- update
tags:
- jekyll
- tex
- update
layout: post
excerpt: 'At first, I wanted to let the equations on my blog be rendered server-side,
but several reasons prevented me from doing so.
However, I upgraded the theme used by my blog from Minima v2 to Minima v3.'
---

## Rendering equations server-side

I have been using [MathJax](https://mathjax.org){target="_blank"}
as a client-side equation renderer to render equations on my blog for a long time.

The main problem about the client-side rendering is that it makes people that turn off JavaScript on their browsers
(e.g. for privacy reasons) unable to see the equations in my articles.
Another problem is that it is annoying to wait for the browser to render all the equations,
especially if the site owner could have rendered them for you.

I actually have had some experience in server-side equation rendering in Jekyll.
In [a past post]({% post_url 2022-11-08-math-emails %}),
I talked about how I used Jekyll and [KaTeX](https://katex.org){target="_blank"}
to render equations in emails server-side.
For the [website of Sunniesnow](https://sunniesnow.github.io){target="_blank"}
(see [here]({% post_url 2023-09-08-sunniesnow %}) for a related post),
I use [jekyll-katex](https://github.com/linjer/jekyll-katex/){target="_blank"}
to render the equations server-side.

Then, I think, what is stopping me to render equations server-side on my blog?
I then started the migration.

### The painful building

The easiest way to switch to server-side equation rendering is just to use
[kramdown-math-katex](https://github.com/kramdown/math-katex){target="_blank"}.
Install the gem, add an option
`math_engine: katex` into the Kramdown configurations of `_config.yml`,
add the needed CSS to the theme, and...
What was my computer doing? It was just stuck at building the site!

By adding the `--verbose` option to the `jekyll serve` command, I could see what it was doing.
I could see that it was never stuck on any step, but rendering each article that has equations
(especially those with a ton of ones) takes seconds.
Because I had dozens of articles with equations, it took minutes to build the site.
It seems that
although KaTeX has always been advertising itself as the fastest math typesetting library for the web,
it is not fast enough for me to use it to render equations server-side.

A way to mitigate this issue is to use the `--incremental` option of `jekyll serve`.
This makes the building much faster except the first time.
I can also expect Jekyll to support [lazy building](https://github.com/jekyll/jekyll/issues/9434){target="_blank"}
in the future, which will entirely skip the building phase and build the files as needed on the fly.
However, these solutions are not viable when I actually publish new articles on my blog because
I use GitHub Actions to build my blog and publish it to GitHub Pages.

### Tedious work of reformatting the old equations

I then hopelessly wanted to see whether [jekyll-katex](https://github.com/linjer/jekyll-katex/){target="_blank"}
would be any better in terms of build time.
However, the markup that I used to write equations in my article was not compatible with this plugin.
I had to reformat all the equations in my articles to make them compatible.
It would be a definitely tedious work to do.
I could not either just wrap the whole `{% raw %}{{ content }}{% endraw %}`
inside the `{% raw %}{% katexmm %}{% endraw %}` block
because the error messages then were impossible to utilize to help me locate the incompatibilities.

Considering that I am busy recently and that it would probably
still be very slow to build even if I successfully migrated,
I decided to give up reformatting the equations.

### Impossibility of cross-referencing

The real deal-breaker was that I cannot cross-reference equations using server-side means.
First, [KaTeX does not support cross-referencing](https://github.com/KaTeX/KaTeX/issues/2003){target="_blank"},
and the current workarounds are not acceptable for my use cases.

I then looked at [kramdown-math-mathjaxnode](https://github.com/kramdown/math-mathjaxnode){target="_blank"},
which uses the MathJax Node library to render equations server-side.
However, it does not support cross-referencing either, and what is worse is that it has not been maintained for years,
which means I probably had to rewrite the plugin myself, but I did not have spare time.

Even worse, Kramdown is just not suitable for implementing cross-referencing.
I briefly looked at Kramdown's source codes, and I realized that I was about to write a math engine for Kramdown
to support cross-reference, I would have to refactor Kramdown a bit.
Actually, cross-referencing is quite a non-trivial feature for markup languages because of references
that cannot be resolved during the first compilation.
In $\LaTeX$, those references are resolved in the second compilation.
I would need to refactor Kramdown to support a similar workflow to make it possible to implement cross-referencing.

Then, I looked at other Markdown engines.
For Ruby, the only successful Markdown engine besides Kramdown that I know was
[Redcarpet](https://github.com/vmg/redcarpet){target="_blank"} (default Markdown engine of Jekyll),
and it was not designed with cross-referencing in mind either, and its developer even
[rejected to support math-related features](https://github.com/vmg/redcarpet/issues/313#issuecomment-35110367){target="_blank"}
a long time ago.
Maybe I will look into [Marked](https://marked.js.org/){target="_blank"}
and [Pandoc](https://pandoc.org/){target="_blank"} in the future.
