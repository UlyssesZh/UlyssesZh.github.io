---
title: Use complex numbers as canonical variables
date: 2020-01-06 14:09:47 +0800
categories:
- physics
tags:
- classical mechanics
- canonical transformation
- hamiltonian
- complex
- long paper
layout: post
excerpt: 'In this article, I try exploring an idea:
using complex numbers to combine pairs of canonical variables into complex variables:
$\mathbf c\coloneqq\alpha\mathbf q+\mathrm i\beta\mathbf p$.
It turns out that we can write canonical equations
$\frac{\mathrm d\mathbf c}{\mathrm dt}=-2\mathrm i\alpha\beta\frac{\partial\mathcal H}{\partial\mathbf c^*}$,
Poisson brackets
$\left\{f,g\right\}=-2\mathrm i\alpha\beta
\left(\frac{\partial f}{\partial\mathbf c}\cdot
\frac{\partial g}{\partial\mathbf c^*}-
\frac{\partial f}{\partial\mathbf c^*}\cdot
\frac{\partial g}{\partial\mathbf c}\right)$,
and canonical transformations
$\frac{\partial\mathbf c^*}{\partial\mathbf c''^*}=
\frac{\partial\mathbf c''}{\partial\mathbf c},
\frac{\partial\mathbf c}{\partial\mathbf c''^*}=
-\frac{\partial\mathbf c''}{\partial\mathbf c^*}$
in these complex numbers.
Finally, I show two examples of using them in real problems:
a free particle, and a harmonic oscillator.'
---

## Introduction

In Hamiltonian mechanics, if we let
$$\mathbf c\coloneqq\alpha\mathbf q+\mathrm i\beta\mathbf p,$$ {#eq:def-c}
where $\alpha$ and $\beta$ are non-zero real numbers,
then two real vectors $\mathbf q$ and $\mathbf p$
becomes a complex vector $\mathbf c$.
In other words, we use $s$ complex numbers instead of $2s$ real numbers
to represent the status of a system, where $s$ is the DOF.

We are going to find out the form of some theorems in Hamiltonian mechanics
with respect to the complex variable that we have just defined.

Note that if you do not care about the units, it is recommended to let
$\alpha=\beta=\frac1{\sqrt2}$ due to the convenience.

## Hamiltonian

In this way,
the Hamiltonian is a function of real value with respect to a complex vector.
To be clear,
$$
    \mathcal H\!\left(\mathbf c,t\right)=
    \mathcal H\!\left(\mathbf q,\mathbf p,t\right).
$$
The Hamiltonian is not an analytical function,
so we need to redefine how a function can be differentiated
in order that the Hamiltonian is "differentiable."
The approach to this is to use the average of the limit along the real axis
and that along the imaginary axis, which means
$$
    \frac{\mathrm d}{\mathrm d\left(x+\mathrm iy\right)}\coloneqq
    \frac12\left(\frac\partial{\partial x}-
    \mathrm i\frac\partial{\partial y}\right).
$$
Thus,
$$
    \frac\partial{\partial\mathbf c}=
    \frac1{2\alpha}\frac\partial{\partial\mathbf q}-
    \frac{\mathrm i}{2\beta}\frac\partial{\partial\mathbf p}.
$$ {#eq:d-dc}
There is also an obvious property that for any function
$f:\mathbb C\rightarrow\mathbb R$, we have
$$
    \frac{\partial f}{\partial z^*}=
    \left(\frac{\partial f}{\partial z}\right)^*.
$$
Furthermore,
$$
    \frac\partial{\partial\mathbf q}=
    \alpha\left(\frac\partial{\partial\mathbf c}+
    \frac\partial{\partial\mathbf c^*}\right),\quad
    \frac\partial{\partial\mathbf p}=
    \mathrm i\beta\left(\frac\partial{\partial\mathbf c}-
    \frac\partial{\partial\mathbf c^*}\right).
$$ {#eq:d-dq-d-dp}

## Canonical equations

Now we may be curious about what will the canonical equations
$$\frac{\mathrm d\mathbf q}{\mathrm dt}=
    \frac{\partial\mathcal H}{\partial\mathbf p},\quad
    \frac{\mathrm d\mathbf p}{\mathrm dt}=
    -\frac{\partial\mathcal H}{\partial\mathbf q}
$$ {#eq:canonical-eq}
change into after $\mathbf c$ is introduced.

Apply Formula [@eq:d-dc] to $2\mathrm i\alpha\beta\mathcal H$,
and we can derive that
$$2\mathrm i\alpha\beta\frac{\partial\mathcal H}{\partial\mathbf c}=
   \alpha\frac{\partial\mathcal H}{\partial\mathbf p}+
   \mathrm i\beta\frac{\partial\mathcal H}{\partial\mathbf q}.$$ {#eq:dH-dc}
On the other hand, take the derivative of both sides of Formula [@eq:def-c],
and substitute Formula [@eq:canonical-eq] into it,
and then we can derive that
$$\frac{\mathrm d\mathbf c}{\mathrm dt}=
    \alpha\frac{\partial\mathcal H}{\partial\mathbf p}-
    \mathrm i\beta\frac{\partial\mathcal H}{\partial\mathbf q}.
$$ {#eq:dc-dt}
Compare Formula [@eq:dH-dc] and [@eq:dc-dt], we get the useful formula
$$
    \frac{\mathrm d\mathbf c}{\mathrm dt}=
    -2\mathrm i\alpha\beta
    \frac{\partial\mathcal H}{\partial\mathbf c^*}.
$$ {#eq:new-canonical-eq}
The new canonical equations are a set of $s$ ODEs of $1$st degree,
and there should be only $s$ (instead of $2s$) arbitrary constants
in the solution.

## Poisson bracket

The Poisson bracket $\left\{\cdot,\cdot\right\}$ can be defined just as usual:
$$
    \left\{f,g\right\}\coloneqq
    \frac{\partial f}{\partial\mathbf q}\cdot
    \frac{\partial g}{\partial\mathbf p}-
    \frac{\partial f}{\partial\mathbf p}\cdot
    \frac{\partial g}{\partial\mathbf q};
$$ {#eq:def-poisson}
while something beautiful will occur if we substitute Formula [@eq:d-dq-d-dp]
into [@eq:def-poisson]:
$$
    \left\{f,g\right\}=-2\mathrm i\alpha\beta
    \left(\frac{\partial f}{\partial\mathbf c}\cdot
    \frac{\partial g}{\partial\mathbf c^*}-
    \frac{\partial f}{\partial\mathbf c^*}\cdot
    \frac{\partial g}{\partial\mathbf c}\right).
$$ {#eq:new-poisson}
With Formula [@eq:new-poisson], you can also verify that
$$
    \frac{\mathrm d}{\mathrm dt}=
    \frac\partial{\partial t}-\left\{\mathcal H,\cdot\right\}.
$$ {#eq:d-dt-poisson}

## Canonical transformation

Consider some kind of transformation
$\mathbf c'=\mathbf c'\!\left(\mathbf c\right)$
that will preserve the form of the canonical equation, which means
$$
    \frac{\mathrm d\mathbf c'}{\mathrm dt}=
    -2\mathrm i\alpha\beta
    \frac{\partial\mathcal H}{\partial\mathbf c'^*}.
$$ {#eq:transformed-canonical-eq}
(We do not consider those transformations that involves $t$.
As we all know, if a canonical transformation involves $t$,
an additional part should be added to $\mathcal H$.)

Apply Formula [@eq:d-dt-poisson] to $\mathbf c'$
and make use of Formula [@eq:transformed-canonical-eq], we can derive that
$$
    \frac{\partial\mathcal H}{\partial\mathbf c'^*}=
    \left\{\mathbf c',\mathcal H\right\}.
$$
The equation should be true for all $\mathcal H$. In other words,
$$
    \frac\partial{\partial\mathbf c'^*}=
    \left\{\mathbf c',\cdot\right\},
$$
so
$$
    \frac{\partial\mathbf c^*}{\partial\mathbf c'^*}
    \frac\partial{\partial\mathbf c^*}+
    \frac{\partial\mathbf c}{\partial\mathbf c'^*}
    \frac\partial{\partial\mathbf c}=
    \frac{\partial\mathbf c'}{\partial\mathbf c}
    \frac\partial{\partial\mathbf c^*}-
    \frac{\partial\mathbf c'}{\partial\mathbf c^*}
    \frac\partial{\partial\mathbf c}.
$$
Note that usually $\frac\partial{\partial\mathbf c}$ and
$\frac\partial{\partial\mathbf c^*}$ are linearly independent,
so we can derive that
$$
    \frac{\partial\mathbf c^*}{\partial\mathbf c'^*}=
    \frac{\partial\mathbf c'}{\partial\mathbf c},\quad
    \frac{\partial\mathbf c}{\partial\mathbf c'^*}=
    -\frac{\partial\mathbf c'}{\partial\mathbf c^*}.
$$
Here it is a much more convenient way to judge whether a transformation
is a canonical transformation than to find a generating function.

With the property we have just found, it is easy to find out that
the Poisson brackets corresponding to different set of canonical variables
have the same value, which is to say that
$$
    \left\{f,g\right\}_{\mathbf c}=\left\{f,g\right\}_{\mathbf c'}.
$$

## Phase space

With the introduction of the complex variable $\mathbf c$,
the phase space becomes the vector space of $\mathbf c$,
which is $\mathbb C^s$.

I have not learned differential geometry about complex manifold,
so maybe there is some awesome extensions that can be made in the phase space,
while I will not be able to find them out...

## Some examples

### Free particle

The Hamiltonian of a free particle is
$$
    \mathcal H=\frac{\left(\Im\mathbf c\right)^2}{2m},
$$
where $\mathbf c$ is a $3$-dimensional complex vector, $\alpha=\beta=1$.
Substitute it into [@eq:new-canonical-eq], and then we can derive that
$$
    \frac{\mathrm d\mathbf c}{\mathrm dt}=
    \frac{\Im\mathbf c}m.
$$
By solving it, we can derive that
$$
    \mathbf c=\frac{\Im\mathbf c_0}mt+\mathbf c_0,
$$
where $\mathbf c_0$ is $3$ arbitrary complex constants.

### Harmonic oscillator

The Hamiltonian of a harmonic oscillator is
$$
    \mathcal H=\frac{\left|c\right|^2}2,
$$
where $c$ is a complex number, $\alpha=\sqrt k$, $\beta=\frac1{\sqrt m}$.
Substitute it into [@eq:new-canonical-eq], and then we can derive that
$$
    \frac{\mathrm dc}{\mathrm dt}=-\mathrm i\omega c,
$$
where $\omega\coloneqq\alpha\beta=\sqrt{\frac km}$.
By solving it, we can derive that
$$
    c=c_0\mathrm e^{-\mathrm i\omega t},
$$
where $c_0$ is an arbitrary complex constant.
