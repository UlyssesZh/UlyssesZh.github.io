---
title: Generalization of Euler--Lagrange equation
date: 2020-05-31 12:53:17 +0800
categories:
- math
tags:
- calculus
layout: post
excerpt: 'We may generalize Euler--Lagrange equation to higher dimensional optimization problems:
find a function defined inside a region to extremize a functional defined as an integral over that region,
with the constraint that the value of the function is fixed on the boundary of the region.'
---

$\Omega\in\mathbb R^m$ is a closed region.
The variable $\mathbf f:\Omega\rightarrow\mathbb R^p$
is an $n$ differentiable function with fixed boundary conditions on $\partial\Omega$.
The function $\mathcal L$ is real-valued and has continuous first partial derivatives,
and the $0$th to $n$th partial derivatives of $\mathbf f$
and the independent variable $\mathbf x\in\Omega$ will be arguments of $\mathcal L$.
Define a functional
$$
    I\coloneqq\mathbf f\mapsto\int_\Omega\mathcal L\left(\cdots\right)\mathrm dV,
$$
where $\mathrm dV$ is the volume element in $\Omega$.
Then the extremal of $I$ satisfies a set of PDEs with respect to $\mathbf f$.
The set of PDEs consists of $p$ equations, the $i$th of which is
$$\sum_{j=0}^n\sum_{\mu\in P_{j,m}}\left(-1\right)^j
    \partial_\mu\frac{\partial\mathcal L}{\partial\left(\partial_\mu f_i\right)}=0,$$ {#eq:ret}
where $P_{j,m}$ is the set of all (not necessarily strictly) ascending $j$-tuples in
$\left\{1,\dots,m\right\}^j$, and
$$
    \partial_\mu\coloneqq\frac{\partial^{\operatorname{len}\mu}}{\prod_k\partial x_{\mu_k}}.
$$
Equation [@eq:ret] is the Generalization of Euler--Lagrange equation.
