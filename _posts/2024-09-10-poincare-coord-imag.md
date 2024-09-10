---
title: The notational convenience of imaginary time in the derivation of the metric in Poincar&eacute; coordinates
date: 2024-09-10 14:19:33 -0700
categories:
- physics
tags:
- general relativity
- ads space
layout: post
excerpt: 'In general relativity, people usually choose one of the two major metric signatures.
However, in certain cases, the imaginary time convention can be more convenient.
Here is one of such cases: the derivation of the metric in Poincar&eacute; coordinates for the anti-de Sitter space.'
---

## Introduction

There are two major conventions for the metric signature:
$\p{+,-,-,-}$ (west coast) and $\p{-,+,+,+}$ (east coast).
However, the first convention that I have met in my journey of learning physics is neither of them:
the imaginary time.
Shortly after, I started using the west coast convention,
so I never really used the imaginary time convention seriously.
I personally dislike the imaginary time convention,
and so do most people in the physics community and history,
which is why most modern textbooks use either the west coast or the east coast convention.
One of my past physics teachers deemed the imaginary time convention to be a heresy (异端邪说).

![The teacher's writing]({{page.figure}}heresy.jpg)

However, in some cases, the imaginary time convention can be convenient
due to the use of multi-index notation
(which is more concise and feature-rich than the Einstein notation).
Here is one of such cases: the derivation of the metric in Poincar&eacute; coordinates for the anti-de Sitter space.

The $d$-dimensional anti-de Sitter space $\mrm{AdS}_d$ of scale $l$ is defined as the hyperboloid
$$-l^2=-T_1^2-T_2^2+\sum_{i=1}^{d-1}\p{X^i}^2$$
in $M^{d-1,2}$ (the analogue of the Minkowski space, but with signature $d-1,2$).
The Poincar&eacute; coordinates are defined as
$$\begin{align*}
	z&\ceq\fr{l^2}{T_1+X^{d-1}},\\
	t&\ceq\fr{lT_2}{T_1+X^{d-1}},\\
	x^i&\ceq\fr{lX^i}{T_1+X^{d-1}},&i=1,\ldots,d-2.
\end{align*}$$

## The derivation

Define $T\ceq T_1$ and $X\ceq X^{d-1}$ just for fun.
Then, define two $\p{d-1}$-dimensional multi-indices
$$Y\ceq\p{\i T_2,X^1,\ldots,X^{d-2}},\quad y\ceq\p{\i t,x^1,\ldots,x^{d-2}}.$$

The hyperboloid constraint and the metric (east coast convention) are then
$$X^2-T^2+Y^2=-l^2,\quad \d s^2=\d X^2-\d T^2+\d Y^2,$$
which are equivalently
$$\p{X+T}\p{X-T}=-l^2-Y^2,\quad\d s^2=\p{\d X+\d T}\p{\d X-\d T}+\d Y^2.$$ {#eq:constraint-and-metric}
The definition of the Poincar&eacute; coordinates can be written as
$$z=\fr{l^2}{X+T},\quad y=\fr zlY,$$
or equivalently
$$X+T=\fr{l^2}z,\quad Y=\fr{ly}z.$$ {#eq:poincare-coord}

Substitute Equation [@eq:poincare-coord] into the first equation in Equation [@eq:constraint-and-metric].
Then, we have
$$X-T=-z-\fr{y^2}z.$$ {#eq:X-minus-T}
Differentiate Equation [@eq:poincare-coord] and [@eq:X-minus-T], and we have
$$\d X+\d T=-\fr{l^2}{z^2}\,\d z,\quad
\d X-\d T=-\d z+\fr{y^2}{z^2}\,\d z-\fr{2y}z\,\d y,\quad
\d Y=l\p{\fr{\d y}z-\fr y{z^2}\,\d z}.$$
Substitute this into the second equation in Equation [@eq:constraint-and-metric],
and we have
$$\d s^2=-\fr{l^2}{z^2}\d z\p{-\d z+\fr{y^2}{z^2}\,\d z-\fr{2y}z\,\d y}+l^2\p{\fr{\d y}z-\fr y{z^2}\,\d z}^2
=\fr{l^2}{z^2}\p{\d y^2+\d z^2}.$$

Finally, substitute back the definition of $y$, and we have the result
$$\d s^2=\fr{l^2}{z^2}\p{-\d t^2+\sum_{i=1}^{d-2}\p{\d x^i}^2+\d z^2}.$$
