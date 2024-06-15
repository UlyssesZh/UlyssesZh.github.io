---
title: The gauge covariant derivative and the covariant derivative
date: 2024-05-27 17:39:22 -0700
categories:
- physics
tags:
- field theory (physics)
- gauge theory (physics)
- differential geometry
- general relativity
layout: post
excerpt: 'The name "guage covariant derivative" may have reminded you
of the covariant derivative (connection) in general relativity or differential geometry.
Do they necessary have something in common?
It turns out that they do.'
---

(The word *field* in this article refers to the field as in classical field theory and quantum field theory in physics,
not the field as in a vector space over a field in mathematics.)

The covariant derivative in general relativity or differential geometry looks like this
(here $v^b$ is a vector field, and $\Gma{}^b{}_a{}_c$ is
the Christoffel symbol of the coordinate system with which $\partial_a$ associates):

$$\nabla_a v^b=\partial_a v^b+\Gma{}^b{}_a{}_c v^c.$$

The gauge covariant derivative in (either abelian or nonabelian) gauge theory look like this
(here $\Psi$ is a field, and $A$ is the gauge field):

$$D_\mu\Psi^i=\partial_\mu\Psi^i-\i gA{}_\mu{}^i{}_j\Psi^j.$$

The similarity between those two is inspiring,
especially when they are both called covariant derivatives.
How do they come to be like this?

## The origin

The form of the covariant derivative in differential geometry
comes from the fact that the difference of two derivative operators
acting on a tensor field at some point
is always linear in the value of the tensor field at that point.
Then, for a manifold on which a metric $g_{bc}$ is defined,
we can define the covariant derivative to be the derivative operator
$\nabla_a$ such that $\nabla_a g_{bc}=0$ (i.e., the Levi-Civita connection).
Then, for any coordinate system, $\nabla_a-\partial_a$
maps a $\p{k,l}$-tensor field to a $\p{k,l+1}$-tensor field
whose value at any point is linear in the value of the original tensor field at that point.
This linear relation is captured by a $\p{1,2}$-tensor field
that is called the Christoffel symbol $\Gma{}^b{}_a{}_c$.

<details><summary>Proof</summary>

We can prove that, for any two derivative operators $\nabla_a$ and $\tilde\nabla_a$ on the manifold $M$,
and for two covector fields $\omg_b$ and $\omg'_b$ on $M$,
as long as $\abar{\omg_b}p=\abar{\omg'_b}p$ for some $p\in M$, we have

$$\abar{\p{\tilde\nabla_a-\nabla_a}\omg_b}p
=\abar{\p{\tilde\nabla_a-\nabla_a}\omg'_b}p.$$

*Proof.*
Define $\Omg_b\ceq\omg_b'-\omg_b$.
Then, we just need to prove that

$$\abar{\nabla_a\Omg_b}p=\abar{\tilde\nabla_a\Omg_b}p$$

whenever $\abar{\Omg_b}p=0$.

Now, expand $\Omg_b$ in the basis $\B{\p{\d x^\mu}_b}$:

$$\Omg_b=\Omg_\mu\p{\d x^\mu}_b,$$

where $\Omg_\mu$ are components of $\Omg_b$ in this basis.
Then, by Leibniz's product rule,

$$\abar{\nabla_a\Omg_b}p=\abar{\nabla_a\p{\Omg_\mu\p{\d x^\mu}_b}}p
=\underbrace{\abar{\Omg_\mu}p}_0\abar{\nabla_a\p{\d x^\mu}_b}p
+\abar{\p{\d x^\mu}_b}p\abar{\nabla_a\Omg_\mu}p
=\abar{\p{\d x^\mu}_b}p\abar{\nabla_a\Omg_\mu}p.$$

Similarly,

$$\abar{\tilde\nabla_a\Omg_b}p=\abar{\p{\d x^\mu}_b}p\abar{\tilde\nabla_a\Omg_\mu}p.$$

Because $\Omg_\mu$ is just a scalar field on $M$, we have
$\abar{\nabla_a\Omg_\mu}p=\abar{\tilde\nabla_a\Omg_\mu}p$.
Therefore, $\abar{\nabla_a\Omg_b}p=\abar{\tilde\nabla_a\Omg_b}p$.
{% qed %}

Because $\p{\nabla_a-\tilde\nabla_a}\omg_b$ is linear in $\omg_b$,
we then must have $\abar{\p{\nabla_a-\tilde\nabla_a}\omg_b}p$
linear in $\abar{\omg_b}p$.
This linear relation can be encoded into a tensor
$\abar{C{}^c{}_a{}_b}p$ such that

$$\abar{\p{\nabla_a-\tilde\nabla_a}\omg_b}p=\abar{C{}^c{}_a{}_b}p\abar{\omg_c}p.$$

Because such a tensor exists for any $p$, we can define a tensor field $C{}^c{}_a{}_b$ such that

$$\p{\nabla_a-\tilde\nabla_a}\omg_b=C{}^c{}_a{}_b\omg_c.$$

Spcecially, when $\nabla_a$ is the covariant derivative (the Levi-Civita connection)
and $\tilde\nabla_a$ is the coordinate partial derivative,
we have $C{}^c{}_a{}_b=\Gma{}^c{}_a{}_b$ called the Christoffel symbol.
This conclusion can be generalized to any tensor field.

</details>

The form of the gauge covariant derivative actually has a similar origin.
However, the wording would be a little different because there is no notion of a derivative operator
(maybe there is, but I have not heard of it).
Basically, the reason is that there is no benefit in defining such a thing:
the space of fields simply would not exist if we have not specified
the gauge symmetry group and a representation of it.
Then, the only sensible derivative operator that we want to define
is the one that is compatible with the gauge symmetry,
which we call the gauge covariant derivative.
Other derivative operators (except the coordinate partial derivative, of course)
are simply so useless that we do not even bother to think about them.
The whole story is different in differential geometry
because it is still interesting to consider derivative operators
on manifolds without any defined metric.

<details><summary>Definition of derivative operators on a manifold</summary>

Let $M$ be a manifold.
Let $\fc{\mscr F}{k,l}$ be the set of all $\p{k,l}$-tensor fields
that are $\mrm C^1$ on $M$.
A map $\nabla$ is called a (torsion-free) derivative operator on $M$ iff,
for any $k,l\in\bN$, it maps $\fc{\mscr F}{k,l}$ to $\fc{\mscr F}{k,l+1}$,
and it satisfies the following properties:

- It is linear;
- It satisfies the Leibniz product rule (w.r.t. the tensor product);
- It is compatible with index contraction
(contracting indices before or after applying $\nabla$ gives the same result);
- For any $v\in\fc{\mscr F}{1,0}$ (tangent vector field) and $f\in\fc{\mscr F}{0,0}$ (scalar field),
$\fc vf=v^a\nabla_af$;
- It is torsion-free.

</details>

Therefore, for there to be a story like the one in differential geometry,
we need to define what a derivative operator is for a field in field theory.
The full definition would be hard to phrase because
there are all sorts of different objects in field theory
(fields living in different representations of different groups,
carrying different kinds of indices),
but we may simplify it greatly because we are only interested in
the indices from vector space $V$ on which the representation
$\rho:G\to\opc{GL}V$ of the gauge symmetry group $G$ acts.
Even the Lorentz index carried by the derivative operator is not important here.
Then, we can define derivative operators similar to how we do it for manifolds.

<details><summary>Differences</summary>

However, there are some differences between the situations in gauge theory and in differential geometry.
This makes some of the properties that I listed above about the derivative operators
for a manifold not applicable to the derivative operators in gauge theory:

- The compatibility between the derivative operator
and the directional derivative (the property that says $\fc vf=v^a\nabla_af$)
is now nonsense because we now do not let the derivative operator carry a index.
We can simply throw away this property because it would be related
to contracting with Lorentz vectors anyway, which is not important here.
- The torsion-free property is also nonsense because we do not have a notion of torsion
again due to the lack of the index carried by the derivative operator.
We can throw away this property as well.
Actually, if we were to include the Lorentz index,
the torsion-free property would be violated
(otherwise the field strength $F_{\mu\nu}$ cannot come to be).

</details>
