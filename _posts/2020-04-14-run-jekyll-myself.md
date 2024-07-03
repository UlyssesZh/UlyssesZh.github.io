---
title: Running Jekyll myself
date: 2020-04-14 14:22:15 +0800
categories:
- programming
tags:
- jekyll
layout: post
excerpt: 'I have got tired of letting GitHub Pages to run Jekyll for me.
I cannot use custom plugins!
I decide to run Jekyll myself and push the built result to GitHub repo.
I wrote a script to do this.'
---

It is an annoying thing that I cannot add custom plugins
if [GitHub pages](https://pages.github.com/)
runs [Jekyll](https://jekyllrb.com/) for me.

Thus, I need to build the site myself and let GitHub pages to
present my built site.

Note that GitHub pages serving personal users cannot
present the site deployed in `docs` dir of `master` branch
or in root of `gh-pages` branch, so I need to put my Jekyll source
in the `development` branch, and push the built site to the `master`
branch when I think it is ready to be published.

I have written a script to do it for me:

```shell
MESSAGE=$1

echo "Committing..."
git commit -m "$MESSAGE" --author "$AUTHOR"

echo "Backing up..."
mv _site/.git git_backup

echo "Building..."
jekyll build --quiet

echo "Restoring..."
mv git_backup/.git _site
cd _site

echo "Pushing..."
git add -- **/*
git commit -m "$MESSAGE" --author "$AUTHOR"
git push --set-upstream origin master
```

<p class="no-indent">
where `AUTHOR` is your name and email in the format `name <email>`.
</p>

Before that, I need to initialize the `_site` dir as a git repo:

```shell
cd site_
git init
git remote add origin $REMOTE_URL
git add -f -- **/*
git commit -m "initial commit"
git push -f --set-upstream origin master
```

<p class="no-indent">
where `REMOTE_URL` is the GitHub url of the repo of your site.
</p>
