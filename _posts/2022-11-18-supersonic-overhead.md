---
title: 'When a supersonic airplane flies over your head'
date: 2022-11-18 14:11:10 -0800
categories:
- physics
tags:
- from zhihu
layout: post
excerpt: 'Suppose a supersonic airplane has Mach number $M$.
It flies horizontally.
At some time, it flies past over your head at height $h$.
Then, the distance between you and it when you have just heard it is $Mh$.'
---

*This article is translated from a
Chinese [article](https://zhuanlan.zhihu.com/p/107399199) on my Zhihu account.
The original article was posted at 2020-02-17 18:49 +0800.*

---

(Continue to review middle school knowledge!)

Suppose a supersonic airplane has Mach number $M$ (Mach number is the speed divided by sound speed).
It flies horizontally.
At some time, it flies past over your head at height $h$.
What is the distance between you and it when you have just heard it?

Suppose the time when the airplane flies past over your head is $t=0$;
the sound speed is $v$.
Then, the motion of the airplane is
$$x=Mvt.$$
The distance between you and the airplane is
$$l=\sqrt{x^2+h^2}.$$

Let $\tau$ be the time at which you hear the sound emitted by the airplane at $t$, then
$$\tau=t+\frac lv=t+\sqrt{\tau_0^2+M^2t^2},$$
where $\tau_0\coloneqq\frac hv$.

Then, we can find the minimum value of $\tau$ by letting $\frac{\mathrm d\tau}{\mathrm dt}=0$.
However, here we use a middle school technique to reduce calculation.

Write the relationship between $\tau$ and $t$ as a quadratic equation w.r.t. $t$
$$\left(M^2-1\right)t^2+2\tau t+\tau_0^2-\tau^2=0.$$
It must have real solutions, so the determinant is non-negative, i.e.
$$\tau^2-\left(M^2-1\right)\left(\tau_0^2-\tau^2\right)\ge0.$$

We can solve the inequality to get
$$\tau^2\ge\left(1-M^{-2}\right)\tau_0^2.$$
Here we can see why do we require the airplane to be supersonic
(otherwise the right-hand side of the inequality is negative, and $\tau$ does not have a minimum value).

By this, we have
$$\tau_{\mathrm{min}}=\tau_0\sqrt{1-M^{-2}}.$$
Therefore, the answer to our question is
$$\left.l\right|_{t=\tau_{\mathrm{min}}}=Mh.$$

Elegant!
