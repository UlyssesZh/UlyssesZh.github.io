---
title: How to use JavaScript in GitHub Actions without committing `node_modules`
date: 2024-11-15 16:34:55 -0800
categories:
- guide
tags:
- javascript
- github
layout: post
excerpt: 'I was creating my first GitHub Action.
According to the official documentation, I should commit the `node_modules` to the repo
or generate a script that bundles the whole `node_modules` if I want to create a JavaScript action.
I think this is not good practice, so I try to find another way.'
---

I was creating my first GitHub Action
(it is now working, which you can check out [here](https://github.com/UlyssesZh/grs-action)).
I am familiar with JavaScript, so I chose to create a JavaScript action.
According to the [official documentation](https://docs.github.com/en/actions/sharing-automations/creating-actions/creating-a-javascript-action#commit-tag-and-push-your-action-to-github),
I need to do one of the following to make my JavaScript code correctly import 3rd-party modules:

- commit the `node_modules` to the repo, or
- use [\@vercel/ncc](https://github.com/vercel/ncc) to bundle everything into a single script.

<p class="no-indent">
I think both of these methods are not good practices.
Especially, for my case, the way with \@vercel/ncc is not feasible because some package uses `require`.
</p>

The best way to handle this is to make GitHub cache and install all the dependencies for the user
every time the action is run.
This can be made possible by [creating a composite action](https://docs.github.com/en/actions/sharing-automations/creating-actions/creating-a-composite-action).
Here is a snippet in `action.yml`:

{% raw %}
```yaml
runs:
  using: composite
  steps:
    - name: Setup Node.js
      uses: actions/setup-node@v4
      with:
        node-version: '20'

    - name: Get cache key and path
      id: lock
      run: |
        cd $GITHUB_ACTION_PATH
        node <<'JAVASCRIPT'
          const fs = require('fs');
          const os = require('os');
          const sha256 = require('crypto').createHash('sha256');
          const hash = sha256.update(fs.readFileSync('package-lock.json')).digest('hex');
          fs.appendFileSync(process.env.GITHUB_OUTPUT, `key=${os.platform()}-${os.arch()}-grs-modules-${hash}\n`);
        JAVASCRIPT
        modules=$(pwd)/node_modules
        command -v cygpath &> /dev/null && modules=$(cygpath -w $modules)
        echo "modules=$modules" >> $GITHUB_OUTPUT
        cat $GITHUB_OUTPUT
        cd $GITHUB_WORKSPACE
      shell: bash

    - name: Restore cache
      uses: actions/cache/restore@v4
      id: cache-restore
      with:
        path: ${{ steps.lock.outputs.modules }}
        key: ${{ steps.lock.outputs.key }}

    - name: CI
      if: steps.cache-restore.outputs.cache-hit != 'true'
      run: |
        cd $GITHUB_ACTION_PATH
        npm ci
        cd $GITHUB_WORKSPACE
      shell: bash

    - name: Save cache
      if: steps.cache-restore.outputs.cache-hit != 'true'
      uses: actions/cache/save@v4
      with:
        path: ${{ steps.lock.outputs.modules }}
        key: ${{ steps.lock.outputs.key }}

    - name: Run
      run: node $GITHUB_ACTION_PATH/index.js
      shell: bash
```
{% endraw %}

I manually use `actions/cache` to cache the `node_modules` directory although `actions/setup-node` has caching functionality.
This is because it [is not good yet](https://github.com/actions/setup-node/issues/819).
Also, because `github.action_path` ends with `/./`, it can cause some problem due to the relative pathing.
My workflow here works around those problems.

The hash in the cache key is calculated using JavaScript because there is no `sha256sum` command
on macOS and Ubuntu runners.
