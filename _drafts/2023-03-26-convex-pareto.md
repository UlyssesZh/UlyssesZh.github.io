---
title: 'The Pareto set of spatial preference relations is the convex hull of ideal points'
date: 2023-03-26 16:03:46 -0700
categories:
- economics
tags:
- functional analysis
- preference relation
- pareto efficiency
layout: post
excerpt: 'The spatial preference relation is the preference relation over a metric space
where points nearer to the ideal point are preferred.
Suppose there are some agents with spatial preference relations over a strictly convex space,
then the Pareto set of them is the convex hull of their ideal points.'
---

A **spatial preference relation** (with ideal point $a$)
over a metric space $\left(P,d\right)$ is
the preference relation $\succeq$ defined as follows:

$$\left(x\succeq y\right):=\left(d\!\left(x,a\right)\leq d\!\left(y,a\right)\right).$$

We can easily prove that this is indeed a preference relation, and it is continuous.
It can be represented by the utility function $u(x):=-d(x,a)$.

---

First, we need a lemma.

*Lemma.*
Let $\left(P,\\|\cdot\\|\right)$ be a strictly convex space.
Then, for any two distinct points $a,b\in P$,
we have

$$\forall x\in P:x\in\overline{ab}\Leftrightarrow
B\!\left(a,\|x-a\|\right)\cap B\!\left(b,\|x-b\|\right)=\varnothing,$$

where $B(c,r):=\left\\{x\in P\,\middle|\,\\|x-c\\|<r\right\\}$
is the open ball centered at $c$ with radius $r$,
and $\overline{ab}:=\left\\{a+t\left(b-a\right)\middle|\,t\in\left[0,1\right]\right\\}$
is the line segment connecting $a$ and $b$.

*Proof.*
To prove the forward direction, first assume $x\in\overline{ab}$.
Then, we have

$$\|x-a\|+\|x-b\|=\|a-b\|.$$

Suppose there is a point $y$ in the intersection of the two balls.
This means that

$$\|y-a\|<\|x-a\|,\quad\|y-b\|<\|x-b\|.$$

Add the two inequalities together, we have

$$\|x-a\|+\|x-b\|>\|y-a\|+\|y-b\|.$$

On the other hand, we have the triangle inequality

$$\|y-a\|+\|y-b\|\ge\|a-b\|=\|x-a\|+\|x-b\|.$$

Therefore, we proved the forward direction by contradiction.

To prove the backward direction, first assume that $x\notin\overline{ab}$.
Then, by the strict convexity, we have

$$\|x-a\|+\|x-b\|>\|b-a\|.$$

Define

$$y:=a+\frac{\|x-a\|}{\|x-a\|+\|x-b\|}\left(b-a\right).$$

Then we have

$$\begin{align*}
\|y-a\|&=\frac{\|x-a\|}{\|x-a\|+\|x-b\|}\|b-a\|\\
&<\frac{\|x-a\|}{\|b-a\|}\|b-a\|\\
&=\|x-a\|.
\end{align*}$$

Therefore, $y\in B\\!\left(a,\|x-a\|\right)$.
Similarly, we have $y\in B\\!\left(b,\|x-b\|\right)$.
Then, the intersection of these two balls is non-empty.
$\square$

Here is a figure to illustrate the lemma in the case of $\mathbb R^2$
with the euclidean norm.
The left figure shows the case where $x\notin\overline{ab}$,
and the intersection of the two balls is non-empty.
The right figure shows the case where $x\in\overline{ab}$,
and the intersection of the two balls is empty.

<!--
\documentclass{standalone}
\usepackage{tikz}
\usetikzlibrary{through}
\newcommand\labelpoint[3]{\node[#1] at (#2) {$#3$};\fill (#2) circle (0.07);}

\begin{document}

\begin{tikzpicture}
	\coordinate (a) at (0,0);
	\coordinate (b) at (3,0);
	\coordinate (x) at (1,-1);
	\node[draw] at (a) [circle through={(x)}] {};
	\node[draw] at (b) [circle through={(x)}] {};
	\draw (a) -- (b);
	\labelpoint{left}{a}{a};
	\labelpoint{right}{b}{b};
	\labelpoint{right}{x}{x};
\end{tikzpicture}
\qquad
\begin{tikzpicture}
	\coordinate (a) at (0,0);
	\coordinate (b) at (3,0);
	\coordinate (x) at (2,0);
	\node[draw] at (a) [circle through={(x)}] {};
	\node[draw] at (b) [circle through={(x)}] {};
	\draw (a) -- (b);
	\labelpoint{left}{a}{a};
	\labelpoint{right}{b}{b};
	\labelpoint{below left}{x}{x};
\end{tikzpicture}

\end{document}
-->
![Cases where the intersection is empty or non-empty]({{page.figure}}intersecting_balls.svg){:.dark-adaptive style="width: 100%;"}
