---
title: The duality between two plane trajectories related by a conformal map
date: 2023-12-22 11:19:04 -0800
categories:
- physics
tags:
- complex
- classical mechanics
- canonical transformation
- kepler problem
- mathematical physics
- vector analysis
- long paper
layout: post
excerpt: 'The conformal map $\fc wz$ transforms the trajectory with energy $-B$ in potential
$\fc Uz\ceq A\v{\d w/\d z}^2$ into the trajectory with energy $-A$ in potential
$\fc Vw\ceq B\v{\d z/\d w}^2$.
I will prove this beautiful result and show some implications of it.'
---

I always feel amazed about how 2D physics can often be fascinating due to theorems in complex analysis.
This article is about one among such cases.

**Theorem.**
The conformal map $\fc wz$ transforms the trajectory with energy $-B$ in potential
$\fc Uz\ceq A\v{\d w/\d z}^2$ into the trajectory with energy $-A$ in potential
$\fc Vw\ceq B\v{\d z/\d w}^2$.

This result is pretty amazing in that it reveals a quite implicit duality between the two potentials,
and it looks very symmetric as written.

This theorem, as I know of, was first introduced in
the appendix of V. I. Arnold's book
*Huygens and Barrow, Newton and Hooke*.
Part of this article is already covered in the relevant part of the book.

## Power-law central-force potentials

Before I show the proof of it, let me first introduce it by a much more well-known example.

As we all know, Bertrand's theorem states that
the only two types of central-force potentials where all bound orbits are closed are
$U\propto r^{-1}$ (the Kepler problem) and $U\propto r^2$ (the harmonic oscillator).
How the two potentials are special among all sorts of different central-force potentials
makes people wonder if there is any connection between them.
Fortunately, there is one, and it is obvious once we notice that the
complex squaring transforms any center-at-origin ellipses into focus-at-origin ellipses.
Inspired by this, it is easy to see that trajectories in the Kepler problem can be transformed into
trajectories of harmonic oscillators under complex squaring.

You may ask, how can we notice complex squaring does the said transformation on ellipses?
The observation is noticing the simple algebra

$$\p{z+\fr1z}^2=z^2+\fr1{z^2}+2,$$

which means that the Joukowski transform $z\mapsto z+1/z$ of a unit circle
simply translates under complex squaring.
We can then try to generalize this to circles of other radii,
whose Joukowski transformations are just ellipses!
(If you remember, this is the second time Joukowski transformation appears in my blog.
The first time was [here]({% post_url 2020-06-13-joukowsky-heart %}).)

Then, are the Kepler problem and the harmonic oscillator the only two central-force potentials
whose trajectories can be transformed into each other by a complex function?
The answer is no.
In fact, for any trajectory in almost any power-law central-force potential,
we can take some power of it to get a trajectory in another power-law central-force potential.

This result can be summarized as follows.
Taking the $\p{\alp/2+1}$th power of a trajectory with energy $E$ in the potential $U=ar^\alp$
($\alp\ne-2$) gives a trajectory with energy $F$ in the potential $V=br^\beta$, where

$$\p{\alp+2}\p{\beta+2}=4,\quad b=-\fr14\p{\alp+2}^2E,\quad F=-\fr14\p{\alp+2}^2a.$$

To prove this, we just need to reparameterize the transformed trajectory in a new time coordinate $\tau$
defined as $\d\tau=\v z^\alp\,\d t$, where $z$ is the complex position of the original trajectory.
Then, by some calculation and utilizing the energy conservation,
we can show that the parameter equation in terms of the new time coordinate satisfy
the equation of motion we expect.
I will not show the details here because they would be redundant
once I prove the more general case using the same methods.

### Corollaries and applications

There is an interesting special case, which is $\alp=-2$.
There is no potential that is dual to $U\propto r^{-2}$.
Another interesting case is $\alp=-4$, which is dual to itself ($\beta=-4$).
It kind of means that the coefficient in the potential is "interchangeable" with the energy,
and the trajectories can be derived from each other by taking the complex reciprocal.

We can get some interesting results with $a=0$, which is just the case of a free particle,
whose trajectories are all straight lines.
Since in this case we necessary have $F=0$, we can say that
the zero-energy trajectory in any power-law potential is related to a straight line by a power.
From this result, we can derive some interesting corollaries.
For example, the zero-energy trajectory in the Kepler problem is a parabola (square of a straight line),
which is well-known.
The zero-energy trajectory in $U\propto-r^{-4}$ is a circle passing through the origin
(reciprocal of a straight line), which is a pretty interesting not-so-well-known result.

Another interesting result is that, the deflection angle of an incident zero-energy particle
scattered by the potential $U\propto-r^\alp$ is $\tht$ under paraxial limit, if

$$\alp=\fr{2\vphi}{\pi-\vphi},\quad\vphi=\pm\tht-2k\pi,\quad k\in\bN.$$

This result can be easily derived by using the conformal transform of the real line
(actually, a straight line that approaches the real line).
The crucial part here is that $k$ cannot take negative integers because we need $\alp>-2$.
The reason is that, when $\alp\le-2$, paraxial zero-energy particles are bound to sink into the origin,
and thus no scattering actually happens.
This small pitfall indicates that the trajectory in the dual potential is not a two-side infinite straight line,
either, in that limit, in contrast to being seemingly a free particle.

## Some straightforward proofs

Let's go back to the theorem I stated at the beginning of this article.

*Proof.*
Consider a new time coordinate $\tau$ defined as $\d\tau=\v{\d w/\d z}^2\,\d t$.
Then, the motion of $w$ satisfies

$$\begin{align*}
m\fr{\d^2w}{\d\tau^2}
&=m\fr{\d t}{\d\tau}\fr{\d}{\d t}\p{\fr{\d t}{\d\tau}\fr{\d w}{\d t}}\\
&=m\v{\fr{\d z}{\d w}}^2\fr{\d}{\d t}\p{\v{\fr{\d z}{\d w}}^2\fr{\d w}{\d z}\fr{\d z}{\d t}}\\
&=m\fr{\d z}{\d w}\p{\fr{\d z}{\d w}}^*\p{\p{\fr{\d^2z}{\d w^2}\fr{\d w}{\d z}\fr{\d z}{\d t}}^*\fr{\d z}{\d t}
+\p{\fr{\d z}{\d w}}^*\fr{\d^2 z}{\d t^2}}.
\end{align*}$$

Here we need to substitute $\d^2 z/\d t^2$ by the equation of motion for $z$.
By computing the real and imaginary parts separately,
we can derive that for any holomorphic function $f$,
the gradient of $\v f^2$ expressed as a complex number is
$\nabla\v f^2=2\p{\d f/\d z}^*f$.
Therefore, the equation of motion for $z$ is

$$m\fr{\d^2z}{\d t^2}=-2A\fr{\d w}{\d z}\p{\fr{\d^2w}{\d z^2}}^*.$$

According to [series reversion](https://mathworld.wolfram.com/SeriesReversion.html), we have
$\d^2 w/\d z^2=-\p{\d w/\d z}^3\d^2 z/\d w^2$.
Therefore, the equation of motion for $z$ can also be written as

$$m\fr{\d^2z}{\d t^2}=2A\v{\fr{\d w}{\d z}}^2\p{\fr{\d w}{\d z}}^{*2}\p{\fr{\d^2 z}{\d w^2}}^*.$$

Substitute this, and we have

$$m\fr{\d^2w}{\d\tau^2}=\fr{\d z}{\d w}\p{\fr{\d^2z}{\d w^2}}^*
\p{m\v{\fr{\d z}{\d t}}^2+2A\v{\fr{\d w}{\d z}}^2}.$$

Substitute the energy conservation of the motion of $z$:

$$\fr12m\v{\fr{\d z}{\d t}}^2+A\v{\fr{\d w}{\d z}}^2=-B,$$

and we have

$$m\fr{\d^2w}{\d\tau^2}=-2B\fr{\d z}{\d w}\p{\fr{\d^2z}{\d w^2}}^*,$$

which is the equation of motion for $w$ that we expect.

To get the energy of the motion of $w$, we calculate

$$\begin{align*}
\fr12m\v{\fr{\d w}{\d\tau}}^2+B\v{\fr{\d z}{\d w}}^2
&=\fr12m\v{\fr{\d w}{\d z}\fr{\d z}{\d t}\fr{\d t}{\d\tau}}^2+B\v{\fr{\d z}{\d w}}^2\\
&=\v{\fr{\d w}{\d z}}^2\p{-B-A\v{\fr{\d w}{\d z}}^2}\v{\fr{\d z}{\d w}}^4+B\v{\fr{\d z}{\d w}}^2\\
&=-A,
\end{align*}$$

which is the energy conservation of the motion of $w$ in the potential $V$ that we expect.
{% qed %}

Noticing that we are only interested in the trajectory,
we can just use Maupertuis' principle to get a simpler proof.

*Proof.*

$$\mcal S_0=\int\v{\d z}\sqrt{2m\p{-B-A\v{\fr{\d w}{\d z}}^2}}=\int\v{\d w}\sqrt{2m\p{-A-B\v{\fr{\d z}{\d w}}^2}}.$$

The abbreviated action is then exactly the same for the motion of $z$ and the motion of $w$.
Therefore, by Maupertuis' principle, for any physical trajectory of $z$, the trajectory of $w$ is also physical.
{% qed %}

## Details worth noting

### Invertibility of the conformal map

There are two different definitions of a conformal transformation in two dimensions.
One is that a function defined on an open subset of $\bC$ is conformal iff it is holomorphic
and its derivative is nowhere zero.
The other is that a function is conformal iff it is biholomorphic
(is bijective and has a holomorphic inverse).

You may think here I have adopted the second definition because when I say
$\fc Vw\ceq B\v{\d z/\d w}^2$, I am implicitly assuming that I can take the inverse of $\fc wz$
to get the function $\fc zw$ and then take the derivative of it.
However, if that is the case, an immediate problem is that then the duality between
the Kepler problem and the harmonic oscillator, from which I introduced the more general result in the first place,
would not be actually covered by the "more general" result.
This is because $z\mapsto z^2$ is not biholomorphic (because it is not injective).

Then, why did this never become a problem when we were studying
the duality between the Kepler problem and the harmonic oscillator?
All we have talked about is how we can derive a trajectory in the Kepler problem
by squaring the trajectory of a harmonic oscillator,
but we have not discussed about how we can reverse this process, as an essential part of the duality.
You may think the reverse of the process would be totally natural given how symmetric our theorem is
regarding the two potentials.
However, the reverse is not actually well-defined since the inverse of squaring, i.e., taking the square root,
is not a single-valued function.
Nevertheless, it is still well-defined in some sense:
starting with whichever branch we like, tracing one point on the trajectory of the Kepler problem,
and moving it along this trajectory for two cycles,
we will end up with a trajectory of the harmonic oscillator if we take the square root of the position
and ensure we always choose the branch so that the mapping is continuously done.

What about other power-law central potentials?
In those cases, we have non-closed trajectories, so we cannot just move along the trajectory for two cycles.
For example, if we take $w=z^3$, then the potential would be $U=9A\v z^4$.
For any non-closed trajectory, we can uniquely map it to a trajectory of the potential $V=B\v w^{-4/3}/9$.
However, we cannot uniquely do the reverse mapping.
There would be three different trajectories in the potential $U$ that can be mapped to the same trajectory in $V$,
and we can in turn map the trajectory in $V$ to any of the three trajectories in $U$
depending on which branch we choose.

Therefore, to generalize this for more general potentials, we can use similar arguments.
Because $z\mapsto w$ has non-zero derivative everywhere in our considered region,
it is everywhere locally invertible by the Lagrange inversion theorem.
We can then bijectively map the trajectories in the two dual potentials locally for every small (and finite)
segment and then patch them together to get the global correspondence between the two trajectories.
This mapping may not be well-defined globally, but the trajectories can still be considered dual to each other.
If the potential also becomes multi-valued due to the mapping $w\mapsto z$ being multi-valued,
then we should imagine this situation like this: at some point, the potential may be different when the particle
visit here for the second time.
This case does not happen if we only look at power-law potentials, but it does happen for more general cases.

What makes this sense of duality weaker is that one trajectory can be dual to multiple different trajectories.
A case worth noting is that sometimes one trajectory can be mapped to infinitely many different trajectories.
This happens when the trajectory runs around a logarithmic branch point.
However, we can gain the sense of duality back if we can also consider the case where $z\mapsto w$ is multi-valued.
The notion of conformal transformation is now too limited to cover this case,
a better notion is a global analytic function,
which generalizes the notion of analytic function to allow for multiple branches.

### Requirements for the potential

Not any potential can be expressed as $A\v{\d w/\d z}^2$.
How can we determine whether a potential can be expressed in this form?

**Theorem.**
A continuous potential $U$ can be expressed in the form of $A\v{\d w/\d z}^2$
(where $\fc wz$ is a conformal transformation) iff one of the following conditions is met:

- $U$ is zero everywhere, or
- $\ln\v U$ is a harmonic function on the domain of $U$.

*Proof.*
First, prove the necessity.

An obvious requirement is that the potential must be positive everywhere or negative everywhere
(or zero everywhere, but that is trivial).
The sign is determined by the sign of $A$.
Therefore, without loss of generality, we can assume $A=1$
because we can always absorb a factor of $\sqrt{\v A}$ into $w$ and adjust the overall sign of $U$ accordingly.

We can decompose $\p{\d w/\d z}^2$ in the polar form

$$\p{\d w/\d z}^2=\v{\d w/\d z}^2\e^{\i\vphi}=U\e^{\i\vphi},$$

where $\vphi$ is a real function of $z$.
Applying the Cauchy--Riemann equations to $\p{\d w/\d z}^2$ gives

$$\i\partial_x\p{\fr{\d w}{\d z}}^2=\partial_y\p{\fr{\d w}{\d z}}^2
\implies\i\p{\e^{\i\vphi}\partial_xU+\i U\e^{\i\vphi}\partial_x\vphi}
=\e^{\i\vphi}\partial_yU+\i U\e^{\i\vphi}\partial_y\vphi.$$

Equate the real and imaginary parts, and we have

$$\begin{cases}U\partial_x\vphi=-\partial_yU,\\U\partial_y\vphi=\partial_xU.\end{cases}$$

Use the symmetry of second derivatives on $\vphi$, and we have

$$\partial_x\partial_y\vphi-\partial_y\partial_x\vphi=0
\implies\partial_x\fr{\partial_xU}U+\partial_y\fr{\partial_yU}U=0.$$

In the language of vector analysis, this is just $\nabla^2\ln U=0$.

Considering the case where $U$ is negative everywhere, we have that $\ln\v U$ is a harmonic function.

Then, prove the sufficiency.

The case where $U$ is zero everywhere is trivial.
Otherwise, because $\ln\v U$ is defined everywhere on the domain of $U$, we must have $U$ is non-zero everywhere.
Because $U$ is continuous, we have $U$ is either positive everywhere or negative everywhere.

Without loss of generality, assume $U$ is positive everywhere.
Let $\vphi$ be the harmonic conjugate of $\ln U$.
Then, $\ln U+\i\vphi$ is a holomorphic function. We can then define

$$\fr{\d w}{\d z}=\sqrt U\e^{\i\vphi/2},$$

which is also a holomorphic function.
{% qed %}

From now on, we will call this requirement on $U$ as being **log-harmonic** for obvious resons.

We should notice that whether $U$ is log-harmonic does not respect
that any potential can have an additive constant and still be essentially the same potential.
An immediate example is that a function that is positive everywhere may be negative somewhere
if we add a constant to it.
We may then want to ask whether $U$ can be log-harmonic if we allow it to be added an additive constant.
It is easy to do this: we can just apply the same test to $U+C$, and see if there is some $C$ that makes it work.
To illustrate, solve the equation $\nabla^2\ln\v{U+C}=0$ for $C$,
and then see whether it is a constant over the whole complex plane.

A property of log-harmonic functions is that the product of two log-harmonic functions is also log-harmonic.

### Trajectories that run out of the domain

Trajectories often run out of the domain of the potential.
For example, in the discussions about power-law potentials before,
though not emphasized, the origin is outside the domain of the potential
because it is either a pole or a zero of $\d w/\d z$
(except the trivial case where $w$ is simply proportional to $z$).
Another example that is rather overlooked is that unbound trajectories go to infinity
while infinity is often not in the domain of the potential, either.

What need to take care of is that, when the trajectories run out of the domain,
the trajectory is cut off there, and the rest of the trajectory is never considered
(even if it may come back to the domain again later).
Take the Kepler problem ane the harmonic oscillator as an example.
If a trajectory of the harmonic oscillator passes through the origin, which is outside the domain,
the trajectory degrades from a closed ellipse to a segment.
If you take the square of a segment passing through the origin, you will get a broken line folded into itself,
which looks like a particle in the Coulomb field may sink into the origin and then goes back
along the exact path it came along.
This would confusing if it were physical.

## Arbitrariness in the construction of the conformal map

The construction of $z\mapsto w$ is not unique for a given $U$.

### Rotation and translation

First, we can observe that the substitution $w\to w'\ceq w\e^{\i\tht}+w_0$ does not change $\v{\d w/\d z}$
(nor thus $U$).
The real number $\tht$ is a function of $z$ in principle, but if we want $w$ to be holomorphic on a connected region,
then $\tht$ must be a constant (except the trivial case where $w=0$).

The dual trajectory does change, though, but the dual potential $V$ is also changed, too.
Because $\v{\d z/\d w'}=\v{\d z/\d w}$, we have

$$\fc{V'}{w'}=\fc Vw=\fc V{\p{w'-w_0}\e^{-\i\tht}}.$$

Therefore, the dual trajectory and the dual potential are also rotated and translated by the same amount.

### Scaling

Before introducing scaling, I need to add some words about the unit systems.
In the above discussions, I have never mentioned what units or dimensions do $z,w,A,B$ have.
The natural way of thinking is to let $z,w$ have the dimension of length
and let $A,B$ have the dimension of energy.
However, this is not the only way of thinking.
We will later see that the $z$-space and the $w$-space can have totally different dimensions.

The dimensions or units of variables in a physical formula can be totally different from
what they were originally intended to be.
For example, when a particle is rotating, its motion needs to satisfy $\dot{\mbf r}=\bs\omg\times\mbf r$,
where $\bs\omg$ is the angular velocity.
However, although $\mbf r$ has the dimension of length when it is first introduced,
this formula is satisfied by any rotating vectors.
A typical example is that the angular momentum changes according to this formula
when a rigid body is doing precession.
For another example, in classical mechanics and general relativity, the coordinates
used to describe the motion of a particle are often not in the dimension of length,
but have all sorts of dimensions.
For another example that is less well-known, just because the
[Berry connection](https://en.wikipedia.org/wiki/Berry_connection_and_curvature) has the same
gauge transformation as the electromagnetic potential,
a bunch of formulas that are useful in electromagnetic theory can be applied to the Berry connection
to define all sorts of interesting quantities with rich physical implications.
The units of Berry connection are, however, very unimportant because they are literally arbitrary.

Therefore, what does a unit system actually bring us in a physical theory?
The only thing it brings us is the ability to conveniently see in what aspects our theories are invariant
under the scaling of some quantities.
For example, in classical mechanics, we can scale the mass and the potential of any system with the same factor,
and then the system will still behave the same in terms of the time-dependent length-based motion.
This is because the part of the dimension of energy that is independent of length and time
is to the first power of the dimension of mass.
For similar reasons, we can derive another two scaling invariances,
one about length-scaling and the other about time-scaling.
In quantum mechanics, we suffer one less such scaling invariances because of the existence of $\hbar$;
in special relativity, we suffer one less such scaling invariances because of the existence of $c$;
and in general relativity, we suffer two less such scaling invariances because of the existence of $G$ and $c$.
This is the incentive of introducing natural units in physics: they give us a more clear image
of how our theory can be scaled leaving the physics invariant.

As for dimensional analysis, the essence of it is to find the required form of theory
so that it satisfies some sort of scaling invariance.
For example, we can use dimensional analysis to derive that the frequency of a harmonic oscillator
is proportional to the square root of the ratio of the stiffness to the mass.
We know this must be correct because this is the only theory that is consistent with the three scaling invariances
that must be satisfied by any theories under the framework of classical mechanics.

Now, consider the scaling in $w$, i.e., $w\to w'\ceq w/C$ for some non-zero real number $C$.
The potential $U$ can be kept invariant by scaling $A\to A'\ceq C^2A$.
However, we cannot change $B$ if we want to leave the trajectory of $z$ unchanged
because it is determined by the energy of the trajectory of $z$.
Therefore, the dual potential $V$ would be scaled to

$$\fc{V'}{w'}=C^2\fc Vw=C^2\fc V{Cw'}.$$

This means that physics is unchanged if length is scaled by $C$ and energy and potential are both scaled by $C^2$.
This corresponds to one of the three scaling invariances in classical mechanics that we talked about before.

What is interesting here is that the length-scaling in the $w$-space is done independently of that in the $z$-space.
This means that the length dimension in the two systems are independent of each other,
so the two systems can have totally different unit systems.

## Canonical transformation of time

The transformation from $z$ to $w$ seems like a coordinate transformation,
which is covered by canonical transformations.
However, here we have an additional requirement about the form of the Hamiltonian:

$$H=\fr{p_z^2}{2m}+\fc Uz,\quad K=\fr{p_w^2}{2m}+\fc Vw,$$

where $K$ is the transformed Hamiltonian (or called the Kamiltonian in the jargon of canonical transformations).
This is not generally true because the transformation in the generalized momentum
is restrictively determined when the transformation in the generalized coordinate is already given.
From the proof of the original theorem, we can see that a transformation in time is a must,
which is given by $\d\tau=\v{\d w/\d z}^2\,\d t$.

The problem is that the canonical transformations covered in most textbooks
usually do not allow for a transformation in time, but only for a transformation in the canonical variables.
Therefore, I need to first address the problem of integrating the transformation of time
into the theory of canonical transformations.
I will not do this for the most general case,
but only for the case general enough for the purpose of explaining the case interesting this article.

### Change in the time variable in the stationary-action principle

Before diving into the general canonical transformation,
let's first consider the case where the transformation is only in the time variable.

Consider a system with the Lagrangian $\fc L{q,\dot q}$ (not explicitly dependent on time).
Then, the action can be expressed as

$$S=\int_{t_1}^{t_2}\fc L{q,\dot q}\d t.$$

The same integral can be expressed in terms of a new time variable $\tau$ as

$$S=\int_{\tau_1}^{\tau_2}\fc L{q,\mathring q\dot\tau}\fr{\d\tau}{\dot\tau},$$

where $\mathring q\ceq\d q/\d\tau$ is the generalized velocity in the new time variable.
The transformed Lagrangian, or what I want to call the **Magrangian**[^magrangian], is then

[^magrangian]: For unknown reasons, the transformed Hamiltonian is called the Kamiltonian
just because we often use the symbol $K$ to represent it.
However, there is not a similar convention for the transformed Lagrangian,
so I would like to use the letter $M$ and call it the Magrangian.
The surname "Lagrange" is originated from the French phrase *la grange* (meaning "the barn"),
and correspondingly "Magrange" may refer to the French phrase *ma grange* (meaning "my barn").
This pun then can make "Magrangian" kind of mean "my Lagrangian".

$$\fc M{q,\mathring q}\ceq\fc L{q,\mathring q\dot\tau}\fr1{\dot\tau}.$$ {#eq:magrangian}

For the case that we are concerning, $\dot\tau$ is a positive real function of $q$
but does not (explicitly) depend on $t$.
The limits $\tau_1,\tau_2$ satisfy the condition

$$\tau_2-\tau_1=\int_{t_1}^{t_2}\fc{\dot\tau}q\,\d t.$$

This relation is crucial.
When finding the variation $\dlt S$, we are fixing $t_1,t_2$.
However, we cannot fix both $\tau_1,\tau_2$ because their difference is dependent on the path $\fc qt$.
What we can do is to fix $\tau_1$ and to let $\tau_2$ have a variation given by

$$\dlt\tau_2=\int_{t_1}^{t_2}\fc{\dot\tau'}q\dlt q\,\d t
=\int_{\tau_1}^{\tau_2}\fr{\fc{\dot\tau'}q}{\fc{\dot\tau}q}\dlt q\,\d\tau,$$

where $\dot\tau'$ is the derivative (or gradient, in higher dimensions) of $\dot\tau$ as a function of $q$.
As can be seen, only if $\dot\tau$ is a constant (i.e., $\tau$ is simply an affine transform of $t$)
does $\dlt\tau_2$ vanish for any $\dlt q$.

Using the well-known variation of the action when there is variation in the time coordinate, we have

$$\dlt S=\int_{\tau_1}^{\tau_2}
\p{\fr{\partial M}{\partial q}-\fr{\d}{\d\tau}\fr{\partial M}{\partial\mathring q}}\dlt q\,\d t
-\fc{K}{\fc q{\tau_2},\fc{\mathring q}{\tau_2}}\dlt\tau_2,$$

where

$$\fc K{q,\mathring q}\ceq\mathring q\fr{\partial M}{\partial\mathring q}-M$$

is the energy (or the Kamiltonian, but as a function of generalized coordinates and velocities) of the system.

<details>
<summary>A quick check of this variation</summary>

Because $\fc q{\tau_2}$ is fixed, we have

$$\fc q{\tau_2}=\fc q{\tau_2+\dlt\tau_2}+\fc{\dlt q}{\tau_2+\dlt\tau_2}
=\fc q{\tau_2}+\fc{\mathring q}{\tau_2}\dlt\tau_2+\fc{\dlt q}{\tau_2}
\implies\fc{\dlt q}{\tau_2}=-\fc{\mathring q}{\tau_2}\dlt\tau_2.$$

Now, calculate the variation of the action:

$$\dlt S=\int_{\tau_1}^{\tau_2}
\p{\fr{\partial M}{\partial q}\dlt q+\fr{\partial M}{\partial\mathring q}\dlt\mathring q}\d\tau
+\fc M{\fc q{\tau_2},\fc{\mathring q}{\tau_2}}\dlt\tau_2.$$

Recall the derivation of the Euler--Lagrange equation.
For the second term in the integrand, we can integrate by parts to get

$$\int_{\tau_1}^{\tau_2}\fr{\partial M}{\partial\mathring q}\dlt\mathring q\,\d\tau
=\abar{\fr{\partial M}{\partial\mathring q}\dlt q}{\tau_1}^{\tau_2}
-\int_{\tau_1}^{\tau_2}\fr{\d}{\d\tau}\fr{\partial M}{\partial\mathring q}\dlt q\,\d\tau
=\abar{-\fr{\partial M}{\partial\mathring q}\mathring q}{\tau_2}\dlt\tau_2
-\int_{\tau_1}^{\tau_2}\fr{\d}{\d\tau}\fr{\partial M}{\partial\mathring q}\dlt q\,\d\tau.$$

Substitute this back into the expression for $\dlt S$, and we have the desired result.

</details>

If we let the first term in $\dlt S$ vanish, we would get the well-known Euler--Lagrange equation:

$$\fr{\partial M}{\partial q}-\fr{\d}{\d\tau}\fr{\partial M}{\partial\mathring q}=0.$$ {#eq:transformed-EL}

However, that term is not zero because there is another term in $\dlt S$.
If we want the Euler--Lagrange equation to be satisfied, we need the second term to be zero.
This means that either $K$ is zero or $\dlt\tau_2$ is zero.
The latter case will lead us to the trivial case because we have just derived that
$\dlt\tau_2$ is zero only if $\dot\tau$ is a constant.
The former case can be satisfied, however.
If the Euler--Lagrange equation is satisfied,
then $K$ is a conserved quantity due to the symmetry of $M$ in $\tau$-translation.
Then, if $K$ happens to be zero at some point, it will be zero over the whole motion,
and the stationary-action principle will be satisfied by the motion between any two points.

We can explicitly show that Equation [@eq:transformed-EL] can be derived
from the original Euler--Lagrange equation under the zero-energy condition.

*Proof.*
We need to first derive the condition of zero energy in the old time variable.
Take derivatives of Equation [@eq:magrangian] with respect to $\mathring q$, and we have

$$\fr{\partial M}{\partial\mathring q}=\fr{\partial L}{\partial\dot q}\dot\tau\fr1{\dot\tau}
=\fr{\partial L}{\partial\dot q}.$$

Therefore, the Kamiltonian is

$$K=\fr{\partial M}{\partial\mathring q}\mathring q-M=\fr{\partial L}{\partial\dot q}\fr{\dot q}{\dot\tau}-\fr L{\dot\tau}
=\fr H{\dot\tau},$$ {#eq:K-H}

where $H\ceq\dot q\partial L/\partial\dot q-L$ is the original Hamiltonian.
This relation means that the condition $K=0$ is equivalent to the condition $H=0$.

Then, use Equation [@eq:magrangian] to explicitly calculate the lhs of Equation [@eq:transformed-EL]:

$$\begin{align*}
\fr{\partial M}{\partial q}-\fr{\d}{\d\tau}\fr{\partial M}{\partial\mathring q}
&=\p{\fr{\partial L}{\partial q}+\fr{\partial L}{\partial\dot q}\mathring q\fc{\dot\tau'}q}\fr1{\fc{\dot\tau}q}
-L\fr{\fc{\dot\tau'}q}{\fc{\dot\tau}q^2}-\fr1{\fc{\dot\tau}q}\fr{\d}{\d t}\fr{\partial L}{\partial\dot q}\\
&=\p{\fr{\partial L}{\partial q}-\fr{\d}{\d t}\fr{\partial L}{\partial\dot q}}\fr1{\fc{\dot\tau}q}
+\p{\fr{\partial L}{\partial\dot q}\dot q-L}\fr{\fc{\dot\tau'}q}{\fc{\dot\tau}q^2}\\
&=0.
\end{align*}$$
{% qed last %}

### Specifying $\tau$ vs. specifying $\dot\tau$

We will see that specifying $\dot\tau$, which is what we have done in the above discussion,
is pretty different from specifying $\tau$.
The latter is much simpler, but the former is the one that is used for the conformal duality between potentials.
Although I do not have to discuss what the transformation should look like when we specify $\tau$
instead of $\dot\tau$, I will still do this because I need to point it out that
it is quite different from the case we have discussed.

Recall that the canonical transformation is just a transformation of coordinates in the phase space
that preserves the canonical one-form up to a total differential.
Adding the idea of time transformation into this has a difficulty that time is not a coordinate in the phase space.
Including the time coordinate, the actual one-form that needs to be preserved is

$$\d S=p\,\d q-H\,\d t,$$

which is exactly the total differential of the action.
Therefore, we have

$$p\,\d q-H\,\d t=P\,\d Q-K\,\d\tau+\d G,$$ {#eq:preserved-form}

where $P,Q$ are the new canonical variables, $K$ is the transformed Hamiltonian,
and $G$ is called the generating function of the canonical transformation.
Assume $\tau$ and $G$ are both functions of $q,Q,t$. Then, we have

$$p\,\d q-H\,\d t=P\,\d Q
-K\p{\fr{\partial\tau}{\partial q}\,\d q+\fr{\partial\tau}{\partial Q}\,\d Q+\fr{\partial\tau}{\partial t}\,\d t}
+\fr{\partial G}{\partial q}\,\d q+\fr{\partial G}{\partial Q}\,\d Q+\fr{\partial G}{\partial t}\,\d t.$$

Compare the coefficients of $\d q,\d Q,\d t$ on both sides, and we have

$$p+K\fr{\partial\tau}{\partial q}-\fr{\partial G}{\partial q}=0,\quad
P-K\fr{\partial\tau}{\partial Q}+\fr{\partial G}{\partial Q}=0,\quad
H-K\fr{\partial\tau}{\partial t}+\fr{\partial G}{\partial t}=0.$$ {#eq:canonical-tau}

These equations determines $Q,P,K$.
They will satisfy Hamilton's equation:

$$\fr{\d Q}{\d\tau}=\fr{\partial K}{\partial P},\quad
\fr{\d P}{\d\tau}=-\fr{\partial K}{\partial Q}.$$

<details>
<summary>An example</summary>

Consider the Hamiltonian $H=p+q$. The motion is

$$q=q_0+t,\quad p=p_0-t.$$

Consider the new time variable $\tau=t/q$ and the generating function $G=Qq$.
With Equation [@eq:canonical-tau] and the expression for $H$ and $\tau$, we have a set of five equations:

$$\begin{dcases}
p-K\fr1{q^2}t-Q=0,\\
P+q=0,\\
H-K\fr1q=0,\\
\tau=\fr tq,\\
H=p+q
\end{dcases}\implies\begin{dcases}
q=-P,\\
p=\fr{Q-P\tau}{1-\tau},\\
K=\fr{\p{P-Q}P}{1-\tau},\\
t=-P\tau,\\
H=\fr{Q-P}{1-\tau}.
\end{dcases}$$

With the expression for the Kamiltonian $K$, we get the motion of $Q,P$:

$$Q=\fr{\p{2-\tau}\tau}{1-\tau}P_0+\p{1-\tau}Q_0,\quad P=\fr{P_0}{1-\tau}.$$

This is consistent with the motion of $q,p$ as can be verified with calculation.

</details>

It seems that specifying $\tau$ is much easier than specifying $\dot\tau$.
We can easily discuss the most general case and perfectly recover the equation of motion
without having to impose a bizarre condition like the zero energy.
This is because specifying $\dot\tau$ is, in some sense, more general than specifying $\tau$:
we can always find the total derivative of $\tau$ for any form of it,
but we cannot always find $\tau$ given the form of $\dot\tau$ because of limitations on the integrability.

### The conformal transformation as a canonical transformation

Now, we can discuss the conformal transformation as a canonical transformation.
The procedure is pretty analogous to that in the previous section,
but this time the conclusion would only be valid under the zero-energy condition.

Denote the real and imaginary parts of $z$ as $x,y$, and the real and imaginary parts of $w$ as $X,Y$.
The Cauchy--Riemann equations give

$$u\ceq\fr{\partial X}{\partial x}=\fr{\partial Y}{\partial y},\quad
v\ceq\fr{\partial X}{\partial y}=-\fr{\partial Y}{\partial x}.$$

Here $u,v$ are two real functions defined for convenience.
They can either be functions of $x,y$ or functions of $X,Y$, depending on which are more convenient.
With $u,v$, we have

$$\d X=u\,\d x+v\,\d y,\quad\d Y=-v\,\d x+u\,\d y,$$

The time transformation is given by

$$\dot\tau=\v{\fr{\d w}{\d z}}^2=u^2+v^2.$$

The original Hamiltonian is

$$H=\fr{p_x^2+p_y^2}{2m}+A\p{u^2+v^2}+B$$

(the last term is added because we want it to be zero during the motion).
Substitute these into Equation [@eq:preserved-form], and we have ($\d G=0$)

$$\begin{align*}
&p_x\,\d x+p_y\,\d y-\p{\fr{p_x^2+p_y^2}{2m}+A\p{u^2+v^2}+B}\d t\\
={}&P_X\p{u\,\d x+v\,\d y}+P_Y\p{-v\,\d x+u\,\d y}-K\p{u^2+v^2}\d t.
\end{align*}$$

Then, after some calculations, we have perfectly the expected result

$$p_x=uP_X-vP_Y,\quad p_y=vP_X+uP_Y,\quad
K=\fr{P_X^2+P_Y^2}{2m}+\fr{B}{u^2+v^2}+A.$$

The condition $K=0$ specifies the energy of the dual trajectory.
