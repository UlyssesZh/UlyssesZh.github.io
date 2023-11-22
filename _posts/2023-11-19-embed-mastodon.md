---
title: Embed the latest Mastodon post in my website
date: 2023-11-19 13:51:36 -0800
categories:
- update
tags:
- web
- jekyll
- selfhosting
layout: post
excerpt: 'I show the latest Mastodon post in my website hosted on GitHub Pages,
and it does not require JavaScript on the client side.
How do I do that?'
---

As we all know you can [embed a Twitter timeline](https://help.twitter.com/en/using-x/embed-x-feed)
in your website like this:

<details>
<summary>A Twitter timeline</summary>
{% include embed/twitter-timeline.html user="UlyssesZhan" %}
</details>

You can also embed a Twitter post like this:

<details>
<summary>A Twitter post</summary>
{% include embed/twitter.html user="UlyssesZhan" id="1561297804596695041" %}
</details>

However, [there is no official way of embedding a Mastodon timeline](https://github.com/mastodon/mastodon/issues/1065#issuecomment-297531140).
At most, you can embed a specific Mastodon post like this:

<details>
<summary>A Mastodon post</summary>
{% include embed/mastodon.html instance="mastodon.social" user="ulysseszhan" id=111417118208218240 %}
</details>

This just embeds a specific Mastodon post instead of dynamically grabbing the latest posts.
Also, this embed requires JavaScript on the client side, which I have been trying to avoid.
Another downside of this embed is that
[it does not have a light-theme version](https://stackoverflow.com/a/74523939).

Thanks to Mastodon's API, the community implemented
[various ways of embedding Mastodon timelines or posts](https://mastodon-embeds.glitch.me).
I then decided to develop my own way of embedding Mastodon posts.
Here was the roadmap:

- The home page of my website shows my latest Mastodon post.
- It should be rendered server-side, without the necessity of client-side JavaScript.
- Blend the post in the webpage with a style consistent with rest of the webpage.

How do I ensure the embedded post is always the latest one if it was rendered server-side?
This means I have to somehow trigger the building and deployment of by website automatically
whenever a new Mastodon post is created.
Thanks to the [Huginn](https://github.com/huginn/huginn) instance deployed on my self-hosted server,
I can monitor my Mastodon account and trigger a GitHub Actions workflow
whenever there is a new post.

Here is then the idea of implementing the roadmap:

#. On the Jekyll side:
   #. Write a Jekyll hook at `:site` `:after_init` that reads
   the [RSS feed of my Mastodon account](https://mastodon.social/@ulysseszhan.rss)
   to get all information I need.
   #. Write a Liquid template that can be populated with the collected information.
   #. Include the Liquid template in the home page of my website and write some SCSS to style it.
#. On the GitHub side:
   #. Use
   [GitHub Actions to build and deploy on GitHub Pages](https://docs.github.com/en/pages/getting-started-with-github-pages/using-custom-workflows-with-github-pages)
   and make the GitHub Actions triggered by
   [`workflow_dispatch`](https://docs.github.com/en/actions/using-workflows/events-that-trigger-workflows#workflow_dispatch).
   #. Create a [GitHub personal access token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens#creating-a-personal-access-token-classic).
   It will then be used to trigger
   [GitHub Actions through REST API](https://docs.github.com/en/rest/actions/workflows?apiVersion=2022-11-28#create-a-workflow-dispatch-event).
#. On the Huginn side:
   #. Create an agent to monitor the RSS feed of my Mastodon account.
   #. Create an agent to send HTTP requests to invoke GitHub's REST API.
   It receives events from the first agent and triggers the GitHub Actions workflow.

Great! Now, my website can show my latest Mastodon post on the home page.
