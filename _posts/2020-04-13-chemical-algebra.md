---
title: Algebraic structure of chemicals
date: 2020-04-13 21:59:28 +08:00
categories:
- chemistry
tags:
- linear algebra
layout: post
---

When we are writing reaction equations,
it seems that
we are regarding the chemicals as some sort of algebraic objects.

To disambiguate, "element" refers to element in math,
while "chemical element" refers to element in chemistry.

For convenience, if there is no ambiguity,
denote the zero element in all kinds of algebraic structures as $0$.

From the perspective of algebra,
$m$ different chemical elements forms a free $\mathbb Z$-module $\mathscr M$,
whose rank (a.k.a. dimension) is $m$.
Chemicals (whether pures or mixtures) consisting of these chemical elements
can be regarded as elements in $\mathscr M$.

Suppose the basis of $\mathscr M$ is $B\in\mathscr M^m$,
whose components are the respective chemical elements.
Then, any $c\in\mathscr M$ can be represented as
an inner product $c=\left<p,B\right>$, where $p\in\mathbb Z^m$.

With the isomorphism $f:p\mapsto\left<p,B\right>$,
one can find that $\mathscr M\simeq\mathbb Z^m$.

Suppose a chemical reaction equation involves
$n$ chemicals $C\in\mathscr M^n$.
Then, balancing the equation is in fact
to find $x\in\mathbb Z^n$ such that $\left<x,C\right>=0$.
In other words, it is to solve
the homogeneous linear equation $\left<x,C\right>=0$.
The solution $x$ is the "signed stoichiometries".
Chemicals with positive stoichiometries and those with negative ones
stay at different side of the chemical reaction equation.

One can define the concept of "rank" in $\mathscr M^n$.
Let $r:=\operatorname{rank}C$.

1. $r\ge n$. In this case, $x$ has the only solution $x=0$.
A mistake made when writing out the reaction equation may lead to this case.
2. $r=n-1$. In this case, $x$ has infinite solutions,
all with the form $x=ts$,
where $s\in\mathbb Z^n$ is the solution basis,
and $t\in\mathbb Z$ is an arbitrary parameter.
Then $s$ is the result of balancing.
Usually, it is required that components of $s$ be mutually prime.
Such chemical reactions can be called "simple reactions".
3. $r<n-1$. In this case, $x$ has infinite solutions,
with multiple (to be clear, $n-r$) solution basis.
Such chemical reactions can be called "complicated reactions".
This means the reaction equation can be decomposed into
$n-r$ linearly independent simple reaction equations,
where the stoichiometries are the solution basis
we previously solved out.

Note that the solution basis of a complicated reaction are not unique,
so you may derive conclusions of completely different chemical meanings.
