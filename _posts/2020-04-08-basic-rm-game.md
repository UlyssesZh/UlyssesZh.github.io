---
title: The structure of a basic RM game
date: 2020-04-08 09:28:05 +0800
categories:
- programming
tags:
- ruby
- javascript
- rgss
layout: post
excerpt: 'In this article, I present minimal examples of a RM game.
They only illustrate the basic concepts of how a RM game is structured
and what is the running logic of it.'
---

[RPG Maker (RM)](https://tkool.jp/){:target="_blank"}
is a tool for making games.

I only have experience in using RPG Maker XP, RPG Maker VX,
RPG Maker VX Ace, and RPG Maker MV.

Games made by using RM are based on

| XP | RGSS        |
| VX | RGSS2       |
| VA | RGSS3       |
| MV | rpg_core.js |

In most cases, when I say RGSS, I mean RGSS, RGSS2, and RGSS3.
RGSS is in Ruby and rpg_core.js is in Javascript.

The scripts of a basic RGSS game look like
```ruby
def start
  # some codes
end
def update
  # some codes
end

start
loop do
  update
  Input.update
  Graphics.update
end
```
The scripts of a basic rpg_core.js game look like
```javascript
function start() {
    // some codes
}
function update() {
    // some codes
}

Graphics.initialize(816, 624, 'webgl');
Graphics.boxWidth = 816;
Graphics.boxHeight = 624;
WebAudio.initialize(false);
Input.initialize();
TouchInput.initialize();
var deltaTime = 1.0 / 60.0;
var accumulator = 0.0;
var currentTime;
window.scene = new Stage();
start();
function performUpdate() {
    Graphics.tickStart();
    var newTime = performance.now();
    if (currentTime === undefined) currentTime = newTime;
    var fTime = ((newTime - currentTime) / 1000).clamp(0, 0.25);
    currentTime = newTime;
    accumulator += fTime;
    while (accumulator >= deltaTime) {
        Input.update();
        TouchInput.update();
        update();
        accumulator -= deltaTime;
    }
    Graphics.render(window.scene);
    requestAnimationFrame(performUpdate);
    Graphics.tickEnd();
}
performUpdate();
```

There is a simple rpg_core.js game written by me which can be accessed
[here](/rpg/hello/).
You can look at its source code by using your browser.

RM also provides a lot of scripts serving as making RPG.
There is a simple RPG built by me which can be accessed
[here](/rpg/test/).

The source codes of RGSS are secret, but those of rpg_core.js are not a secret
and can be seen at
[its GitHub repo](https://github.com/rpgtkoolmv/corescript/){:target="_blank"}.
