---
title: Constant roundtrip average speed of light
date: 2026-11-11 18:53:42 -0800
categories:
  - physics
tags:
  - special relativity
  - differential geometry
layout: post
excerpt: >
  One may be worried that the assumption of constant speed of light is in principle not verifiable from experiment
  because we can only measure the roundtrip average speed of light but not the single-trip speed of light.
  It turns out to be fine because we can always redefine the time coordinates to make the speed of light constant
  if the roundtrip average speed of light does not depend on the path.
---

## Introduction

Technically, an observer can only measure time using his own proper time by bringing a clock with him and read it out.
This is beacuse without a proper synchronization scheme,
there is no definition of simultaneity for clocks placed at different places.
Let us say there is some arbitrary synchronziation scheme that the observer uses to define the time coordinate
in the whole spacetime, denoted as $t$, so that each spacetime location is $\p{t,x}$,
where the space coordinate $x$ lives on a (static) connected Riemannian manifold $M$ (so the spacetime is $\bR\times M$).
Denote $x=o$ to be a fixed point on $M$ where the observer stays,
and $t$ gives the proper time for the observer on the worldline $t\mapsto\p{t,o}$.
In principle, a function $\tau:\bR\times M\to\bR$ such that $\fc\tau{t,o}=t$
and that $\p{t,x}\mapsto\p{\fc\tau{t,x},x}$ is bijective defines a gauge to
produce a different time coordinate which is just as good as $\p{t,x}\mapsto t$.
The speed of light is then gauge-dependent, so the naive interpretation of constant speed of light fails.

However, there is still something physically meaningful to measure: the average speed of light
along a closed path on $M$ starting and ending at $o$.
Because the time coordinate of the event $\p{t,o}$ must be $t$ (physically the proper time of the observer)
in any gauge, if the emission and the reception of a light signal are both at $o$,
then their time difference is gauge independent, so the average speed of this light signal can be physically measured.
The natural question to ask is then whether a gauge where the speed of light is constant everywhere
always exists as long as the roundtrip average speed of light is always constant.

[Minguzzi and Macdonald (2003)](https://philarchive.org/rec/MINUOL) addressed the same problem in a less general way.

## Gauge transformation

As we stated before, a gauge transformation is given by a function $\tau:\bR\times M\to\bR$ such that
$\fc\tau{t,o}=t$ and that $\p{t,x}\mapsto\p{\fc\tau{t,x},x}$ is bijective.
Equivalently, $\fc\tau{\cdot,x}$ is bijective for any $x\in M$ and is specially the identity function for $x=o$.
Abusing the notation, denote $\fc t{\cdot,x}$ as the inverse function of $\fc\tau{\cdot,x}$.
Then we say $t:\bR\times M\to\bR$ gives the inverse gauge transformation of $\tau:\bR\times M\to\bR$.

Now let us find the gauge transformation for the speed of light.
Let us assume that the speed of light depends only on properties local to each point on the trajectory
along which the light travels:
the spacetime coordinates and the tangent direction of the trajectory at that point.
In other words, the inverse speed of light $\fc{c^{-1}}{t,x,u}\in\bR$
is a function of time $t\in\bR$, spatial location $x\in M$,
and direction $u\in\mrm{UT}_xM$ (the unit sphere of $\mrm T_xM$; I will denote the unit tangent bundle of $M$ as $\mrm{UT}M$).

It is easy to write down the differential equation governing the propagation of light on a given trajectory.
From now on, when I say a curve or path on $M$, I mean a length-parametrized piecewise differentiable curve on $M$.
Let $\gma$ be a curve on $M$.
Denote $\fc{\gma'}s$ to be the tangent vector at parameter value $s$, which is a unit vector in $\mrm T_{\fc\gma s}M$.
Then, the worldline of the light travelling along $\gma$ parametrized by $s$ is $s\mapsto\p{\fc ts,\fc\gma s}$,
where $t$ satisfies the differential equation
$$\fc{t'}s=\fc{c^{-1}}{\fc ts,\fc\gma s,\fc{\gma'}s}.$$ {#eq:ode}
From Equation [@eq:ode] and the chain rule, one can easily derive the gauge transformation of the inverse speed of light.
For a different time coordiante $\fc\tau{t,x}$ that is differentiable,
the new inverse speed of light $\fc{\tilde c^{-1}}{\tau,x,u}$ relates to $\fc{c^{-1}}{t,x,u}$ by
$$\fc{\tilde c^{-1}}{\fc\tau{t,x},x,u}=\fc{c^{-1}}{t,x,u}\fc{\partial_t\tau}{t,x}+u\fc{\nabla_x\tau}{t,x}.$$

<details><summary>Derivation</summary>

Along the worldline, we have
$$\fr{\d t}{\d s}=\fc{c^{-1}}{t,x,u},\quad\fr{\d x}{\d s}=u.$$
In transformed coordinates $\p{\tau,x}$, Equation [@eq:ode] reads
$$\fc{\tilde c^{-1}}{\tau,x,u}=\fr{\d\tau}{\d s}
=\fr{\d t}{\d s}\,\fc{\partial_t\tau}{t,x}+\fr{\d x}{\d s}\,\fc{\nabla_x\tau}{t,x}.$$
This recovers the desired equation for $\tilde c^{-1}$.
Because $\gma$ is arbitrary, it is true in general.

</details>

If the inverse gauge transformation $\fc t{\tau,x}$ is differentiable, we can also invert this relation:
$$\fc{c^{-1}}{\fc t{\tau,x},x,u}=\fc{\tilde c^{-1}}{\tau,x,u}\fc{\partial_\tau t}{\tau,x}+u\fc{\nabla_xt}{\tau,x}.$$
By this equation, if a gauge transformation makes the new speed of light be constant $1$, then its inverse gauge transformation satisfies
$$\fc{c^{-1}}{\fc t{\tau,x},x,u}=\fc{\partial_\tau t}{\tau,x}+u\fc{\nabla_xt}{\tau,x}.$$ {#eq:inverse-constant}
As we will see, the inverse form is more useful because we will encounter a gauge transformation
that is not differentiable in general but has differentiable inverse.

## Main claim

I will now prove the following claim.
There exists a gauge transformation $\fc\tau{t,x}$ such that its inverse $\fc t{\tau,x}$ is differentiable
and satisfies Equation [@eq:inverse-constant], given the following conditions:

- $\fc{c^{-1}}{t,x,u}$ is continuous.
- Unique propogation:
  The solution to Equation [@eq:ode] uniquely exists for any length-parametrized piecewise differentiable curve $\gma$
  and any initial condition of the form $\fc t{s_0}=t_0$.
- Constant roundtrip average speed:
  For any length-parametrized piecewise differentiable curve $\gma$ such that $\fc\gma0=\fc\gma l=o$,
  any solution to Equation [@eq:ode] satisfies $\fc tl-\fc t0=l$.

The new time coordinate $\fc\tau{t,x}$ is defined as follows.
For any $x\in M$, pick any length-parametrized curve $\gma$ such that $\fc\gma0=o$ and $\fc\gma l=x$.
For any $t\in\bR$, let $t^*$ be the solution to Equation [@eq:ode] for $\gma$ with the initial condition $\fc{t^*}l=t$.
Then, define $\fc\tau{t,x}\ceq\fc{t^*}0+l$.
I will now show the following claims:

- $\tau$ is well defined: $\fc\tau{t,x}$ does not depend on the choice of $\gma$.
- $\fc\tau{\cdot,x}$ is continuous and bijective (so the inverse gauge transformation exists and is continuous).
- $\fc t{\tau,x}$ is continuously differentiable and satisfies Equation [@eq:inverse-constant].

<details><summary>$\tau$ is well defined</summary>

Consider two paths $\gma_1,\gma_2$ with lengths $l_1,l_2$ arriving at the same spacetime point $\p{t,x}$
with departure times $t_1,t_2$.
Append them with the same return path $\gma'$ with length $l'$ from $\p{t,x}$ to $\p{t',o}$.
Both loops end at $t'$, so by the constant roundtrip average speed, we have
$$t'=t_1+l_1+l'=t_2+l_2+l'.$$
We then have $\fc\tau{t,x}=t_1+l_1=t_2+l_2$, so it is well-defined.

</details>

<details><summary>$\fc\tau{\cdot,x}$ is bijective</summary>

For any path $\gma$ with finite length $l$ (parameter runs over $\b{0,l}$),
denote $\fc{T_\gma}{t_0}$ to be $\fc tl$,
where $t$ is the solution to Equation [@eq:ode] with initial condition $\fc t0=t_0$.

Consider a path $\gma$ with length $l$.
Suppose that there exists $t_1<t_2$ such that $\fc{T_\gma}{t_1}\ge\fc{T_\gma}{t_2}$.
This means that there exists two solutions $t_1^*$ and $t_2^*$ to Equation [@eq:ode] for $\gma$
such that $\fc{t_1^*}0<\fc{t_2^*}0$ and $\fc{t_1^*}l\ge\fc{t_2^*}l$.
Because $t_1^*$ and $t_2^*$ must be continuous functions, there exists $s_0\in\left(0,l\right]$
such that $\fc{t_1^*}{s_0}=\fc{t_2^*}{s_0}$.
By the unique propogation, we must have $t_1^*=t_2^*$, contradicting with $\fc{t_1^*}0<\fc{t_2^*}0$.
Therefore, $T_\gma$ must be strictly monotonically increasing.

Consider a path $\gma$ with length $l$ from $o$ to $x$
and a path $\gma'$ with length $l'$ from $x$ to $o$ so that $\gma\cup\gma'$ forms a closed path.
Therefore, $\fc{T_{\gma'}}{\fc{T_\gma}t}=t+l+l'$, so $T_{\gma'}\circ T_\gma$ is a surjection onto $\bR$.
Because both $T_\gma$ and $T_{\gma'}$ are injective by monotinicity, they must both be surjective.
Therefore, they are both bijective.
Because they are monotonic, they are also continuous.

Now by definition we have $\fc\tau{t,x}\ceq\fc{T_\gma^{-1}}t+l$,
where $T_\gma^{-1}$ is the inverse function of $T_\gma$,
so $\fc\tau{\cdot,x}$ is continuous and bijective.

</details>

<details><summary>$\fc t{\tau,x}$ satisfies Equation [@eq:inverse-constant]</summary>

By construction, if light travels along a path of length $l$ from $x$ to $y$,
departing at $\fc t{\tau,x}$, then it arrives at $\fc t{\tau+l,y}$.

Let $u\in\mrm{UT}_xM$ and $\veps>0$. Define two paths $\gma_{x,u,\veps}^\pm$ as
$$\fc{\gma_{x,u,\veps}^+}s\ceq\fc{\exp_x}{su},\quad
\fc{\gma_{x,u,\veps}^-}s\ceq\fc{\exp_s}{\p{\veps-s}u},\quad
s\in\b{0,\veps}.$$
Then, for small $\veps$, by Equation [@eq:ode] and the continuity of $c^{-1}$,
the time it takes to travel along $\gma_{x,u,\veps}^\pm$
is $\veps\fc{c^{-1}}{t,x,\pm u}+\fc{\mrm o}\veps$, where $t$ is the departure time.

Denote $\gma_{x,u,\veps}$ as the concatenation $\gma_{x,u,\veps}^+\cup\gma_{x,u,\veps}^-$, having length $2\veps$.
The time it takes to travel along $\gma_{x,u,\veps}$, with departure time $\fc t{\tau,x}$, is then
$$\fc t{\tau+2\veps,x}-\fc t{\tau,x}
=\veps\p{\fc{c^{-1}}{\fc t{\tau,x},x,u}+\fc{c^{-1}}{\fc t{\tau+\veps,x},x,-u}}+\fc{\mrm o}\veps.$$
Divide both sides by $2\veps$ and take limit at $\veps\to0^+$, and we have (by the continuity of $\fc t{\cdot,x}$)
$$\partial_\tau^+\fc t{\tau,x}=\fr12\p{\fc{c^{-1}}{\fc t{\tau,x},x,u}+\fc{c^{-1}}{\fc t{\tau,x},x,-u}}.$$
Similarly, by considering the time it takes to travel along $\gma_{\fc{\exp_x}{-\veps u},u,\veps}$
(where $u$ is understood as the parallel transport of $u$ from $x$ to $\fc{\exp_x}{-\veps u}$ along $\gma_{x,-u,\veps}^+$),
we get the same expression for the left derivative.
Therefore,
$$\partial_\tau\fc t{\tau,x}=\fr12\p{\fc{c^{-1}}{\fc t{\tau,x},x,u}+\fc{c^{-1}}{\fc t{\tau,x},x,-u}}.$$ {#eq:partial-tau}
It is continuous.

Consider the time it takes to travel along $\gma_{x,u,\veps}^+$ to get
$$\fc t{\tau+\veps,\fc{\exp_x}{\veps u}}-\fc t{\tau,x}=\veps\fc{c^{-1}}{\fc t{\tau,x},x,u}+\fc{\mrm o}\veps.$$
Using the continuity of $\partial_\tau\fc t{\tau,x}$ to get
$$\fc t{\tau+\veps,\fc{\exp_x}{\veps u}}-\fc t{\tau,\fc{\exp_x}{\veps u}}=\veps\partial_t\fc t{\tau,x}+\fc{\mrm o}\veps.$$
Subtract the two equations to get
$$\fc t{\tau,\fc{\exp_x}{\veps u}}-\fc t{\tau,x}
=\veps\p{\fc{c^{-1}}{\fc t{\tau,x},x,u}-\partial_t\fc t{\tau,x}}+\fc{\mrm o}\veps.$$
Divide by $\veps$ and take the limit $\veps\to0^+$ to get directional derivative of $\fc t{\tau,x}$ w.r.t. $x$ along $u$
to be
$$\fc{c^{-1}}{\fc t{\tau,x},x,u}-\partial_t\fc t{\tau,x}
=\fr12\p{\fc{c^{-1}}{\fc t{\tau,x},x,u}-\fc{c^{-1}}{\fc t{\tau,x},x,-u}}.$$
Applying the argument to all $u\in\mrm{UT}_xM$ to establish that the coordinate partial derivatives exist for all coordinates.
They are continuous because $c^{-1}$, $\fc t{\tau,x}$, and the metric are continuous.
We then have the existence of the covariant derivative $\nabla_x\fc t{\tau,x}$ so that the directional derivatives are
$$u\nabla_x\fc t{\tau,x}=\fr12\p{\fc{c^{-1}}{\fc t{\tau,x},x,u}-\fc{c^{-1}}{\fc t{\tau,x},x,-u}}.$$ {#eq:nabla-x}

Add together Equation [@eq:partial-tau] and [@eq:nabla-x], and we recover Equation [@eq:inverse-constant].

</details>

## Reflections

Although $\fc t{\tau,x}$ is continuously differentiable, $\fc\tau{t,x}$ is not necessarily so
because it is possible to have $\partial_\tau\fc t{\tau,x}=0$ at some points.
This suggests that the inverse gauge transformation $\p{\tau,x}\mapsto\p{t,x}$
is in fact a more natural object to work with instead of the gauge transformation $\p{t,x}\mapsto\p{\tau,x}$.
This suggests that, if we have constant roundtrip average speed of light,
then it is natural to think of the ground truth of the universe is that the speed of light is actually constant,
and an assumption of varying speed of light is an artifact of the gauge transformation $\fc t{\tau,x}$,
instead of the other way around
(that the constant speed of light is an artifact of the gauge transformation $\fc\tau{t,x}$ that we constructed for convenience).

One may notice that the definition of $\tau$ to get constant speed of light gives exactly the Einstein synchronization:
if we place an observer at $x$ in $M$ and let his clock synchronize
to the observer at $o$ using the Einstein synchronization, then the time on his clock will be $\fc\tau{t,x}$.
