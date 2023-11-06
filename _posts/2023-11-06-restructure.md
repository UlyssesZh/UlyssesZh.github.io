---
title: I restructured my blog
date: 2023-11-06 00:06:52 -0800
categories:
- update
tags:
- jekyll
- tex
- update
- web
layout: post
excerpt: 'If you have not noticed, the equations on my blog are now rendered server-side.
This change makes it possible for those who turn off JavaScript on their browsers to see the equations.
I also updated the theme from Minima v2 to Minima v3.'
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

Then, I thought, what is stopping me to render equations server-side on my blog?
I then started the migration.

### The painful building

The easiest way to switch to server-side equation rendering is just to use
[kramdown-math-katex](https://github.com/kramdown/math-katex){target="_blank"}.
Install the gem, add an option
`math_engine: katex` into the Kramdown configurations of `_config.yml`,
add the needed CSS to the theme, and...
What is my computer doing? It is just stuck at building the site!

By adding the `--verbose` option to the `jekyll serve` command, I can see what it was doing.
I can see that it is never stuck on any step, but rendering each article that has equations
(especially those with a ton of ones) takes seconds.
Because I have dozens of articles with equations, it takes minutes to build the site.
It seems that
although KaTeX has always been advertising itself as the fastest math typesetting library for the web,
it is not fast enough for me to use it to render equations server-side.

A way to mitigate this issue is to use the `--incremental` option of `jekyll serve`.
This makes the building much faster except the first time.
I can also expect Jekyll to support [lazy building](https://github.com/jekyll/jekyll/issues/9434){target="_blank"}
in the future, which will entirely skip the building phase and build the files as needed on the fly.

I found another way to partially mitigate this issue.
On my blog, I have been extensively utilizing the `markdownify` filter to render Markdown inside the templates,
including the title of the posts, the excerpt of the posts, and something else.
Those are rendered in multiple places, including the homepage, the archive page, the RSS feed, and the search page.
Since now rendering Markdown is being very slow, I decided to cache the rendered Markdowns.
A very simple strategy is as follows:

```ruby
def markdownify input
	UlyssesZhan.markdown_snippet_cache[input] ||= Filters.instance_method(:markdownify).bind_call self, input
end
```

Also, for most of the time I actually do not need to see the Markdown styling in the titles and excerpts,
so I can also disable the `markdownify` filter depending on the site configuration, like this:

```ruby
def markdownify input
	return input if @context.registers[:site].config['avoid_markdown']
	UlyssesZhan.markdown_snippet_cache[input] ||= Filters.instance_method(:markdownify).bind_call self, input
end
```

If I do not want to modify the site configuration file, I can also utilize an environment variable.
I can use a [after-init hook](https://jekyllrb.com/docs/plugins/hooks/#built-in-hook-owners-and-events){target="_blank"}
to set the configuration item based on the environment variable.

Rendering archives has also been very slow even with this Markdown disabling trick (for some reason I do not know).
I decide to use another environment variable to disable the rendering of archives.
Change the line `gem 'jekyll-archives'` in Gemfile to this:

```ruby
gem 'jekyll-archives', install_if: !ENV['JEKYLL_NO_ARCHIVE']
```

By using `--incremental` and these two tricks together, I can finally build the site in seconds
if I only modify one post during `jekyll serve`.

### Cross-referencing

It seems that I cannot cross-reference equations using server-side means.
First, [KaTeX does not support cross-referencing](https://github.com/KaTeX/KaTeX/issues/2003){target="_blank"},
and the current workarounds are not acceptable for my use cases.

I then looked at [kramdown-math-mathjaxnode](https://github.com/kramdown/math-mathjaxnode){target="_blank"},
which uses the MathJax Node library to render equations server-side.
The MathJax Node library itself does support rendering equation numbers,
but kramdown-math-mathjaxnode does not support cross-referencing either.
What is worse is that it has not been maintained for years,
which means I probably had to rewrite the plugin myself, but I did not have spare time.

Even worse, Kramdown is just not suitable for implementing cross-referencing.
I briefly looked at Kramdown's source codes, and I realized that if I was about to write a math engine for Kramdown
to support cross-reference, I would have to refactor Kramdown a bit.
Actually, cross-referencing is quite a non-trivial feature for markup languages because of references
that cannot be resolved during the first compilation.
In $\LaTeX$, those references are resolved in the second compilation.
I would need to refactor Kramdown to support a similar workflow to make it possible to implement cross-referencing.

Then, I looked at other Markdown engines.
For Ruby, the only successful Markdown engine besides Kramdown that I know was
[Redcarpet](https://github.com/vmg/redcarpet){target="_blank"}
(it used to be the default Markdown engine of Jekyll),
and it was not designed with cross-referencing in mind either.
Its developer even
[rejected to support math-related features](https://github.com/vmg/redcarpet/issues/313#issuecomment-35110367){target="_blank"}
a long time ago.

This is why I looked at non-Ruby Markdown engines.
The first option that I came up with and also the option that I finally chose is
[Pandoc](https://pandoc.org){target="_blank"}.

Pandoc is power in that its form of customization is *filters*,
which transforms the whole parsed AST of the document.
Because the whole AST is visible at once for a filter, it is then possible to implement cross-referencing by using a filter.
Fortunately, someone has already written such a filter, and it is called
[pandoc-crossref](https://github.com/lierdakil/pandoc-crossref){target="_blank"}.
What is good about this approach is that it is independent of the math engine that I use:
I can use MathJax or KaTeX, client-side or server-side, and it does not matter.
The only drawback about it is that
it does not support cross-reference a particular line in `align` or `eqnarray` environment,
which is a feature that I have used in some of my posts.
I have to reword those posts to avoid using that feature.

Now that we have a filter, we then need a way to let Pandoc render the math expressions server-side.
Fortunately (again), someone has already written a filter for this purpose, and it is called
[pandoc-katex](https://github.com/xu-cheng/pandoc-katex){target="_blank"}.
Append this filter after the pandoc-crossref filter, and we are done.

The drawback about Pandoc is that it has no Ruby implementations,
which means the only way to utilize Pandoc in Jekyll is to write a wrapper of it in Ruby and develop a Jekyll plugin
for using that wrapper of Pandoc as the Markdown engine.
Fortunately, someone has already done this:
the wrapper is called [pandoc-ruby](https://github.com/xwmx/pandoc-ruby){target="_blank"},
and the Jekyll plugin is called [jekyll-pandoc](https://github.com/mfenner/jekyll-pandoc){target="_blank"}.

Although the math rendering problem is solved, a somewhat unrelated problem arises:
Pandoc does not use [Rouge](https://github.com/rouge-ruby/rouge){target="_blank"}
to highlight code blocks, but I like Rouge.
Unfortunately, no one has written a Pandoc filter to use Rouge to highlight code blocks for me;
but fortunately, I can write one myself quickly because it is easy enough, especially if I utilize
[Paru](https://github.com/htdebeer/paru){target="_blank"},
which contains an API library to help me with writing Pandoc filters in Ruby.

Paru is actually an alternative to pandoc-ruby.
Now that I also use Paru, I started to wonder if I should use pandoc-ruby at all.
Considering that jekyll-pandoc has not been maintained for years,
I decided to write my own Jekyll plugin to use Paru as the Markdown engine, and the simple plugin
is called [jekyll-paru](https://github.com/UlyssesZh/jekyll-paru){target="_blank"}.

### Tedious work of reformatting the old posts

Using kramdown-math-katex is the only option that I do not need to adjust most of my posts.
Another option, [jekyll-katex](https://github.com/linjer/jekyll-katex/){target="_blank"},
is not compatible with the markup that I use to write equations.
I could not either just wrap the whole `{% raw %}{{ content }}{% endraw %}`
inside the `{% raw %}{% katexmm %}{% endraw %}` block (due to some errors that I do not know),
and the error messages then were impossible to utilize to help me locate the incompatibilities.

For the option that I finally use, Pandoc, I also have to adjust most of my posts.
The major incompatibility is that I need to change all `\label` and `\ref` to
the format recognizable by pandoc-crossref.
Another incompatibility is that I need to use `{target="_blank"}` instead of `{:target="_blank"}`
to indicate a link to be opened in a new tab
(as well as other HTML attributes that I use this syntax to embed in Markdown).
Also, Pandoc does not allow blank lines inside math display blocks, which I have used in some of my posts
(by the way, $\LaTeX$ does not allow those blank lines either, which is pretty annoying).

I then wrote a simple script that use regular expressions to help me with this refactoring task.
However, because of the diversity of the syntaxes that I used, I still need to check the posts manually
after I ran the script.
This makes the refactoring task still very tedious.

### The much more complicated GitHub Actions workflow

Now, to build my site, the machine needs pandoc, pandoc-crossref, and pandoc-katex,
none of which are Ruby Gems.
I need to set up Haskell environment and Rust environment to install them.
In GitHub Actions, I can use [haskell-actions/setup](https://github.com/haskell-actions/setup){target="_blank"}
to set up Haskell environment
and [cargo-install](https://github.com/baptiste0928/cargo-install){target="_blank"}
to install Cargo packages.

I do not know how I managed to make the GitHub Actions workflow file work expectedly at one shot,
but I did.

### Table of contents and searching

I have been using [jekyll-toc](https://github.com/toshimaru/jekyll-toc){target="_blank"} to generate
the table of contents for each post.
The problem with using it now is that it strips the HTML in headings and only keeps the text,
so headings with math expressions will not be rendered with nice math typesetting.
It was not a problem previously because the client-side math rendering script will render the math expressions
in the table of contents.
Now that I switched to server-side math rendering, I had to patch jekyll-toc to make it work.

The search functionality was implemented by myself.
It is a simple client-side searching powered by [Lunr](https://lunrjs.com){target="_blank"}.
I also had to refactor the search functionality a bit to make the search results be rendered with math expressions
(which were previously also handled by the client-side math rendering script).

## Updating the theme

The reason that I updated the theme is actually quite dramatic.
This originated from me trying to use kramdown-math-katex.
To ensure that the KaTeX CSS has the correct version with the KaTeX renderer used by katex-ruby,
I decided to `@import` the
[SCSS file](https://github.com/glebm/katex-ruby/blob/main/vendor/katex/sprockets/stylesheets/_katex.scss){target="_blank"}
found in the repo of katex-ruby into my theme.
I found that the SCSS file utilizes a function `asset-path` to load the fonts,
but my CSS pre-processor does not support it,
so I tried to extend my CSS pre-processor.

Jekyll uses [jekyll-sass-converter](https://github.com/jekyll/jekyll-sass-converter){target="_blank"}
to render CSS files, which once (v2) used [sassc](https://github.com/sass/sassc-ruby){target="_blank"},
but now (v3) uses [sass-embedded](https://github.com/ntkme/sass-embedded-host-ruby){target="_blank"}.
The former does not support extension of custom SCSS functions, but the latter does.
Therefore, I need to upgrade my jekyll-sass-converter to v3.
I actually could have upgraded it earlier because I have been using Jekyll v4 for a long time,
but I deliberately kept using jekyll-sass-converter v2 because
[jekyll-action](https://github.com/helaili/jekyll-action){target="_blank"},
which I used, had [an issue about using sass-embedded](https://github.com/helaili/jekyll-action/issues/150){target="_blank"}.
However, I have long ago migrated from jekyll-action to GitHub's official
[upload-pages-artifact](https://github.com/actions/upload-pages-artifact){target="_blank"},
so I can now upgrade jekyll-sass-converter to v3.

Then why does this have anything to do with the theme I used
(which is [Minima](https://github.com/jekyll/minima){target="_blank"})?
After I upgraded jekyll-sass-converter to v3, I found that there are some
[deprecation warnings in the SCSS files](https://github.com/jekyll/minima/issues/709){target="_blank"}
(they are actually already fixed, but I do not know why the issue is still open).
This was also when I noticed that Minima has not released a new version **for 4 years**,
and the last stable release is v2.5.1.

Then, how did I upgrade to Minima v3?
I actually just tried to use the master branch of the Git repo of Minima,
and I found that it was great.

### Placeholder files for customization

I am glad to see Minima v3 introduced the include `custom-head.html` which allows for custom additional HTML metadata
and the SCSS file `minima/custom-variables.scss` and `minima/custom-styles.scss` which allows for custom SCSS rules
to override the default ones.

Although it took me some time to migrate my already present SCSS files and HTML metadata to the new structure,
I am glad that Minima adopted this new structure that is more useful and more modern.

### Skins

Another feature that I really like about Minima v3 is the support of skins.
Minima now comes with several pre-defined skins which I can choose from.
The default skin called `classic` is the one that originated from Minima v2,
based on which I wrote my own skin.

I still remember a long time ago I tried to make my site support dark theme.
It was such a pain because there are so many colors hardcoded in the theme
so that I have to rewrite a large part of the SCSS files provided by Minima to support dark theme.
Now, Minima v3 has a pre-defined skin called `auto`, which adaptively looks the same as `classic` or `dark`
based on the browser's `prefers-color-scheme`.
I can now implement my skin based on `auto` (select my skin in the site's configuration file
and `@import` the `auto` skin in my skin's SCSS file),
and the codes are now much cleaner.
