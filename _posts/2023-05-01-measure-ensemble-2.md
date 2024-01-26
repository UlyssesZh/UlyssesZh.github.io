---
title: 'A measure-theoretic formulation of statistical ensembles (part 2)'
date: 2023-05-01 16:26:42 -0700
categories:
- physics
tags:
- mathematical physics
- statistical mechanics
- functional analysis
- measure theory
- probability
- long paper
layout: post
excerpt: 'For sake of rigor and generalizability,
I feel it necessary to try to have a mathematical formulation for statistical ensembles.
I chose measure spaces as the underlying mathematical structure of thermal systems
and tried to justify the method of statistical ensembles by deducing them from some axioms.'
---

*This article follows [part 1]({% post_url 2023-03-30-measure-ensemble %}).*

---

## Introduction

In part 2, I will focus on non-thermal ensembles.

Before I proceed, I need to clarify that
almost all ensembles that we actually use in physics are thermal ensembles,
including the microcanonical ensemble, the canonical ensemble, and the grand canonical ensemble
(the microcanonical ensemble can be considered as a special case of thermal ensemble
where $\vec W^\parallel$ is the trivial).

The theory of thermal ensembles is built by
letting the system in question be in thermal contact with a bath.
Similarly, if we let the system in question be in non-thermal contact with a bath,
we can get the theory of non-thermal ensembles.
An example of non-thermal ensembles that is actually used in physics is
the isoenthalpic--isobaric ensemble,
where we let the system in question be in non-thermal contact with a pressure bath.

However, we will see that it is harder to measure-theoretically
develop the theory of non-thermal ensembles
if we continue to use the same method as in the theory of thermal ensembles.

## Introducing non-thermal contact with an example

A **thermal contact** is a contact between thermal system that conducts heat
(while exchanging some extensive quantities).
A **non-thermal contact** is a contact between thermal system that does not conduct heat
(while exchanging some extensive quantities).
For reversible processes, thermodynamically and mathematically,
heat is equivalent to a form of work,
where the entropy is the displacement and where the temperature is the force.
However, this is not true for non-reversible processes because of the Clausius theorem.
This should have something to do with the fact that
entropy is different from other extensive quantities (as is illustracted in
[part 1]({% post_url 2023-03-30-measure-ensemble %}#extensive-quantities-and-macrostates)).

First, I may introduce how we may cope with the reversible processes
of two subsystems in non-thermal contact in thermodynamics.
As an example, consider a tank of monatomic ideal gas separated into two parts
by a thermally non-conductive, massless, incompressible plate in the middle that can move.
The two parts can then adiabatically exchange
energy ($U$) and volume ($V$) but not number of particles ($N$).
For one of the parts, we have

$$0=\delta Q=\mathrm dU+p\,\mathrm dV=\mathrm dU+\frac{2U}{3V}\,\mathrm dV,$$

which is good and easy to deal with
because it is simply a differential 1-form.

However, this convenience is not possible for non-reversible processes
because then we do not have the simple relation $p=2U/3V$.
Actually, the pressure is only well-defined for equilibrium states,
and it is impossible to define a pressure that makes sense during the whole non-reversible process,
which involves non-equilibrium states.
Therefore, although it seems that the "thermally non-conductive" condition
imposes a stronger restriction on what states can the composite system reach without external sources,
it actually does not
because the energy exchanged by the subsystems when they exchange volume is actually arbitrary
(as long as it does not violate the second law of thermodynamics) if the process is not reversible.

The possible states of the non-thermally composite system then cannot be simply described by
a vector subspace of $W^{(1)}\times W^{(2)}$.
If we try to use the same approach as constructing the thermally composite system
to construct the non-thermally composite system, the attempt will fail.

---

Continuing with our example of a tank of gas.
Although the pressure is not determined in the non-reversible process,
there is one thing that is certain: the pressure on the plate by the gas on one side
is equal to the pressure on the plate by the gas on the other side.
This is because the plate must be massless
(otherwise its kinetic energy would be an external source of energy;
also, remember that it is incompressible: this means that it cannot be an external source of volume).
Therefore, the relation between the volume exchanged and the energy exchanged is determined
as long as at least one side of the plate is undergoing a reversible process
because then the reversible side has determined pressure,
which determines the pressure of the other side.

This is the key idea of formulating the non-thermal ensembles
without formulating the non-thermally composite system.
In a thermal or non-thermal ensemble, the composite system consists of two subsystems,
one of which is the system in question, and the other is the bath which we are in control of.
We can let the bath have zero relaxation time (the time for it to reach thermal equilibrium)
so that any process of it is reversible.
Then, the pressure (or generally, any other intensive quantities that we are in control of
times the temperature) is determined (and actually constant),
and we can express the non-conductivity restriction as

$$\mathrm dU+p\,\mathrm dV=0,$$

where $p$ is the pressure, which is a constant.
This is a homogeneous linear equation on $\vec W^{\parallel(1)}$
(whose vectors are denoted as $(\mathrm dU,\mathrm dV)$ in our case)
which defines a vector subspace of $\vec W^{\parallel(1)}$, which we call $\vec W^{\parallel\parallel(1)}$.
The dimension of $\vec W^{\parallel\parallel(1)}$ is that of $\vec W^{\parallel(1)}$ minus one.
The physical meaning of $\vec W^{\parallel\parallel(1)}$ in this example
is the hyperplane of fixed enthalpy.

Note that our bath actually has the fixed intensive quantities
$i=\left(1/T,p/T\right)\in\vec W^{\parallel(1)\prime}$,
we can rewrite the above equation as

$$\vec W^{\parallel\parallel(1)}
=\left\{s_1\in\vec W^{\parallel(1)}\,\middle|\,i\!\left(s_1\right)=0\right\}.$$ {#eq:eq-W-star-parallel}

Wait! What does $T$ do here? It is supposed to mean the temperature of the bath,
but the temperature of the bath is irrelevant since the contact is non-thermal.
Actually, it is.
The temperature of the bath serves as an overall constant factor of $i$,
which does not affect $\vec W^{\parallel\parallel(1)}$ as long as it is not zero or infinite.
So far, this means that the temperature of the bath is not necessarily fixed,
so the actual number of fixed intensive quantities is
the dimension of $\vec W^{\parallel(1)\prime}$ minus one,
which is the same as the dimension of $\vec W^{\parallel\parallel(1)}$.
Later we will see that anything that is relevant to the temperature of the bath will finally be irrelevant
to our problem.
This seems magical, but you will see the sense in that after
we introduce another way of developing the non-thermal ensembles
(that do not involve baths and non-thermal contact) later.

---

We can define a complement of $\vec W^{\parallel\parallel(1)}$ in $\vec W^{\parallel(1)}$ as
$\vec W^{\parallel\perp(1)}$.
Then, we have $\vec W^{\parallel(1)}=\vec W^{\parallel\parallel(1)}+\vec W^{\parallel\perp(1)}$.
The space $\vec W^{\parallel\perp(1)}$ is a one-dimensional vector space.

For convenience, define $W^{\star\perp(1)}\coloneqq W^{\perp(1)}+\vec W^{\parallel\perp(1)}$.
The vector space $\vec W^{\star\perp(1)}$ associated with it is a complement of
$\vec W^{\parallel\parallel(1)}$ in $\vec W^{(1)}$.
To make the notation look more consistent, we can use $\vec W^{\star\parallel(1)}$
as an alias of $\vec W^{\parallel\parallel(1)}$.
They are the same vector space, but
$\vec W^{\star\parallel(1)}$ emphasizes that it is a subspace of $\vec W^{(1)}$,
and $\vec W^{\parallel\parallel(1)}$ emphasizes that it is a subspace of $\vec W^{\parallel(1)}$.
Then, we have $W^{(1)}=W^{\star\perp(1)}+\vec W^{\star\parallel(1)}$.
Every point in $W^{(1)}$ can be uniquely written as a sum of a point in $W^{\star\perp(1)}$
and a vector in $\vec W^{\star\parallel(1)}$.
We can describe the decomposition by a projection $\pi^{\star(1)}:W^{(1)}\to W^{\star\perp(1)}$.

We will heavily use the "$\star$" on the superscripts of symbols.
Any symbol labeled with "$\star$" is dependent on $i$
(but independent on an overall constant factor on $i$).
You can regard those symbols to have an invisible "$i$" in the subscript
so that you can keep in mind that they are dependent on $i$.

*Example.*
Suppose we have a tank of gas with three extensive quantities $U,V,N$.
It is in non-thermal contact with a pressure bath with pressure $p$
so that it can exchange $U$ and $V$ with the bath.
Then, the projection $\pi^{\star(1)}$ projects macrostates
with the same enthalpy and number of particles into the same point.
Because a complement of a vector subspace is not determined,
there are multiple possible ways of constructing the projection.
One possible way is

$$\pi^{\star(1)}\!\left(U,V,N\right)\coloneqq\left(U+pV,0,N\right).$$

Here the fixed intensive quantity $p$ is involved.
Note that this projection is still valid for different temperatures of the bath,
so an overall constant factor of $i$ does not affect the projection.

## Non-thermal contact with a bath

Now, after introducing non-thermal contact with an example,
we can now formulate the non-thermal contact with a bath.

Suppose we have a system $\left(\mathcal E^{(1)},\mathcal M^{(1)}\right)$.
The main approach is constructing a composite system
out of the composite system for the $\vec W^{\parallel(1)}$-ensemble.

The composite system for the $\vec W^{\parallel(1)}$-ensemble was introduced in
[part 1]({% post_url 2023-03-30-measure-ensemble %}#thermal-ensembles).
We denote the bath that is in contact with our system as
$\left(\mathcal E^{(2)},\mathcal M^{(2)}\right)$.

Consider this projection $\pi^\star:W\to W^{\star\perp}$
(where $W^{\star\perp}$ is an affine subspace of $W$ and the range of $\pi^\star$):

$$\pi^\star\!\left(e_1,e_2\right)
\coloneqq\left(\pi^{\star(1)}\!\left(e_1\right),
\rho_{\pi(e_1,e_2)}\!\left(\pi^{\star(1)}\!\left(e_1\right)\right)\right).$$ {#eq:eq-pi-star}

To ensure that it is well-defined, we need to guarantee that
$\pi^{\star(1)}\!\left(e_1\right)\in W^{\parallel(1)}_{\pi(e_1,e_2)}$
for any $e_1,e_2$, and this is true.

The two spaces $W^{\star\perp}$ and $W^{\perp}$ do not have any direct relation.
The only relation between them is that the dimension of $W^{\star\perp}$ is
one plus the dimension of $W^{\perp}$ (if they are finite-dimensional).

What is good about the projection $\pi^\star$ is that it satisfies
$\vec W^{\star\parallel(1)}=\vec c^{(1)}\!\left(\vec\pi^\star(0)\right)$.
This makes our notation consistent if we construct another composite system out of $\pi^\star$.
Now, consider the composite system of $\left(\mathcal E^{(1)},\mathcal M^{(1)}\right)$
and $\left(\mathcal E^{(2)},\mathcal M^{(2)}\right)$ under the projection $\pi^\star$.
In the notation of the spaces and mappings that are involved in the newly constructed composite system,
we write "$\star$" in the superscript.

Just like how $\vec W^{\star\parallel(1)}$ is a subspace of $\vec W^{(1)}$,
$\vec W^{\star\parallel(2)}$ is also a subspace of $\vec W^{(2)}$.
This means that both $\vec\rho^{-1}\circ\vec\rho^\star$ and $\vec\rho\circ\vec\rho^{\star-1}$
are well-defined.
The former maps $\vec W^{\star\parallel(1)}$ to another subspace of $\vec W^{(1)}$,
and the latter maps $\vec W^{\star\parallel(2)}$ to another subspace of $\vec W^{(2)}$.

We can regard the construction of the new composite system as replacing
the "plate" between the subsystems in the original composite system from a "thermally conductive plate"
to a "thermally non-conductive plate".
Suppose that in the new situation, the intensive quantities "felt" by subsystem 1 is
$i^\star\in\vec W^{\star\parallel(1)\prime}$.
Then, because the bath is still the same bath in the two situations, we have

$$-i^\star\circ\vec\rho^{\star-1}=-i\circ\vec\rho^{-1}.$$

Therefore,

$$i^\star\coloneqq i\circ\vec\rho^{-1}\circ\vec\rho^\star$$ {#eq:eq-i-star}

would be a good definition of $i^\star$.
However, actually $i^\star$ is trivial:

$$i^\star=0.$$ {#eq:eq-i-star-0}

This is because [@eq:eq-pi-star] shows that
$\rho\!\left(W^{\star\parallel(1)}_e\right)=W^{\star\parallel(2)}_e$,
and thus

$$\vec\rho^{-1}\!\left(\vec\rho^\star\!\left(\vec W^{\star\parallel(1)}\right)\right)
=\vec W^{\star\parallel(1)},$$

which is the kernel of $i$ by definition.

Because $i^\star$ is trivial, it is irrelevant to the temperature of the bath
because it is zero no matter what temperature the bath is at.

*Example.*
Suppose a system described by $U_1,V_1,N_1$ is in non-thermal contact with a pressure bath,
and they can exchange energy and volume.
The projection $\pi$ is

$$\pi\!\left(U_1,V_1,N_1,U_2,V_2,N_2\right)
=\left(\frac{U_1+U_2}2,\frac{V_1+V_2}2,N_1,\frac{U_1+U_2}2,\frac{V_1+V_2}2,N_2\right).$$

Then, the projection $\pi^\star$ can be

$$\pi^\star\!\left(U_1,V_1,N_1,U_2,V_2,N_2\right)
=\left(U_1+pV_1,0,N_1,U_2-pV_1,V_1+V_2,N_2\right).$$

By choosing a different $\pi^{\star(1)}$ or a different $\pi$,
we can get a different $\pi^\star$.
They physically mean the same composite system.

The space $W^\perp$ is four-dimensional, and the space $W^{\star\perp}$ is five-dimensional.
We can denote the five degrees of freedom as
$U,V,H_1,N_1,N_2$, where $U\coloneqq U_1+U_2$ is the total energy, $V\coloneqq V_1+V_2$ is the total volume,
and $H_1\coloneqq U_1+pV_1$ is the enthalpy of subsystem 1.
Then, the projection $\pi^\star$ can be written as

$$\pi^\star\!\left(U_1,V_1,N_1,U_2,V_2,N_2\right)
=\left(H_1,0,N_1,U-H_1,V,N_2\right).$$

We can get $W^{\star\parallel}_e$ by finding the inverse of the projection,
where $e\coloneqq\left(H_1,0,N_1,U-H_1,V,N_2\right)$:

$$W^{\star\parallel}_e\coloneqq\pi^{\star-1}\!\left(e\right)
=\left\{\left(H_1-pV_1,V_1,N_1,U-H_1+pV_1,V-V_1,N_2\right)\middle|\,V_1\in\mathbb R\right\}.$$

Because it is parameterized by one real parameter $V_1$,
it is a one-dimensional affine subspace of $W$.
Projecting it under $c^{(1)}$ and $c^{(2)}$ will respectively give us
$W^{\star\parallel(1)}_e$ and $W^{\star\parallel(2)}_e$:

$$W^{\star\parallel(1)}_e
\coloneqq\left\{\left(H_1-pV_1,V_1,N_1\right)\middle|\,V_1\in\mathbb R\right\},$$

$$W^{\star\parallel(2)}_e
\coloneqq\left\{\left(U-H_1+pV_1,V-V_1,N_2\right)\middle|\,V_1\in\mathbb R\right\}.$$

The affine isomorphism $\rho^\star_e$ is then naturally

$$\rho^\star_e\!\left(H_1-pV_1,V_1,N_1\right)=\left(U-H_1+pV_1,V-V_1,N_2\right).$$

Its vectoric form is then

$$\vec\rho^\star\!\left(-p\,\mathrm dV_1,\mathrm dV_1,0\right)
=\left(p\,\mathrm dV_1,-\mathrm dV_1,0\right).$$

Our fixed intensive quantities are $i$, which is defined as
$i\!\left(\mathrm dU_1,\mathrm dV_1,0\right)=\frac1T\,\mathrm dU_1+\frac pT\,\mathrm dV_1$.
We can then get $i^\star$ by

$$i^\star\coloneqq i\circ\vec\rho^{-1}\circ\vec\rho^\star
=\left(-p\,\mathrm dV_1,\mathrm dV_1,0\right)\mapsto0.$$

This is consistent with Equation [@eq:eq-i-star-0].

## Non-thermal ensembles (bath version)

Now, we can define the non-thermal contact with a bath
to be the same as the thermal contact with a bath under $\pi^\star$.
Utilizing this definition, we can define the composite system for non-thermal ensembles.

*Definition.*
A **composite system for the non-thermal $\vec W^{\parallel(1)}$-ensemble**
of the system $\left(\mathcal E^{(1)},\mathcal M^{(1)}\right)$
with fixed intensive quantities $i$
is the same as the composite system for the thermal $\vec W^{\star\parallel(1)}$-ensemble
with fixed intensive quantities $i^\star=0$ (given by Equation [@eq:eq-i-star-0]),
where $\vec W^{\star\parallel(1)}$ is defined by Equation [@eq:eq-W-star-parallel].

This definition looks very neat.
Also, just like how we define the domain of fixed intensive quantities of a thermal ensemble,
we can define the domain of fixed intensive quantities of a non-thermal ensemble
to consist of those values that make the integral in the definition of the partition function converge.

Because we already derived the formula of the partition function in
[part 1]({% post_url 2023-03-30-measure-ensemble %}#thermal-ensembles)
that does not involve information about the bath anymore,
we can drop the "$(1)$" in the superscripts.
The partition function of the non-thermal ensemble is then

$$Z^\star\!\left(e,i^\star\right)=\int_{s\in\vec E^{\star\parallel}_e}
\Omega\!\left(e+s\right)
\mathrm e^{-i^\star\left(s\right)}\,\mathrm d\lambda^{\parallel}\!\left(s\right),\quad
e\in E^{\star\perp},\quad i^\star\in I^\star_e\subseteq\vec W^{\star\parallel\prime}.$$

Here, the $i^\star$ is not fixed at the trivial value $0$ (I abused the notation here)
but actually is an independent variable
serving as one of the arguments of the partition function that takes values in $I^\star_e$
(which is not the domain of fixed intensive quantities of the non-thermal ensemble that was mentioned above).
However, the only meaningful information about this non-thermal ensemble
is in the behavior of $Z^\star$ at $i^\star=0$ instead of any arbitrary $i^\star\in I^\star_e$,
but we do not know whether $0\in I^\star_e$ or not.
This is then a criterion of judge whether $i$ is
in the domain of fixed intensive quantities of the non-thermal ensemble or not.
To be clear, we define

$$J\coloneqq\left\{i\in\vec W^{\parallel\prime}\,\middle|\,
\exists e\in E^{\star\perp}:0\in I^\star_{e}\right\}.$$

A problem about this formulation is that it is possible to have two $i$'s that share the same
thermal equilibrium state.
In that case, the non-thermal ensemble is not defined.

Because $i^\star=0$, the observed extensive quantities in thermal equilibrium are just

$$\varepsilon^\circ
=e+\left.\frac{\partial\ln Z^\star\!\left(e,i^\star\right)}{\partial i^\star}\right|_{i^\star=0}
=e+\frac{\int_{s\in\left(E-e\right)\cap\vec W^{\star\parallel}}
s\Omega\!\left(e+s\right)\mathrm d\lambda^{\parallel}\!\left(s\right)}
{\int_{s\in\left(E-e\right)\cap\vec W^{\star\parallel}}
\Omega\!\left(e+s\right)\mathrm d\lambda^{\parallel}\!\left(s\right)},$$ {#eq:eq-epsilon-circ}

and the entropy in thermal equilibrium is just

$$S^\circ=\ln Z^\star\!\left(e,0\right)
=\ln\int_{s\in\left(E-e\right)\cap\vec W^{\star\parallel}}
\Omega\!\left(e+s\right)\mathrm d\lambda^{\parallel}\!\left(s\right).$$ {#eq:eq-S-circ}

We can cancel the parameter $e$ by Equation [@eq:eq-epsilon-circ] and [@eq:eq-S-circ]
to get

$$S^\circ=\ln Z^\star\!\left(\pi^\star\!\left(\varepsilon^\circ\right),0\right)
=\ln\int_{s\in\left(E-\varepsilon^\circ\right)\cap\vec W^{\star\parallel}}
\Omega\!\left(\varepsilon^\circ+s\right)\mathrm d\lambda^{\parallel}\!\left(s\right).$$ {#eq:eq-S-circ-vs-epsilon-circ}

What is interesting about Equation [@eq:eq-S-circ-vs-epsilon-circ] is that
it actually does not guarantee the intensive variables to be defined in $\vec W^\parallel$.
Physically this means that the temperature is not necessarily defined,
unlike the case of thermal ensembles
(this is because the thermal contact makes the temperature the same as the bath and thus defined).
The thing that is guaranteed is that the intensive variables are defined in $\vec W^{\star\parallel}$
and they must be zero.
Therefore, whenever the intensive variables are defined in $\vec W^\parallel$,
it must be parallel to $i$ (and remains the same if we scale $i$ by an arbitrary non-zero factor).
Physically, this means that the system must have the same intensive variables
as the bath up to different temperatures.

## Non-thermal ensembles (non-bath version)

It may seem surprising that we can define non-thermal ensembles without a bath.
How is it possible to fix some features about the intensive variables without a bath?
The inspiration is looking at Equation [@eq:eq-W-star-parallel].
We can make a guess here: if we contract the system along $\vec W^{\star\parallel}$,
the contraction satisfy the equal a priori probability principle.
We make this guess because of the following arguments:

- Mathematically, contraction is a legal new system,
so it should also satisfy the axioms that we proposed before.
- Physically, because the temperature of the bath is arbitrary,
the different accessible macrostates should not be too different
because otherwise the temperature would matter (as appears in the expression of the partition function).

After finding the equilibrium state of the contraction, we can use the contractional pullback
to find the equilibrium state of the original system.

If you do it right, you should get the same answer as Equation [@eq:eq-S-circ-vs-epsilon-circ].

## Summary

The only axiom that we used is the equal a priori probability principle.
Then, we formulated three types of ensembles: microcanonical, thermal, and non-thermal.
