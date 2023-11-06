---
title: 'Solving ODE by recursive integration'
date: 2022-11-15 15:02:30 -0800
categories:
- math
tags:
- ode
- calculus
layout: post
excerpt: 'By recursively integrating according to $x_{n+1}\!\left(t\right):=\int_{t_0}^tf\!\left(x_n\!\left(s\right),s\right)\,\mathrm ds+C$
from $x_0\!\left(t_0\right):=C$,
we can get the solution of the ODE $x''\!\left(t\right)=f\!\left(x\!\left(t\right),t\right)$
with initial conditions $x\!\left(t_0\right)=C$ as the limit of the sequence of functions.'
---

## The method

Suppose we have an ODE (with initial conditions)

$$x'\!\left(t\right)=f\!\left(x\!\left(t\right),t\right),
\quad x\!\left(t_0\right)=C,$$ {#eq:eq-ode}

where $x$ is the unknown function,
and $f$ is Lipschitz continuous in its first argument and continuous in its second argument.
By Picard--Lindelöf theorem, we can seek the unique solution within $t\in\left[t_0-\varepsilon,t_0+\varepsilon\right]$.

Here, I propose the following method:
we can write out a sequence of functions defined by

$$x_0\!\left(t\right):=C,$$ {#eq:eq-x0}

$$x_{n+1}\!\left(t\right):=\int_{t_0}^tf\!\left(x_n\!\left(s\right),s\right)\,\mathrm ds+C$$ {#eq:eq-xn-1}

(the properties of $f$ guarantee that the integral is well-defined).
Then, if the sequence $\left(x_n'\right)$ converges uniformly on $\left[t-\varepsilon,t+\varepsilon\right]$
(question: can this condition actually be proved?),
then the sequence $\left(x_n\right)$ converges uniformly to a function $x$ on $\left[t-\varepsilon,t+\varepsilon\right]$,
which is the unique solution to Equation [@eq:eq-ode].

## Proof

The proof is easy. Note from Equation [@eq:eq-xn-1] that

$$x_{n+1}'\!\left(t\right)=f\!\left(x_n\!\left(t\right),t\right).$$

Then, take the limit $n\to\infty$. By the uniform convergence, we recovers Equation [@eq:eq-ode].

## An example

Suppose $f\!\left(x,t\right):=x$ and $t_0:=0$, then

$$x_n\!\left(t\right)=C\sum_{j=0}^{n-1}\frac{t^j}{j!}.$$

This is because

$$\int_0^tx_n\!\left(s\right)\,\mathrm ds+C=C\sum_{j=0}^{n-1}\frac{t^{j+1}}{j!\left(j+1\right)}+C=x_{n+1}\!\left(t\right).$$

By taking the limit $n\to\infty$, we get $x\!\left(t\right)=C\mathrm e^t$,
which means that the unique solution to $x'\!\left(t\right)=x\!\left(t\right)$
with initial condition $x\!\left(0\right)=C$ is $x\!\left(t\right)=C\mathrm e^t$,
expectedly.

## Approximation

This method is good because integration is sometimes much easier than solving ODE.
We can use integration to get functions that are close to the exact solution.
A natural question to ask is how close $x_n$ is to the exact solution $x$.

If Equation [@eq:eq-ode] is defined on $\mathbb R^n$ (where we may define differences and infinitesimals),
it is clear that $x_n-x$ is an infinitesimal of higher order than $\left(t-t_0\right)^n$.
