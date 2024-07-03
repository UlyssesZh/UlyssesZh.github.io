---
title: Typesetting math in emails
date: 2022-11-08 11:12:09 -0800
categories:
- programming
tags:
- jekyll
- ruby
- tex
layout: post
excerpt: 'After some comparison among solutions, I use KaTeX to typeset math in my emails.'
---

After I become a university student,
I start to heavily rely on emails to communicate with professors or teaching assistants.
However, there is a problem around this form of communication
considering that I am physics major:
I cannot typeset math in emails.

Emails normally have two types of message body: plain text and HTML.
Plain text is just plain text, we do not expect it to have any typesetting ability itself.
However, HTML is a much more capable content type.

In theory, we should be able to ask the HTML renderer to typeset math
by using [`<math>` elements](https://developer.mozilla.org/en-US/docs/Web/MathML/Element/math) (MathML).
However, modern browsers generally do not support them by default.
As for today (when this post is created),
the only modern browsers that support MathML without modifications are Firefox and Safari.
Chrome, Edge, and Opera support MathML only when
the `#enable-experimental-web-platform-features` preferences are set to `Enabled`.
Supporting for MathML is even worse if we are considering mobile browsers or email clients.
Therefore, MathML should not be our first choice
although it could have been the most elegant way.

The next choice is to use `<img>` or `<svg>` elements.
There are two ways of doing this:
host a server that has API to convert math to images;
or, write a program to generate the email with all images generated
(as image data URLs or `<svg>` elements) as well
(actually I have already found a solution for such programs:
[mathematical](https://rubygems.org/gems/mathematical)).
The first way have the following disadvantages:

- It requires me to either use some third-party service (like [CODECOGS Equation Renderer](https://latex.codecogs.com))
or maintain a public server which would be exposed to my email receivers.
- It is hard for me make the position of the baseline of rendered math correctly.
- Email clients will probably block images from remote sources.

<p class="no-indent">
Both ways have the following disadvantages:
</p>

- There is no "half-working"---either the math is rendered, or it cannot be read at all
(on email clients that do not support or block `<img>` or `<svg>` elements).
- Math expressions cannot have line breaks in the middle.
- Images normally have a larger bandwidth burden.
- It is hard to get them aware of the context (text size, color, etc.).

<p class="no-indent">
Therefore, I try to seek other ways.
</p>

You may wonder how I typeset math in my blog.
The answer is that I use [MathJax](https://mathjax.org).
To integrate it on a webpage, I just load a JavaScript script to the webpage,
and it will convert all the $\TeX$ expressions to math.
Although we normally cannot have JavaScript in emails,
this is actually also a good candidate for typesetting math in emails
because I can [use its Node.js module](https://docs.mathjax.org/en/latest/server/start.html)
to generate the email with math typeset.
The generated email already has all the math rendered, and there is no client-side JavaScript needed.

However, before using Node.js to write my program of generating email,
I looked into [KaTeX](https://katex.org).
How KaTeX advertise itself is saying that it is the *fastest* math typesetting library for the web.
Well, actually I do not care about the speed of typesetting,
but there is something about KaTeX that I found interesting:
[kramdown-math-katex](https://rubygems.org/gems/kramdown-math-katex),
which implements for us the conversion from Markdown to HTML with math typeset.
I am familiar with Ruby and prefer a Ruby project to a Node.js project,
so this looks amazing to me.
What is more amazing is that I can combine it with [Jekyll](https://jekyllrb.com)
to create even more possibility about how I can generate my email.

Then, I implemented my idea
and finally created [this](https://github.com/UlyssesZh/genmail).
I have already used it to generate some emails
(such as [this one](/physics/2022/11/07/map-kepler-3-sphere.html)).
I then just paste the generated HTML into the HTML editor of my email client
(Thunderbird, with [this add-on](https://betterbird.eu/addons/#ThunderHTMLedit)).

By generating the email, the email receivers can see the math typeset
without running any JavaScript on their clients.
However, they need their email client to support CSS styling (Thunderbird does).
I need to inform the receiver of this every time I send an email containing math.
