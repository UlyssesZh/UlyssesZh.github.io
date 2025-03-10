---
title: Simulating a mechanical system using rpg_core.js
date: 2020-05-14 00:57:39 +0800
categories:
- physics
tags:
- javascript
- rgss
- hamiltonian
- calculus
- ode
- web
- fourier transform
layout: post
excerpt: 'Continuing my last work of simulating a mechanical system using RGSS3,
I made a new version using rpg_core.js, the game scripting system shipped with RPG Maker MV.
This version is live [on web](/rpg/mechsimul)!'
---

This post is the continuation of
[the last post](/physics/2020/04/28/simulation-rgss.html).

If you visit [the page](/rpg/mechsimul/) I have just created,
you may find the simulation of a mechanical system.

![Result of simulation]({{page.figure}}rpgmv_simul.png)

It is currently
$$
    \mathcal H=p_1^2+p_2^2-\cos q_1-\cos q_2-
    \cos\!\left(q_1-q_2\right)
$$
depicting two pendulum coupled with a spring
(with $l_1=l_2$ and $m_1=m_2$, and the original length of the spring is zero,
and the two hanging points overlap),

![Spring-coupled pendulums]({{page.figure}}spring_coupled_pendulum.png){.dark-adaptive}

<p class="no-indent">
which is a classical example of non-linearly coupled system.
</p>

The pattern of the oscillation can be analyzed using
discrete Fourier transformation, whose result can be found by
clicking the buttons in the up-left corner
(after the simulator has detected a period).

![Result of DFT]({{page.figure}}rpgmv_simul_fft.png)

<p class="no-indent">
Hitting the space bar can make the simulation pause.
</p>

If you want to use it to simulate other mechanical systems,
you can study [the codes](/rpg/mechsimul/js/mechsimul.js) I wrote
and write your own codes in the console.

By the way, the
[OpenRGSS](https://github.com/UlyssesZh/OpenRGSS/)
version of the simulator is open-source
[here](https://github.com/UlyssesZh/mechsimul/).
Please star the repo if you like it.
