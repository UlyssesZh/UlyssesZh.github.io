---
title: 'Defend our earth against aliens'' bullets!'
date: 2023-02-01 11:11:11 -0800
categories:
- physics
tags:
- calculus
- classical mechanics
- kepler problem
- from zhihu
layout: post
excerpt: 'The aliens intiated their attack to the earth!
They shoot bullets with mass $m$ and speed $v$ from a far-awar planet.
To defend, humans built a field $U=\alpha/r$ that can repel the bullets.
What regions are safe?
The answer turns out to be the interior of a circular paraboloid.'
---

*This article solves the first part of the problem proposed in a
Chinese [article](https://zhuanlan.zhihu.com/p/206771750) on my Zhihu account.
The original article was posted at 2020-08-30 18:27 +0800.*

---

The aliens intiated their attack to the earth!
They shoot bullets with mass $m$ and speed $v$ from a far-awar planet.
To defend, humans built a field $U=\alpha/r$ that can repel the bullets.
What regions are safe?

---

Every possible trajectory of the bullet is parameterized by $b$, the impact parameter.
The bullet has energy $E=\frac12mv^2$ and angular momentum $M=mvb$,
which are conserved.
According to the well-known results of Kepler problem,
the trajectory is a hyperbola
$$-\frac pr=1+e\cos\varphi,$$
where
$$p\coloneqq\frac{M^2}{m\alpha},\quad e\coloneqq\sqrt{1+\frac{2EM^2}{m\alpha^2}}.$$
For convenience, denote the radius of the hyperbola as
$$a\coloneqq\frac\alpha{2E},$$
then we can write the equation of the trajectory as
$$-\frac{b^2}{ar}=1+\sqrt{1+\frac{b^2}{a^2}}\cos\varphi.$$
Rotate the trajectory so that the incident direction is always towards the positive $x$ direction:
$$0=F\!\left(r,\varphi,b\right)\coloneqq\frac{b^2}{ar}+1+\cos\varphi+\frac ba\sin\varphi.$$ {#eq:eq-trajectory}
To find the envelope of the family of trajectories, solve
$$0=\frac{\partial F}{\partial b}=\frac{2b}{ar}+a\sin\varphi,$$
and we have
$$b=-\frac12r\sin\varphi.$$
Substitute back into Equation [@eq:eq-trajectory], and we have finally the equation of the envelope:
$$\frac{4a}r=1-\cos\varphi,$$
which is a parabola with the the semi-latus rectum being $4a$.
Therefore, the safe regions are the interior of a circular paraboloid.
