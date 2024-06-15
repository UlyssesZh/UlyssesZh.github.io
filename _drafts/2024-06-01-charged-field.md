---
title: Charged fields
date: 2024-02-21 02:26:45 -0800
categories:
- physics
tags:
- field theory (physics)
- group theory
layout: post
excerpt: 'Charged fields are fields that possess internal symmetries.
The Noether current that corresponds to this symmetry
shows the conservation of charge.'
---

## The starting confusion

When I learn quantum field theory,
I have never been confused about charged fields.
For example, a complex scalar field $\vphi$ is a charged field,
and its kinetic term in the Lagrangian is $-\partial_\mu\vphi^\dagger\,\partial^\mu\vphi$.
There does not seem to be a problem with this.
Here $\vphi^\dagger$ is just the complex conjugate.

Well, maybe I exaggerated a little about being not confused.
Actually, for a little while, I was confused about how the classical EOM of
$\mcal L_\mrm{kin}=-\partial_\mu\vphi^\dagger\,\partial^\mu\vphi$
is derived.
All the texts tell me that we need to treat $\vphi$ and $\vphi^\dagger$ as independent fields
while taking variation of the action against them to get the classical EOM.
However, they seem perfectly dependent to me.
I then quickly convinced myself that the EOM that I get
by treating $\vphi$ and $\vphi^\dagger$ as independent fields
is the same as the EOM that I get by treating them as dependent fields.
In another way, I can simply write out the real part and the imaginary part of $\vphi$
separately and take variation against them separately,
and this will also give the same EOM.
Therefore, this should just be a calculation trick that has no physical or math reason behind,
and nothing deep about that is going on.

I was comfortable with this reason until I studied the electroweak theory.
There are two vector fields $W^{+\mu}$ and $W^{-\mu}$
whose kinetic term appears as
$-2\,\partial^\mu W^{-\nu}\,\partial_{[\mu}W^+_{\nu]}$.
This should not be a problem since by definition
$W^{\pm}_\mu$ are complex conjugates of each other:

$$W^{\pm}_\mu\ceq\fr1{\sqrt2}\p{A^1_\mu\mp\i A^2_\mu},$$

where $A^{1,2}_\mu$ are gauge fields (which are not important here).
Therefore, $W^{\pm}_\mu$ should just be like every other complex fields that I have seen before.
However, one day, someone tells me that $W^+$ and $W^-$ are different particles.
I never thought like that about charged fields before!
Now that he brought that thought up, I realized that actually they do seem to be like that:
people tend to think $W^+$ and $W^-$ are different particles;
or, more commonly, $e^+$ and $e^-$ are different particles.

This immediately reminds me of how a complex field and its conjugate are treated as independent fields
when deriving the EOM.
This procedure makes perfect sense if $\vphi^\dagger$ and $\vphi$ are simply
different fields that represent different particles.

I then cannot help but wonder what will happen if I do not write the other field as $\vphi^\dagger$
but replace it with a totally irrelevant field $\psi$.
We can write the kinetic term and the mass term as this:

$$\mcal L_\mrm{free}=-\partial_\mu\psi\,\partial^\mu\vphi-m^2\psi\vphi.$$

The Euler--Lagrange equation simply reads $\p{\partial^2+m^2}\vphi=0$
and $\p{\partial^2+m^2}\psi=0$, which looks fine
because they are just the expected Klein--Gordon equations.
The theory has a symmetry

$$\vphi\mapsto\e^{-\i\alp}\vphi,\quad\psi\mapsto\e^{\i\alp}\psi,$$

which means that there is a global $\U1$ symmetry
with Noether current $j^\mu=\i\vphi\,\partial^\mu\psi-\i\psi\,\partial^\mu\vphi$.
