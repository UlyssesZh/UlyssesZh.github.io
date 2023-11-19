---
title: 'A whirling point charge'
date: 2022-11-16 16:47:57 -0800
categories:
- physics
tags:
- from zhihu
layout: post
excerpt: 'In the vacuum, inside a fixed ring of radius $R$ with fixed charge $Q$ uniformly distributed,
there is a point charge with charge $q$ and mass $m$ moving in the plane of the ring due tue the electrostatic force.
It moves in the small region around the center of the ring, and the motion is periodic along a closed curve.
The area of the region enclosed by the curve is $S$.
Denote the distance from the center to the point charge as $r$, and $r\ll R$.
Find the magnetic induction $B$ at the center of the ring.'
---

*This article is translated from a
Chinese [article](https://zhuanlan.zhihu.com/p/107399199) on my Zhihu account.
The original article was posted at 2020-02-17 18:49 +0800.*

---

In the vacuum, inside a fixed ring of radius $R$ with fixed charge $Q$ uniformly distributed,
there is a point charge with charge $q$ and mass $m$ moving in the plane of the ring due tue the electrostatic force.
It moves in the small region around the center of the ring, and the motion is periodic along a closed curve.
The area of the region enclosed by the curve is $S$.
Denote the distance from the center to the point charge as $r$, and $r\ll R$.
Find the magnetic induction $B$ at the center of the ring.

By using the cosine law, we can write the electrical potential in the plane of the ring inside the ring as the integral

$$U=\int_0^{2\pi}\frac{\frac{\mathrm d\theta}{2\pi}Q}{4\pi\varepsilon_0\sqrt{R^2+r^2-2Rr\cos\theta}}.$$

Note that the elliptic integral of the first kind is

$$\begin{align*}
K\!\left(\mu\right)&\coloneqq\int_0^{\frac\pi2}\frac{\mathrm d\varphi}{\sqrt{1-\mu\sin^2\varphi}}\\
&=\int_0^{\frac\pi2}\frac{\mathrm d\varphi}{\sqrt{1-\mu\frac{1-\cos2\varphi}{2}}}\\
&=\int_0^\pi\frac{\mathrm d\theta}{\sqrt{4-2\mu+2\mu\cos\theta}}&\theta\coloneqq2\varphi\\
&=\frac1{2\sqrt{4-2\mu}}\int_0^{2\pi}\frac{\mathrm d\theta}{1+\frac\mu{2-\mu}{\cos\theta}}.\\
\end{align*}$$

On the other hand, the potential

$$U=\frac{Q}{8\pi^2\varepsilon_0\sqrt{R^2+r^2}}\int_0^{2\pi}\frac{\mathrm d\theta}{1-\frac{2Rr}{R^2+r^2}\cos\theta}.$$

By comparing the two equations, we are motivated to find $\mu$ such that

$$\frac\mu{2-\mu}=-\frac{2Rr}{R^2+r^2},$$

and we may solve to get

$$\mu=-\frac{4Rr}{\left(R-r\right)^2}.$$

Therefore,

$$\begin{align*}
U&=\frac{Q}{8\pi^2\varepsilon_0\sqrt{R^2+r^2}}\cdot\frac{4\sqrt{R^2+r^2}}{R-r}K\!\left(-\frac{4Rr}{\left(R-r\right)^2}\right)\\
&=\frac Q{2\pi^2\varepsilon_0\left(R-r\right)}K\!\left(-\frac{4Rr}{\left(R-r\right)^2}\right).
\end{align*}$$

We can expand $U$ in terms power series of $r$ (how?), and we get

$$U=\frac Q{4\pi\varepsilon_0R}+\frac{Q}{8\pi\varepsilon_0R^3}r^2+O\!\left(r^4\right).$$

Then, the potential energy $E_\mathrm p=qU$ (and omit constant term and higher order terms) is

$$E_\mathrm p=\frac{qQ}{8\pi\varepsilon_0R^3}r^2.$$

To make the trajectory a closed curve, the second derivative of the potential at the equilibrium should be positive,
so $qQ>0$, i.e. the ring and point charge have the same sign of charge.

As we all know, for the potential energy $E_\mathrm p=\frac12m\omega^2r^2$, the motion is

$$\begin{cases}x=a\cos\omega t,\\y=a\sin\omega t,\end{cases}$$

where $a$ and $b$ are determined by the initial conditions.

Then, we can solve the equation

$$\frac{qQ}{8\pi\varepsilon_0R^3}=\frac12m\omega^2$$

to get

$$\omega=\frac1{2R}\sqrt{\frac{qQ}{\pi\varepsilon_0mR}}.$$

Because the trajectory is an ellipse, the area is

$$S=\pi ab.$$

We can take the derivate of the coordinates w.r.t. $t$ to get the velocity

$$\begin{cases}v_x=-a\omega\sin\omega t,\\v_y=a\omega\cos\omega t,\end{cases}$$

By Biot--Savart law, the magnetic induction $B$ at the center of the ring is

$$\begin{align*}
B&=\frac{\mu_0q}{4\pi r^3}\left|\begin{matrix}x&v_x\\y&v_y\end{matrix}\right|\\
&=\frac{\mu_0q}{4\pi r^3}\omega ab\left(\cos^2\omega t+\sin^2\omega t\right)\\
&=\frac{\mu_0qS}{4\pi^2r^3}\omega\\
&=\frac{\mu_0qS}{8\pi^2Rr^3}\sqrt{\frac{qQ}{\pi\varepsilon_0mR}}.
\end{align*}$$
