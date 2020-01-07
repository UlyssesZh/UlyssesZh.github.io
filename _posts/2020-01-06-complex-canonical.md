---
layout: post
title: Use complex numbers as canonical variables
date: 2020-01-06 14:09:47 +0800
categories: physics
---

# Introduction

In Hamiltonian physics, if we let
\begin{equation}
    \mathbf c:=\alpha\mathbf q+\mathrm i\beta\mathbf p,
    \label{def c}
\end{equation}
where $\alpha$ and $\beta$ are non-zero real numbers,
then two real vectors $\mathbf q$ and $\mathbf p$
becomes a complex vector $\mathbf c$.
In other words, we use $s$ complex numbers instead of $2s$ real numbers
to represent the status of a system, where $s$ is the DOF.

We are going to find out the form of some theorems in Hamiltonian mechanics
with respect to the complex variable that we have just defined.

Note that if you do not care about the units, it is recommended to let
$\alpha=\beta=\frac1{\sqrt2}$ due to the convenience.

# Hamiltonian

In this way,
the Hamiltonian is a function of real value with respect to a complex vector.
To be clear,
\begin{equation\*}
    \mathcal H\left(\mathbf c,t\right)=
    \mathcal H\left(\mathbf q,\mathbf p,t\right).
\end{equation\*}

The Hamiltonian is not an analytical function,
so we need to redefine how a function can be differentiated
in order that the Hamiltonian is "differentiable."
The approach to this is to use the average of the limit along the real axis
and that along the imaginary axis, which means
\begin{equation\*}
    \frac{\mathrm d}{\mathrm d\left(x+\mathrm iy\right)}:=
    \frac12\left(\frac\partial{\partial x}-
    \mathrm i\frac\partial{\partial y}\right).
\end{equation\*}

Thus,
\begin{equation}
    \frac\partial{\partial\mathbf c}=
    \frac1{2\alpha}\frac\partial{\partial\mathbf q}-
    \frac{\mathrm i}{2\beta}\frac\partial{\partial\mathbf p}.
    \label{d/dc}
\end{equation}
There is also an obvious property that for any function
$f:\mathbb C\rightarrow\mathbb R$, we have
\begin{equation\*}
    \frac{\partial f}{\partial z^\*}=
    \left(\frac{\partial f}{\partial z}\right)^*.
\end{equation\*}
Furthermore,
\begin{equation}
    \frac\partial{\partial\mathbf q}=
    \alpha\left(\frac\partial{\partial\mathbf c}+
    \frac\partial{\partial\mathbf c^\*}\right),\ \ 
    \frac\partial{\partial\mathbf p}=
    \mathrm i\beta\left(\frac\partial{\partial\mathbf c}-
    \frac\partial{\partial\mathbf c^\*}\right).
    \label{d/dq & d/dp}
\end{equation}

# Canonical equations

Now we may be curious about what will the canonical equations
\begin{equation}
    \frac{\mathrm d\mathbf q}{\mathrm dt}=
    \frac{\partial\mathcal H}{\partial\mathbf p},\ \ 
    \frac{\mathrm d\mathbf p}{\mathrm dt}=
    -\frac{\partial\mathcal H}{\partial\mathbf q}
    \label{canonical eq}
\end{equation}
change into after $\mathbf c$ is introduced.

Apply Formula \ref{d/dc} to $2\mathrm i\alpha\beta\mathcal H$,
and we can derive that
\begin{equation}
   2\mathrm i\alpha\beta\frac{\partial\mathcal H}{\partial\mathbf c}=
   \alpha\frac{\partial\mathcal H}{\partial\mathbf p}+
   \mathrm i\beta\frac{\partial\mathcal H}{\partial\mathbf q}.
   \label{dH/dc}
\end{equation}
On the other hand, take the derivative of both sides of Formula \ref{def c},
and substitute Formula \ref{canonical eq} into it,
and then we can derive that
\begin{equation}
    \frac{\mathrm d\mathbf c}{\mathrm dt}=
    \alpha\frac{\partial\mathcal H}{\partial\mathbf p}-
    \mathrm i\beta\frac{\partial\mathcal H}{\partial\mathbf q}.
    \label{dc/dt}
\end{equation}

Compare Formula \ref{dH/dc} and \ref{dc/dt}, we get the useful formula
\begin{equation}
    \frac{\mathrm d\mathbf c}{\mathrm dt}=
    -2\mathrm i\alpha\beta
    \frac{\partial\mathcal H}{\partial\mathbf c^\*}.
    \label{new canonical eq}
\end{equation}
The new canonical equations are a set of $s$ ODEs of $1$st degree,
and there should be only $s$ (instead of $2s$) arbitrary constants
in the solution.

# Poisson bracket

The Poisson bracket $\left\\{\cdot,\cdot\right\\}$ can be defined just as usual:
\begin{equation}
    \left\\{f,g\right\\}:=
    \frac{\partial f}{\partial\mathbf q}\cdot
    \frac{\partial g}{\partial\mathbf p}-
    \frac{\partial f}{\partial\mathbf p}\cdot
    \frac{\partial g}{\partial\mathbf q};
    \label{def poisson}
\end{equation}
while something beautiful will occur if we substitute Formula \ref{d/dq & d/dp}
into \ref{def poisson}:
\begin{equation}
    \left\\{f,g\right\\}=-2\mathrm i\alpha\beta
    \left(\frac{\partial f}{\partial\mathbf c}\cdot
    \frac{\partial g}{\partial\mathbf c^\*}-
    \frac{\partial f}{\partial\mathbf c^\*}\cdot
    \frac{\partial g}{\partial\mathbf c}\right).
    \label{new poisson}
\end{equation}

With Formula \ref{new poisson}, you can also verify that
\begin{equation}
    \frac{\mathrm d}{\mathrm dt}=
    \frac\partial{\partial t}-\left\\{\mathcal H,\cdot\right\\}.
    \label{d/dt & poisson}
\end{equation}

# Canonical transformation

Consider some kind of transformation
$\mathbf c'=\mathbf c'\left(\mathbf c\right)$
that will preserve the form of the canonical equation, which means
\begin{equation}
    \frac{\mathrm d\mathbf c'}{\mathrm dt}=
    -2\mathrm i\alpha\beta
    \frac{\partial\mathcal H}{\partial\mathbf c'^\*}.
    \label{transformed canonical eq}
\end{equation}
(We do not consider those transformations that involves $t$.
As we all know, if a canonical transformation involves $t$,
an additional part should be added to $\mathcal H$.)

Apply Formula \ref{d/dt & poisson} to $\mathbf c'$
and make use of Formula \ref{transformed canonical eq}, we can derive that
\begin{equation\*}
    \frac{\partial\mathcal H}{\partial\mathbf c'^\*}=
    \left\\{\mathbf c',\mathcal H\right\\}.
\end{equation\*}
The equation should be true for all $\mathcal H$. In other words,
\begin{equation\*}
    \frac\partial{\partial\mathbf c'^\*}=
    \left\\{\mathbf c',\cdot\right\\},
\end{equation\*}
so
\begin{equation\*}
    \frac{\partial\mathbf c^\*}{\partial\mathbf c'^\*}
    \frac\partial{\partial\mathbf c^\*}+
    \frac{\partial\mathbf c}{\partial\mathbf c'^\*}
    \frac\partial{\partial\mathbf c}=
    \frac{\partial\mathbf c'}{\partial\mathbf c}
    \frac\partial{\partial\mathbf c^\*}-
    \frac{\partial\mathbf c'}{\partial\mathbf c^\*}
    \frac\partial{\partial\mathbf c}.
\end{equation\*}
Note that usually $\frac\partial{\partial\mathbf c}$ and
$\frac\partial{\partial\mathbf c^\*}$ are linearly independent,
so we can derive that
\begin{equation\*}
    \frac{\partial\mathbf c^\*}{\partial\mathbf c'^\*}=
    \frac{\partial\mathbf c'}{\partial\mathbf c},\ \ 
    \frac{\partial\mathbf c}{\partial\mathbf c'^\*}=
    -\frac{\partial\mathbf c'}{\partial\mathbf c^\*}.
\end{equation\*}
Here it is a much more convenient way to judge whether a transformation
is a canonical transformation than to find a generating function.

With the property we have just found, it is easy to find out that
the Poisson brackets corresponding to different set of canonical variables
have the same value, which is to say that
\begin{equation\*}
    \left\\{f,g\right\\}\_{\mathbf c}=\left\\{f,g\right\\}\_{\mathbf c'}.
\end{equation\*}

# Phase space

With the introduction of the complex variable $\mathbf c$,
the phase space becomes the vector space of $\mathbf c$,
which is $\mathbb C^s$.

I have not learned differential geometry about complex manifold,
so maybe there is some awesome extensions that can be made in the phase space,
while I will not be able to find them out...

# Some examples

## Free particle

The Hamiltonian of a free particle is
\begin{equation\*}
    \mathcal H=\frac{\left(\Im\mathbf c\right)^2}{2m},
\end{equation\*}
where $\mathbf c$ is a $3$-dimensional complex vector, $\alpha=\beta=1$.
Substitute it into \ref{new canonical eq}, and then we can derive that
\begin{equation\*}
    \frac{\mathrm d\mathbf c}{\mathrm dt}=
    \frac{\Im\mathbf c}m.
\end{equation\*}
By solving it, we can derive that
\begin{equation\*}
    \mathbf c=\frac{\Im\mathbf c\_0}mt+\mathbf c\_0,
\end{equation\*}
where $\mathbf c\_0$ are $3$ arbitrary complex constants.

## Harmonic oscillator

The Hamiltonian of a harmonic oscillator is
\begin{equation\*}
    \mathcal H=\frac{\left|c\right|^2}2,
\end{equation\*}
where $c$ is a complex number, $\alpha=\sqrt k$, $\beta=\frac1{\sqrt m}$.
Substitute it into \ref{new canonical eq}, and then we can derive that
\begin{equation\*}
    \frac{\mathrm d\mathbf c}{\mathrm dt}=-\mathrm i\omega c,
\end{equation\*}
where $\omega:=\alpha\beta=\sqrt{\frac km}$.
By solving it, we can derive that
\begin{equation\*}
    c=c\_0\mathrm e^{-\mathrm i\omega t},
\end{equation\*}
where $c\_0$ is an arbitrary complex constant.
