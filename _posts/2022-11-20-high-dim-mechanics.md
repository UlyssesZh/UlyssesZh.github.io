---
title: 'How to construct mechanics in higher dimensions?'
date: 2022-11-20 17:56:52 -0800
categories:
- physics
tags:
- from zhihu
- classical mechanics
- imagination
layout: post
excerpt: 'We can derive the equation of motion for mechanical systems
in a Galileo universe with $\iota$ time dimensions and $\chi$ space dimensions
by generalizing the principle of relativity and Hamilton''s principle.'
---

*This article is translated from a
Chinese [article](https://zhuanlan.zhihu.com/p/142546940){:target="_blank"} on my Zhihu account.
The original article was posted at 2020-05-28 21:24 +0800.*

---

The spacetime of higher dimensions that we mention here refers to a Galileo universe
with $\iota$ time dimensions and $\chi$ space dimensions.
It has affine structure, and we manually define a coordinate system on it.
Galilean transformations include uniform-velocity motion (note that velocities are matrices (see below)),
spacetime translation, and space rotation.
The principle of Galilean relativity still holds.

The universe is $\left(\iota+\chi\right)$-dimensional,
manually separated into an $\iota$-dimensional subspace and a $\chi$-dimensional subspace,
where the former is called the time space, and the latter is called the space space.
World points (events) are described by the combination of time coordinates and space coordinates.

Note that, when we find the derivative of a function w.r.t. time,
we need to distinguish the total partial derivative and the partial partial derivative.
The former regards all variables as functions of time,
while the latter one does not.
We denote the total partial derivative of function $F$ w.r.t. the $j$th time coordinate as $\partial_jF$,
and the partial partial derivative as $\frac{\partial F}{\partial t_j}$.

To avoid confusion, there is an example.
For example, the total partial derivative of $F\\!\left(q,t\right)$ w.r.t. $t_j$
is $\partial_jF=\frac{\partial F}{\partial q}\partial_jq+\frac{\partial F}{\partial t_j}$.
We can see that the total partial derivative has an extra term in addition to the partial partial derivative,
which originates from the change of other independent variables of the function due to the change of time.

A system with $s$ DOF needs $s$ multivariable functions $q_k\\!\left(t\right)$ to describe,
where $k$ is the subscript, and $t\in\mathbb R^\iota$.
The numbers $q_k$ are called generalized coordinates.
Generalized coordinates are mappings from the time space to the space space.

Then, the generalized velocities become matrices,
whose each component represents each generalized coordinate changes w.r.t. each component of time coordinates.
Written explicitly, it is $\partial_jq_k$.
It can be regarded as the Jacobian matrix of generalized coordinates.
We may think that the generalized velocities span a space called the velocity space.

Just like traditional universe with one time dimension,
we define the action $\mathcal S$ as the volume integral of the function $\mathcal L$ in the time space,
where the Lagrangian $\mathcal L$ is a scalar function defined on the space-velocity-time phase space.
Written explicitly, it is $\mathcal S:=\int_M\mathcal L\\,\mathrm dV_t$,
where $M\subseteq\mathbb R^\iota$ is a region in the time space,
and $\mathrm dV_t$ is the volume element in the time space.

Now, Hamilton's principle still holds.
What it says is that, if we regard $\mathcal S$ as a functional of the function $q$,
then the problem of finding the actual motion $q$ of the system is equivalent to solve the optimization problem:
constraint the value of $q$ on $\partial M$, and minimize $\mathcal S$.

In this case, the Euler--Lagrange equation is (according to [a previous post](/math/2020/05/31/high-dim-euler-eq))

$$\sum_j\partial_j\frac{\partial\mathcal L}{\partial\!\left(\partial_jq_k\right)}=\frac{\partial\mathcal L}{\partial q_k}.$$

Therefore, the momentum is defined to be the matrix

$$p_{j,k}:=\frac{\partial\mathcal L}{\partial\!\left(\partial_jq_k\right)}.$$

Note that now the Euler--Lagrange equation is a set of second-order PDEs.

We try performing Legendre transformation on $\mathcal S$ and get Hamiltonian $\mathcal H$.

As a function of space coordinates and velocities, the total derivative of $\mathcal L$ is

$$\mathrm d\mathcal L=\sum_{j,k}\frac{\partial\mathcal L}{\partial\!\left(\partial_jq_k\right)}\,\mathrm d\!\left(\partial_jq_k\right)
+\sum_k\frac{\partial\mathcal L}{\partial q_k}\,\mathrm dq_k.$$

Substitute the Euler--Lagrange equation and the definition of momenta, and we have

$$\mathrm d\mathcal L=\sum_{j,k}p_{j,k}\,\mathrm d\!\left(\partial_jq_k\right)+\sum_{j,k}\partial_jp_{j,k}\,\mathrm dq_k.$$

By the product rule, the first term in the formula above can be written as

$$p_{j,k}\,\mathrm d\!\left(\partial_jq_k\right)=\mathrm d\!\left(p_{j,k}\partial_jq_k\right)-\partial_jq_k\,\mathrm dp_{j,k},$$

and then we have

$$\mathrm d\!\left(\sum_{j,k}p_{j,k}\partial_jq_k-\mathcal L\right)
=-\sum_{j,k}\partial_jp_{j,k}\,\mathrm dq_k+\sum_{j,k}\partial_jq_k\,\mathrm dp_{j,k}.$$

If we let $\mathcal H:=\sum_{j,k}p_{j,k}\partial_jq_k-\mathcal L$,
then we have

$$\partial_jq_k=\frac{\partial\mathcal H}{\partial p_{j,k}},\quad\sum_j\partial_jp_{j,k}=-\frac{\partial\mathcal H}{\partial q_k}.$$

This is the new Hamiltonian equations, or canonical equations.
We may find that it lacks the beauty of the form in one-dimensional time.

Problem 1:
Prove that if we add the Lagrangian by the "total divergence" w.r.t. time of some function defined on space and time,
the new Lagrangian describes the same mechanical system as the original.
In other words, $\mathcal L':=\mathcal L+\sum_j\partial_jf$ has the same equation of motion as $\mathcal L$,
where $f$ is an arbitrary function defined on the spacetime.

Problem 2:
Prove by principle of Galilean relativity that the Lagrangian of a single free particle system is
$\mathcal L=\sum_{j,k}\frac{m_j}2\left(\partial_jq_k\right)^2$,
where $m_j$ are constants (their physical meaning is mass, which means that mass is not scalar in time of higher dimensions),
and $q_k$ are Cartesian coordinates.
Find and solve its equation of motion, and hence derive the law of inertia.

Problem 3:
Does the conservation of energy still hold?

A problem that I am too lazy to consider:
Consider the Minkowski universe.
Poincaré transformations are defined as those affine transformations that preserve the spacetime distance between events,
and the spacetime distance is defined as the difference of the square of Euclidean distance in time space
and the square of Euclidean distance in space space.
The principle of special relativity guarantees that the equation of motion of closed systems is invariant under Poincaré transformations.
Find the Lagrangian of a single free particle system.
