---
title: Some understanding of Grassmann numbers out of intuition
date: 2024-10-10 22:40:02 -0700
categories:
- math
tags:
- quantum field theory
- linear algebra
- abstract algebra
layout: post
excerpt: 'I was briefly introduced to Grassmann numbers when I studied quantum field theory.
I then had the natural question of how we can formally define them.
In this article, I went with my intuition and tried to answer this question.'
---

*This article (except the introduction and the afterwords)
is my answer to one of the homework problems
that I did when I took a quantum field theory course.
The original problem asked to verify the formula for linear change of variables
in integration.
It was originally written on 2024-02-06.*

---

## Introduction

Although Grassmann numbers are purely mathematical concept,
but like most people, I was introduced to them in physics class.
I then had the natural question: how to formally define Grassmann numbers?
In a homework given by my professor of QFT course,
I found that I had to answer the question to do a problem in the homework
in a way that I am satisfied with.

## Numbers

Let $\p{\mbb G_0,+}$ and $\p{\mbb G_1,+}$ be two abelian groups such that
$\mbb G_0\cap\mbb G_1=\B{0}$.
For convenience, for any $k\in\bN$, define $\mbb G_k\ceq\mbb G_{k\bmod2}$.
Define a multiplication on $\mbb G_0\cup\mbb G_1$ such that

- multiplication is associative, non-degenerate, and distributive over addition;
- $\mbb G_0$ are <dfn>commuting numbers</dfn> and $\mbb G_1$ are <dfn>anticommuting numbers</dfn>:
$$\forall\psi_1\in\mbb G_{k_1},\psi_2\in\mbb G_{k_2}:
\psi_1\psi_2=\p{-}^{k_1k_2}\psi_2\psi_1;$$
- and there is a unity $1\in\mbb G_0$ such that $1+\cdots+1\ne0$ for any finite number of summands.

<p class="no-indent">
We then have to have
$$\forall\psi_1\in\mbb G_{k_1},\psi_2\in\mbb G_{k_2}:
\psi_1\psi_2\in\mbb G_{k_1+k_2}.$$
Therefore, $\mbb G_0$ is a commutative ring with characteristic zero, and $\mbb G_1$ is a $\mbb G_0$-module.
We can then define linear functions with this structure.
In this sense, the multiplication on $\mbb G_1$ defines a symplectic bilinear form.
</p>

These are not enough to define every property we need for $\mbb G_0$ and $\mbb G_1$.
I will introduce more properties as axioms later.

## Tensors

It seems that we need this property as an axiom:
for any linear function $\func\lmd{\mbb G_k}{\mbb G_0}$,
$$\exists!\vphi\in\mbb G_k:\lmd=\p{\psi\mapsto\vphi\psi}.$$
I call this property the <dfn>first representation property</dfn>,
analog to the Riez representation theorem.
I will call linear functions that maps objects to $\mbb G_0$ <dfn>linear functionals</dfn>,
and the <dfn>dual space</dfn> of a $\mbb G_0$-module as the set of all linear functionals on it.

With the fist representation property, we can identify $\mbb G_k$ with its dual space
so that any <dfn>multilinear map (tensor)</dfn> have well-defined components.
For any $k$-linear map $\func T{\p{\mbb G_1^n}^k}{\mbb G_0}$
(or alternatively called a rank-$k$ tensor on $\mbb G_1^n$),
we can write it uniquely in the form
$$\fc T{\psi_1,\dots,\psi_k}=\psi_{1i_1}\cdots\psi_{ki_k}a_{i_1\cdots i_k},$$
where the components $T_{i_1\cdots i_k}\in\mbb G_k$,
and the dummy indices are summed from $1$ to $n$.
Denote the set of all rank-$k$ tensors on $\mbb G_1^n$ as $\mcal T_1^{nk}$.

Similarly, we can define $k$-linear maps $\func T{\p{\mbb G_0^n}^k}{\mbb G_0}$
(or rank-$k$ tensors on $\mbb G_0^n$),
whose components are in $\mbb G_0$, and denote the set of all of them
as $\mcal T_0^{nk}$.
Tensors from $\mcal T_0^{nk}$ and those from $\mcal T_1^{nk}$ can be multiplied
and contracted together without any problems.
However, the result of these operations may not be in $\mcal T_0^{nk}$ or $\mcal T_1^{nk}$,
but some tensor that takes arguments from both $\mbb G_0^n$ and $\mbb G_1^n$.

## Linear endomorphisms

Here we will need another property as an axiom:
for any linear function $\func\lmd{\mbb G_k}{\mbb G_k}$,
$$\exists!\vphi\in\mbb G_0:\lmd=\p{\psi\mapsto\vphi\psi}.$$
I call this property the <dfn>second representation property</dfn>.
This is very similar to the first representation property,
but it covers linear endomorphisms on $\mbb G_k$ instead of linear functionals on $\mbb G_k$.

With the second representation property, we can prove that
any possible linear endomorphism $J$ on $\mbb G_k^n$
can be written as a unique matrix in $\mbb G_0^{n\times n}$
acting on the components of the argument:
$$\fc J\psi_i=J_{ij}\psi_j,$$
where $J_{ij}\in\mbb G_0$ are called the components of the linear endomorphism $J$.
From now on, we do not need to distinguish between matrices in $\mbb G_0^{n\times n}$
and linear endomorphisms on $\mbb G_k^n$.

For a matrix $J\in\mbb G_0^{n\times n}$, we can define its determinant as
$$\det J\ceq J_{1i_1}\cdots J_{ni_n}\veps^{\b n}_{i_1\cdots i_n}\in\mbb G_0,$$
where $\veps^{\b n}\in\mcal T_0^{nn}$ is the Levi-Civita symbol,
which is a completely antisymmetric tensor on $\mbb G_0^n$
whose components take values in $\B{-1,0,1}\subset\mbb G_0$.

## Analytic functions

For any $T\in\mcal T_1^{nk}$, define a degree-$k$ <dfn>monomial</dfn> on $\mbb G_1^n$ as
$$\vfunc{M_T}{\mbb G_1^n}{\mbb G_0}{\psi}{\fc T{\psi,\dots,\psi}},$$
which is a degree-$k$ homogeneous function on $\mbb G_1^n$.
Note that different tensors may correspond to the same monomial.
Especially, for any $k>n$, a degree-$k$ monomial must be trivial (send any input to zero).
Also, if there is any pair of indices such that $T$ is symmetric in exchanging them,
then the monomial $M_T$ must be trivial.
Therefore, we only need to consider the those completely antisymmetric tensors
when studying monomials.
Denote the set of all completely antisymmetric rank-$k$ tensors on $\mbb G_1^n$ as $\mcal T_1^{n\b k}$,
and then the fact that we only need antisymmetric tensors to define monomials can be written as
$M_{\mcal T_1^{n\b k}}=M_{\mcal T_1^{nk}}$.

An <dfn>analytic function</dfn> $f$ on $\mbb G_1^n$ is defined as a sum of monomials:
$$\vfunc f{\mbb G_1^n}{\mbb G_0}\psi{\sum_k \fc{M_{T^{\b k}}}\psi},$$
where $T^{\b k}\in\mcal T_1^{n\b k}$,
whose components may be referred to as <dfn>expansion coefficients</dfn>.
We do not need to worry about the convergence because this is a finite sum
($k\le n$).
Denote the set of all analytic functions on $\mbb G_1^n$ as $\mcal A_n$.

Two properties of analytic functions:

- If $f\in\mcal A_n$, then for any $\dlt\in\mbb G_1^n$, the translation
$\p{\psi\mapsto\fc f{\psi+\dlt}}\in\mcal A_n$.
- If $f\in\mcal A_n$, then for any $J\in\mbb G_0^{n\times n}$, the linear transformation in the argument
$f\circ J\in\mcal A_n$.

## Integrals

Now we define that a linear function $\int:\mcal A_n\to\mbb G_n$ is called an <dfn>integral</dfn>
if it satisfies the following property:
$$\forall f\in\mcal A_n,\dlt\in\mbb G_1^n:\int f=\int\psi\mapsto\fc f{\psi+\dlt},$$
which intuitively means that an integral is invariant under translation.

With this definition of an integral, we are now interested in
the most general form of an integral.

Because $\int$ is linear, we can find its form on monomials,
and then sum them up to get the form on all analytic functions.
As a linear function on monomials, it must be of the form
(by the second representation property)
$$\int M_{T^{\b k}}=c^{\b k}_{i_1\cdots i_k}T^{\b k}_{i_1\cdots i_k},$$
where $c^{\b k}\in\mcal T_0^{n\b k}$ does not depend on $T^{\b k}$.
Plug this form into the translational invariance of $\int$, and we have
$$\begin{align*}
	c_{i_1\cdots i_k}^{\b k}T^{\b k}_{i_1\cdots i_k}
	&=\int\psi\mapsto\p{\psi_{i_1}+\dlt_{i_1}}\cdots\p{\psi_{i_k}+\dlt_{i_k}}T^{\b k}_{i_1\cdots i_k}\\
	&=\int\psi\mapsto\sum_l\binom kl\psi_{i_1}\cdots\psi_{i_l}
	\dlt_{i_{l+1}}\cdots\dlt_{i_k}T^{\b k}_{i_1\cdots i_k}\\
	&=\sum_l\binom kl c^{\b l}_{i_1\cdots i_l}\dlt_{i_{l+1}}\cdots\dlt_{i_k}T^{\b k}_{i_1\cdots i_k}
\end{align*}$$
(here the binomial coefficient should be regarded as its image under
the natural ring homomorphism from $\bZ$ to $\mbb G_0$,
which must be non-zero because $\mbb G_0$ has characteristic zero).
Regarding $T^{\b k}$ as the independent variable,
this equation is a homogeneous linear equation $\fc{L^{\b k}}{T^{\b k}}=0$
associated with the linear operator $L$ on $\mcal T_1^{n\b k}$ defined as
$$L^{\b k}_{i_1\cdots i_k}\ceq
c^{\b k}_{i_1\cdots i_k}-\sum_l\binom kl c^{\b l}_{i_1\cdots i_l}\dlt_{i_{l+1}}\cdots\dlt_{i_k}.$$
For the solution set of the linear equation
to be the whole space $\mcal T_1^{n\b k}$, we need $L^{\b k}=0$.
Again by the second representation property, we need all the components to vanish
(strictly speaking, we need the completely antisymmetric part to vanish,
but they are already completely antisymmetric):
$$\forall k\le n,\dlt\in\mbb G_1^n,i_1,\dots,i_k:
c^{\b k}_{i_1\cdots i_k}-\sum_l\binom kl c^{\b l}_{i_1\cdots i_l}\dlt_{i_{l+1}}\cdots\dlt_{i_k}=0.$$
The first term cancels with the $l=k$ term in the sum,
so this equation does not impose any requirement for $c^{\b k}$
but only impose requirements for $c^{\b l}$ with $l<k$.
Then, we can induce on $k$:
the equation for $k=0$ does nothing;
the equation for $k=1$ requires $c^{\b 0}$ to vanish;
the equation for $k=2$, given that $c^{\b 0}$ vanishes, now requires $c^{\b 1}$ to vanish;
and so on.
For each $k$, the equation additionally requires $c^{\b{k-1}}$ to vanish.
Finally, when we reach $k=n$, which is the end of the induction,
we require $c^{\b l}$ to vanish for all $l<n$,
and there is no requirement for $c^{\b n}$.
Therefore, the integral of any monomial is zero except for the degree-$n$ monomial,
and thus we only need to consider the $n$th degree term when finding
the integral of an analytic function.

Note that $\mcal T_k^{n\b n}=\mbb G_k\veps^{\b n}$
(in other words, the most general form of a completely antisymmetric rank-$n$ tensor
on $\mbb G_k^n$ is a constant in $\mbb G_k$ times the Levi-Civita symbol).
Therefore,
$$c^{\b n}_{i_1\cdots i_n}=c_n\veps^{\b n}_{i_1\cdots i_n},
\quad T^{\b n}_{i_1\cdots i_n}=d\veps^{\b n}_{i_1\cdots i_n},$$
where $c_n=\in\mbb G_0$ and $d\in\mbb G_n$.
The definition of an integral does not impose any requirement for $c_n$,
so it can be any element in $\mbb G_0$.
For convenience, define $c_n\ceq1$ for all $n$, and then we have
$$\int M_{d\veps^{\b n}}=\veps^{\b n}_{i_1\cdots i_n}d\veps^{\b n}_{i_1\cdots i_n}
=n!\,d,$$
where $n!$ is the image of $n!$ under the natural ring homomorphism from $\bZ$ to $\mbb G_0$.
The integral of any monomial with its degree different from $n$ is zero,
so the integral of any analytic function is just that of its degree-$n$ term:
$$\int\psi\mapsto\sum_k \fc{M_{T^{\b k}}}\psi=n!\,T^{\b n}_{1\cdots n}.$$

## Linear change of integrated variable

Now, for a linear endomorphism $J\in\mbb G_0^{n\times n}$ and an analytic function $f\in\mcal A_n$,
consider the integral $\int f\circ J$.
We only needs to consider the degree-$n$ monomial term, which is
$$\fc{M_{T^{\b n}}}{\fc J\psi}=J_{i_1j_1}\psi_{j_1}\cdots J_{i_nj_n}\psi_{j_n}d\veps^{\b n}_{i_1\cdots i_n},$$
where $T^{\b n}=d\veps^{\b n}$ is used.
Notice that $\veps_{i_1\cdots i_n}J_{i_1j_1}\cdots J_{i_nj_n}$ itself is
a rank-$n$ completely antisymmetric tensor on $\mbb G_0^n$,
so it can also be written as a constant times $\veps^{\b n}$.
By letting $j_1,\dots,j_n$ be $1,\dots,n$ respectively,
we see that the constant is just $\det J$.
Therefore,
$$\fc{M_{T^{\b n}}}{\fc J\psi}=\fc{M_{T^{\b n}}}\psi\det J.$$
By the linearty of the integral, we have
$$\forall f\in\mcal A_n:\int f\circ J=\det J\int f.$$

## Afterwords

Actually, before I wrote my answer, I already know the exterior algebra.
In this article, my definition to Grassmann numbers is more abstract
and puts the commuting numbers and anticomuuting numbers in more equal footings.
This definition is closer to what I intuitively think Grassmann numbers could be.

There are several potential problems in this article:

- Some axioms are given, but I did not prove that they are consistent.
- Some claims are made without proof. They may turn out to be wrong.
- I did not prove that the usual definition of Grassmann numbers
(with exterior algebra) can be formulated as a special case of my definition.
- I am not educated in supersymmetry, which is where Grassmann numbers are applied most.
I only made my definition comply with the properties of Grassmann numbers
that I have learned for doing the path integral of fermionic fields.
