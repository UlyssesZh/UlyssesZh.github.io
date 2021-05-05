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
layout: post
---

This post is the continuation of
[the last post](/physics/2020/04/28/simulation-rgss.html).

If you visit [the page](/rpg/mechsimul/) I have just created,
you may find the simulation of a mechanical system.

![Result of simulation](/assets/images/rpgmv_simul.png)

It is currently
\begin{equation\*}
    \mathcal H=p_1^2+p_2^2-\cos q_1-\cos q_2-
    \cos\left(q_1-q_2\right)
\end{equation\*}
depicting two pendulum coupled with a spring,

![Spring-coupled pendulums](/assets/images/spring_coupled_pendulum.png)

which is a classical example of non-linearly coupled system.

The pattern of the oscillation can be analyzed using
discrete Fourier transformation, whose result can be found by
clicking the buttons in the up-left corner
(after the simulator has detected a period).

![Result of DFT](/assets/images/rpgmv_simul_fft.png)

Hitting the space bar can make the simulation pause.

If you want to use it to simulate other mechanical systems,
you can study [the codes](/rpg/mechsimul/js/mechsimul.js) I wrote
and write your own codes in the console.

By the way, the
[OpenRGSS](https://github.com/UlyssesZh/OpenRGSS/){:target="_blank"}
version of the simulator is open-source
[here](https://github.com/UlyssesZh/mechsimul/){:target="_blank"}.
Please star the repo if you like it.
