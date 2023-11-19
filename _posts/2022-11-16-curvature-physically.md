---
title: 'Finding curvature radius physically'
date: 2022-11-16 17:54:36 -0800
categories:
- physics
tags:
- from zhihu
layout: post
excerpt: 'Sometimes the curvature radius of a curve can be found by using physical methods
although it seems that you must use calculus to find it.
In this article, the curvature radius of the curve $x^2=2py$ at the point where the curvature radius is smallest
is found by using physical methods without using calculus (with only high school knowledge).
The answer is that the smallest curvature is exactly $p$, and the point with smallest curvature is the vertex.'
---

*This article is translated from a
Chinese [article](https://zhuanlan.zhihu.com/p/113293049) on my Zhihu account.
The original article was posted at 2020-03-15 11:50 +0800.*

---

I occasionally saw a picture of the blackboard contents on a physics class from one of my schoolmates,
and I found that they have learnt about decomposing the force into the tangential force and the normal force.
I then thought that they should realize that they have gained a tool to find the curvature radius of a curve at some point.

In this article, from now on, I only use knowledge from high school.

First, consider an example question: a circle of radius $\rho$ can cover every point when it moves arbitrarily
within the region interior to the boundary defined by $x^2=2py$.
Illustrate by calculation that $\rho\le p$.

(The original problem comes from Tong Ji *Advanced Mathematics*
(note of translation: the calculus textbook used by many Chinese universities for non-mathematics students),
asking about the condition for a circular object to be used to be used to burnish a parabola shaped component.)

Obviously, the purpose of the problem is to ask you to find the curvature radius of the curve
at the point where the curvature radius is smallest.
By observing the graph, we can see that the point with smallest curvature radius is the vertex of the parabola
(I just run around now, but I will prove this argument later).

Consider the motion

$$\vec r=ut\vec i+\frac{u^2t^2}{2p}\vec j$$

($u$ here is introduced just for consistency in dimension, but actually we can just let $u\coloneqq1$).

Obviously the object is doing a uniform acceleration motion, and the acceleration is as large as $\frac{u^2}p$,
and its direction is $+y$.
The trajectory of the motion is the parabola $x^2=2py$.

Consider the motion at $t=0$.
At this time, it is located at the vertex of the parabola.
The velocity is $u$ in the direction of $+x$.
Therefore, obviously the normal acceleration is just its acceleration $\frac{u^2}p$,
so the curvature radius of the parabola at the vertex is $p$.

Therefore, we can see that some problems that seem to require calculus can actually be solved using physics knowledge
without using calculus.

---

Prove that the point on the parabola with smallest curvature radius is the vertex using physical method.

By the formula for uniform acceleration motion, the motion

$$\vec r=ut\vec i+\frac{u^2t^2}{2p}\vec j$$

has velocity

$$\vec v=u\vec i+\frac{u^2t}{p}\vec j$$

and acceleration

$$\vec a=\frac{u^2}{p}\vec j.$$

By easy calculation, we can get the tangential acceleration

$$a_\tau=\frac{u^3t}{p\sqrt{p^2+u^2t^2}}$$

and the normal acceleration

$$a_\nu=\frac{u^2}{\sqrt{p^2+u^2t^2}}.$$

The curvature radius

$$\rho=\frac{v^2}{a_\nu}=\frac{\left(p^2+u^2t^2\right)^\frac32}{p^2}\ge p,$$

where the equality holds iff $t=0$.
