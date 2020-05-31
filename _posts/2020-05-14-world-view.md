---
title: View of the world (physically rather than philosophically)
date: 2020-05-14 00:57:39 +0800
categories:
- physics
tags:
- imagination
- long paper
layout: post
---

# Introduction

Have you ever thought of how can we describe the basic
principles of our world (or universe), especially
in a physical or mathematical way?

The thought itself seems like a philosophical problem
(and is actually thought over by philosophers for thousands
of years). However, maybe it can be interesting to think
it over in another perspective.

# Galilean world

Here is the basic principle of the Galilean world:
> Principle 1: The world is a Galilean structure with
> $3$-dimensional space and $1$-dimensional time.

Here is the definition of a Galilean structure.
A *Galilean structure* with $\chi$-dimensional space
and $\iota$-dimensional time is a $3$-tuple
$\left(\mathscr A,\tau,\rho\right)$ with the following
principles:
1. $\mathscr A$ is a $\nu$-dimensional
affine space associated with the vector space $\mathbb R^\nu$,
where $\nu:=\chi+\iota$;
2. $\tau:\mathbb R^\nu\rightarrow\mathbb R^\iota$
is a linear mapping;
3. For $a,b\in\mathscr A$ such that $\tau\left(a-b\right)=0$,
the mapping $\rho$ satisfies
$\rho\left(a,b\right)=\sqrt{\left(a-b\right)^2}$.

To make the physical meanings of the above mathematical stuff
clear, we
- call $\mathscr A$ the *universe* or a *Galilean space*,
- call the points in the universe the *events*,
- call $\tau$ the *time*,
- say two events $a,b$ are *simultaneous*
iff $\tau\left(a-b\right)=0$,
- call $\rho\left(a,b\right)$ the
*distance between simultaneous events $a,b$*.

---
Here is the second principle of the Galilean world:
> Principle 2 (Galileo's principle of relativity):
> Laws of nature remain the same under Galilean transformation.

Here is the definition of a Galilean transformation.
An affine transformation $g$ over the Galilean space $\mathscr A$
is called a *Galilean transformation*
iff both of the following are satisfied:
1. $\forall a,b\in\mathscr A:
\tau\left(a-b\right)=\tau\left(ga-gb\right)$
(preservation of intervals of time),
2. $\forall a,b\in\mathscr A:
\tau\left(a-b\right)=0\Rightarrow
\rho\left(a,b\right)=\rho\left(ga,gb\right)$
(preservation of distance between simultaneous events).

Galilean transformations form a group (why?) called
the *Galilean group*, which is an
$\left(\iota+\frac{\chi\left(\chi+3\right)}2\right)$-dimensional
Lie group (why?).

---
\begin{align\*}
\mathscr A&:=\mathbb R^\nu,\\\\\
\tau&:=\left(t,x\right)\mapsto t,\\\\\
\rho&:=\left(a,b\right)\mapsto\sqrt{\left(a-b\right)^2}
\end{align\*}
is a Galilean structure (why?).
Here $\mathscr A$ is called the *Galilean coordinate space*.

The following transformations on the Galilean coordinate space
are Galilean transformations (why?):
1. $\left(t,x\right)\mapsto\left(t,x+vt\right)$,
where $v\in\mathbb R^\chi$ (*uniform motion*),
2. $\left(t,x\right)\mapsto\left(t+s,x+d\right)$,
where $s\in\mathbb R^\iota$ and $d\in\mathbb R^\chi$
(*translation*),
3. $\left(t,x\right)\mapsto\left(t,Gx\right)$,
where $G\in\mathrm O\left(\chi\right)$
(*rotation*).

Every Galilean transformation of the Galilean coordinate space
can be represented uniquely as the composition of a rotation,
a translation, and a uniform motion (why?).

All Galilean spaces with the same dimensions
are isomorphic to each other (why?).

---
In fact, the two principles above are not enough to
build up the whole classical mechanics.
We need to define motion, velocity, and acceleration
in our $3$-$1$ universe, and use the third principle
> Principle 3 (Newton's principle of determinacy):
> The motion is uniquely determined by initial positions
> and initial velocities.

to conclude that the motion can be depicted by
*Hamilton's principle*
\begin{equation\*}
    \mathrm\delta\int\mathcal L\left(q,\dot q,t\right)
\end{equation\*}
(why?), which leads to *Euler--Lagrange equation*
\begin{equation\*}
    \frac{\mathrm d}{\mathrm dt}
    \frac{\partial\mathcal L}{\partial\dot q}=
    \frac{\partial\mathcal L}{\partial q}
\end{equation\*}
(why?).

For a closed system, its Euler--Lagrange equation should
remain unchanged after a Galilean transformation
(in a specific coordinate system, which in most cases is
the Cartesian coordinate system utilized by
Galilean coordinate space) acts on it,
from which we can see that the universe is
*time-homogeneous* (invariance under time translation),
*space-homogeneous* (invariance under space translation),
and *space-isotropic* (invariance under space rotation).

The rest
(deriving the *Lagrangian* for some typical mechanical systems,
and solving them) is just the normal classical mechanics,
and is not related to the topic today.

# Einsteinian world

We can build up the Einsteinian world similarly as we have
done for the Galilean world.
> Principle 1: The world is an Einsteinian structure
> with $3$-dimensional space and $1$-dimensional time.

Here is the definition of an Einsteinian structure.
An *Einsteinian structure* with $\chi$-dimensional space
and $\iota$-dimensional time is a $4$-tuple
$\left(\mathscr A,\tau,\sigma,\rho\right)$
with the following principles:
1. $\mathscr A$ is a $\nu$-dimensional affine space
associated with the vector space $\mathbb R^\nu$,
where $\nu:=\chi+\iota$;
2. $\tau:\mathbb R^\nu\rightarrow\mathbb R^\iota$
and $\sigma:\mathbb R^\nu\rightarrow\mathbb R^\chi$
are linear mappings;
3. The linear mapping $a\mapsto\left(\tau\left(a\right),
\sigma\left(a\right)\right):
\mathbb R^\nu\rightarrow\mathbb R^\nu$ has full rank;
4. $\forall a,b\in\mathscr A:\rho\left(a,b\right)=
\sqrt{\tau\left(a-b\right)^2-\sigma\left(a-b\right)^2}$.

To make the physical meanings of the above mathematical
stuff clear, we
- call $\mathscr A$ the *universe* or an *Einsteinian space*,
- call the points in the universe the *events*,
- call $\tau$ the *time*,
- call $\sigma$ the *space*,
- call $\rho\left(a,b\right)$ the
*spacetime distance between events $a,b$*.

---
Here is the second principle of the Einsteinian world:
> Principle 2 (Einstein's principle of relativity):
> Laws of nature remain the same under
> extended Poincaré transformation.

Here is the definition of a Poincaré transformation.
An affine transformation $g$ over the Einsteinian space
$\mathscr A$ is called a *Poincaré transformation*
iff $\forall a,b\in\mathscr A:
\rho\left(a,b\right)=\rho\left(ga,gb\right)$.
Well, the definition is much simpler than that of
Galilean transformation.

Poincaré transformations form a group (why?)
called the *Poincaré group*, which is a
$\frac{\nu\left(\nu+1\right)}2$-dimensional Lie group (why?).

---
\begin{align\*}
    \mathscr A&:=\mathbb R^\nu,\\\\\
    \tau&:=\left(t,x\right)\mapsto t,\\\\\
    \sigma&:=\left(t,x\right)\mapsto x,\\\\\
    \rho&:=\left(a,b\right)\mapsto
    \sqrt{\tau\left(a-b\right)^2-\sigma\left(a-b\right)^2}
\end{align\*}
is an Einsteinian structure (why?).
Here $\mathscr A$ is called the *Minkowski space*.

The following transformations on the Minkowski space are
Poincaré transformations (why?):
1. $a\mapsto a+d$, where $d\in\mathbb R^\nu$ (*translation*),
2. $a\mapsto Ga$, where $G\in\mathrm O\left(\iota,\chi\right)$
is an indefinite orthogonal matrix (*rotation*).

Every Poincaré transformation of the Minkowski space can be
represented uniquely as the composition of a translation
and a rotation (why?).

All Einsteinian spaces with the same dimensions are isomorphic
to each other (why?).

---
The rest is just the same as what we have done with
Galilean world.
