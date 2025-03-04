---
title: The role of particle indistinguishability in statistical mechanics
date: 2025-03-03 22:53:47 -0800
categories:
- physics
tags:
- mathematical physics
- statistical mechanics
- probability
- long paper
- combinatorics
- quantum mechanics
layout: post
excerpt: 'Indistinguishability plays an important role
in enumerative problems in combinatorics.
This article explains the concept and significance of particle indistinguishability
in statistical mechanics.'
---

## Classical vs. quantum statistical mechanics

Previously, I have written two blog articles
([part 1]({% post_url 2023-03-30-measure-ensemble %})
about thermal ensembles
and [part 2]({% post_url 2023-05-01-measure-ensemble-2 %})
about non-thermal ensembles)
about a formalism of statistical ensembles.
I will be using it as the formalism of classical statistical mechanics in this article.

In that formalism, the space of microstates of a system is a measure space $\mcal M$,
and the physical meaning of the measure is the number of microstates.
A macrostate is described by the extensive quantities,
which are a function of the microstate,
so designating a macrostate restricts the microstates that can realize it
to a subset of $\mcal M$.

A state of the system is a probability density function $p$ on $\mcal M$,
whose physical meaning is an ensemble of microstates.
The macroscopically measured extensive quantities of the system are defined to be the ensemble average,
i.e., the measured value of $A:\mcal M\to\bR$ is $\int_{\mcal M}pA$.
Generally, any probability density function is a perfectly valid state,
but the most important ones are those that are thermal equilibrium states,
including the microcanonical ensembles, the thermal ensembles,
and the non-thermal ensembles.
The term about an ensemble being thermal or non-thermal is made up by me,
but for most practical reasons, we only need to focus on thermal ensembles
(because both canonical ensembles and grand canonical ensembles are thermal ensembles).

To avoid subtleties about measure theory and topology,
in this article, we will only use counting measure and discrete spaces
for the space of microstates and the space of extensive quantities.

<details><summary>Possible confusion of macrostate vs. state and an example</summary>

In this article, a <dfn>macrostate</dfn> is a tuple of extensive quantities
(usually the energy, the volume, and the number of particles)
that constrain the microstates.
In classical statistical mechanics, every microstate has a definite macrostate.
Technically, any function on the microstates may be defined as the macrostates of the system
(as long as it meets some measure-theoretic requirements).

On the other hand, a <dfn>state</dfn> is an ensemble of microstates.
In classical statistical mechanics, it is a probability distribution on the microstates.
Any probability density function on the microstates is a state state of the system.

These two concepts are clearly distinct in the context of this article,
but they are often confused in the literature.

For example, consider the system $\mcal M=\B{0,1,2,3}$,
and it has three different macrostates $E=\B{0,1,2}$.
Then, we can define the set of microstates that realize the macrostate $0$ to be
$M_0=\B{0}$,
and similarly we can define $M_1=\B{1,2}$ and $M_2=\B{3}$.
We then finished defining the macrostates of the system.

Now, let's see what states we can define.
Despite that the system has only $4$ different microstates,
it has infinitely many states because any probability distribution on the microstates is a state,
which may be specified by the probabilities $p_0,p_1,p_2,p_3$ that sum to $1$,
each representing the probability of the corresponding microstate.
For example,
$$p_0=\fr12,\quad p_1=\fr12,\quad p_2=p_3=0$$
is a perfectly valid state of the system.
However, to find the thermal equilibrium state for a certain macrostate,
we can use the equal *a priori* probability principle to find the microcanonical ensemble.
For example, the microcanonical ensemble for the macrostate $0$ is
$$p_0=1,\quad p_1=p_2=p_3=0,$$
and the microcanonical ensemble for the macrostate $1$ is
$$p_1=p_2=\fr12,\quad p_0=p_3=0.$$

Now let's consider $E$ as a subset of $\bR$ so that we can do arithmetics on $E$
(of course it is called extensive quantities for a reason).
We can then define a thermal ensemble given the intensive variables, say, $1$:
$$p_0=\fr{1}{Z},\quad p_1=p_2=\fr{\e^{-1}}{Z},\quad p_3=\fr{\e^{-2}}{Z},$$
where $Z=1+2\e^{-1}+\e^{-2}$ is the partition function.

I would like to give an example of a non-thermal ensemble,
but it is only non-trivially defined if the space of extensive quantities is at least two-dimensional
(i.e. if $E$ lives on $\bR^2$ instead of $\bR$),
so I will omit it here.
</details>

However, in quantum mechanics, things get different because of the introduction of superpositions of states.
For the superpositions to make sense, the space of microstates must be endowed with a vector space structure.
By principles in quantum mechanics, it is the projective space of a separable Hilbert space $\mcal H$.
A state of the system is then a density operator $\rho$ on $\mcal H$,
which can be any positive semi-definite self-adjoint operator with trace $1$.
This is quite different from a state in the classical case
because we cannot simply interpret a density operator as an ensemble of microstates.
Generally, we can have different ensembles that realize the same density operator.
All those different ensembles are just equally physically valid (without further contexts) due to the
[Schr&ouml;dinger--HJW theorem](https://en.wikipedia.org/wiki/Schr%C3%B6dinger%E2%80%93HJW_theorem).

Extensive quantities are self-adjoint operators on $\mcal H$.
This leads to a key difference between classical and quantum statistical mechanics:
in quantum statistical mechanics, a microstate generally does not have a definite macrostate,
except for the case when it is an eigenstate of all the extensive quantities.
However, we can still define macroscopically measured extensive quantities
for any state of the system, being $\Tr\rho A$ for any self-adjoint operator $A$.

The fact that only the states in the eigenspace of all the extensive quantities have a definite macrostate
imposes a challenge on defining the microcanonical ensemble
(to clarify, I am referring to the density operator, which does not define a particular ensemble,
but I am still using "microcanonical ensemble" to refer to that state).
It may not be possible to define a microcanonical ensemble for every possible combinations of values of the extensive quantities (in their spectra).
In practice, one would restrict to only consider mutually commuting operators as the extensive quantities.
Then, the microcanonical ensemble density operator is the projection operator onto the common eigenspace
(properly normalized to have trace $1$).
The statistical mechanics is then actually equivalent to the classical statistical mechanics
(namely taking the eigenbasis of the extensive quantities as the classical space of microstates)!
Unfortunately, this is not the way typically used in practice because it is not always practical to find the eigenbasis.

To avoid mathematical subtleties, we will mostly only consider finite-dimensional Hilbert spaces.

Here is a summary table:

| | Classical | Quantum |
|-|-|-|
| Space of microstates | Measure space $\mcal M$ | Projective space of a separable Hilbert space $\mcal H$ |
| State | Probability density function $p$ on $\mcal M$ | Density operator $\rho$ on $\mcal H$ |
| Extensive quantities | Functions on $\mcal M$ | Self-adjoint operators on $\mcal H$ |
| Measured value of $A$ | $\int_{\mcal M}pA$ | $\Tr\rho A$ |

## Many-body systems

We then want to ask: if the space of microstates for one particle is $\mcal M$ (or $\mcal H$),
what is the space of microstates for many particles?
The answer depends on whether the particles are distinguishable particles,
indistinguishable fermions, or indistinguishable bosons.

There are two aspects in which fermions and bosons contrasts with each other.
One is their symmetry properties:
fermions are antisymmetric under exchange of particles, and bosons are symmetric.
The other is their statistical properties:
fermions obey the Pauli exclusion principle, and the bosons do not.
The second property naturally leads us to work with Fock states,
which can be derived from the first property after second quantization.
In this article, a third kind of particles, distinguishable particles, will also be considered.
They are neither symmetric nor antisymmetric under exchange of particles,
but exchanging particles actually gives a new state.

The whole idea of these different kinds of particles is very easy to describe in quantum mechanics.
If the microstates of each particle live on $\mcal H$,
then the microstates of many distinguishable particles live on the
[tensor algebra](https://en.wikipedia.org/wiki/Tensor_algebra) $\fc T{\mcal H}$;
those of many bosons live on the
[symmetric algebra](https://en.wikipedia.org/wiki/Symmetric_algebra) $\fc S{\mcal H}$;
and those of many fermions live on the
[exterior algebra](https://en.wikipedia.org/wiki/Exterior_algebra) $\fc\bigwedge{\mcal H}$.
Those spaces are called Fock spaces.
They are naturally [graded](https://en.wikipedia.org/wiki/Graded_ring#Graded_algebra),
so the particle number operator can be defined by defining the $N$-grade subspace of the Fock space
to be the eigenspace associated with the eigenvalue $N$.

Taking ideas from the Fock basis in quantum mechanics,
we can similarly discuss those different kinds of particles in classical statistical mechanics.
If the microstates of each particle are $\mcal M$,
then the microstates of many distinguishable particles are tuples $\bigcup_{N\in\bN}\mcal M^N$;
those of many bosons are finite [multisets](https://en.wikipedia.org/wiki/Multiset#Basic_properties_and_operations)
in the universe $\mcal M$, i.e.,
$\set{m:\mcal M\to\bN}{\sum m<\infty}$;
and those of many fermions are finite subsets of $\mcal M$, i.e.,
$\fc{\mcal P_{<\aleph_0}}{\mcal M}$.
Those concepts, namely tuple, multiset, and set,
are actually common mathematical constructs used in combinatorics.
They all have a natural notion of size, which we define the number of particles to be.

I previously stated that there is an equivalence between quantum and classical statistical mechanics.
Here, necessarily for the equivalence to hold,
the dimension of the $N$-particle subspace in the Fock space (when it is finite)
must be the same as the cardinality of the $N$-particle microstates in the classical case,
and this is indeed the case.
Assume that $\dim\mcal H=\card\mcal M=M$,
then both the dimension of the subspace of $N$ distinguishable particles
and the number of classical microstates of $N$ distinguishable particles are $M^N$.
This number for bosons is $M^{\overline N}/N!$,
and that for fermions is $M^{\underline N}/N!$,
where
$$M^{\overline N}\ceq\prod_{M\le k<M+N}k,\quad
M^{\underline N}\ceq\prod_{M-N<k\le M}k$$
are called the rising factorial power and the falling factorial power respectively.
These are the number of ways to put $N$ balls into $M$ boxes under three different rules.

Here is a summary table:

| | Distinguishable | Bosons | Fermions |
|-|-|-|-|
| Quantum | Tensor algebra | Symmetric algebra | Exterior algebra |
| Classical | Tuple | Multiset | Set |
| Number | $M^N$ | $M^{\overline N}/N!$ | $M^{\underline N}/N!$ |

<details><summary>Labels on distinguishable particles</summary>

To explain this, I may actually need to explain the mathematical definition of a tuple.
My personal favorite definition of a tuple is nested ordered pairs, with
[Kuratowski's definition](https://en.wikipedia.org/wiki/Ordered_pair#Kuratowski's_definition)
of an ordered pair.
However, for the purpose of this illustration, I will use another definition,
which defines a tuple as a function from a finite
[von Neumann ordinal](https://en.wikipedia.org/wiki/Ordinal_number#Von_Neumann_definition_of_ordinals)
to the set of elements ($\mcal M$ in this case),
and a function is defined using its
[graph](https://en.wikipedia.org/wiki/Graph_of_a_function).
There is a notational advantage of this definition in that,
if we also define natural numbers as von Neumann ordinals
(which is a common practice in set theory),
it unifies the notation of the Cartesian power and the set of functions
(in other words, we can identify $\mcal M^N$ with $N\to\mcal M$).

With this definition, we can see that a microstate of $N$ distinguishable particles
is a function from their labels to the single-particle microstates,
and the labels are always the first $N$ natural numbers.
The point is that, if a particle is removed or added,
the labels will be rearranged so that the labels are always the first $N$ natural numbers.

This should concern you in that the operation of rearranging labels
makes each label no longer unique to each particle.
For example, say, initially, the system has two particles with labels $0$ and $1$,
and they are in single-particle microstates $m_0$ and $m_1$ respectively.
It is then allowed to exchange particles with a bath.
If particle $1$ moves from the system to the bath
while another particle from the bath moves to the system,
then the two particles in the system after the exchange
will still have labels $0$ and $1$,
but they are not the same particles as before.
Namely, particle $1$ is not the same particle $1$ as before.
If the two new partcicles are in single-particle microstates $m_0$ and $m_1$ respectively just as before,
then this new state will be regarded as the same state as the initial state,
which should not be true because the particles are different from before.

Therefore, to avoid the subtlety of the labels,
maybe it is better to consider microstates of many distinguishable particles
directly as functions from the set of particles to the single-particle microstates,
without attaching labels to the particles.
However, this means that as long as the system is allowed to exchange particles with a bath,
which, by definition, has a large number of particles compared to the system,
the number of microstates in the system will be drastically increased.
It would then be impossible to use the grand canonical ensemble
to describe the system
because you will find that the average number of particles in the system
would depend on the number of particles in the bath,
which is very absurd.

From this, we can see that the idea that every particle is distinguishable
is inherently flawed, i.e.,
it can only be self-consistent with the unphysical operation of rearranging labels.
This hints that, either the *a priori* probability principle is not applicable in this case,
or there are only a few distinguishable types of particles in any practical cases.

</details>

## Gibbs factor and entropy

Gibbs put the famous factor of $1/N!$ in front of the phase space integral of the ideal gas
to make the entropy asymptotically linear in $N$.
People often interpret this as accounting for the indistinguishability of particles
so that the result of classical treatment can match with the quantum treatment.

Actually, the effect of the Gibbs factor may not be as important as you imagined.
In the microcanonical and the canonical ensemble,
the Gibbs factor is just an overall factor for the partition function.
The only effect is that the chemical potential would not be intensive
and that the entropy would not be extensive without it,
but there is no actual physical consequence of this
because we cannot measure the entropy and the chemical potential in experiments anyway.
In the grand canonical ensemble, the distribution of the number of particles
is expected to be different with or without the Gibbs factor.
However, at least for the ideal gas example (or more generally,
for models with a quadratic Hamiltonian),
the equipartition theorem and the ideal gas law would still hold
without the Gibbs factor.
Consider the grand canonical partition function of the ideal gas,
whether we include the Gibbs factor or not:
$$\Xi_1\ceq\sum_N\fr1{N!}\p{\fr{\e^{\beta\mu}V}{\lmd^d}}^N,\quad
\Xi_2\ceq\sum_N\p{\fr{\e^{\beta\mu}V}{\lmd^d}}^N,$$
where $\lmd\ceq\sqrt{\beta h^2/2\pi m}$.
If you spend the time to actually do the calculation,
you can get the desired $pV=\a N/\beta$ and $\a E=d\a N/2\beta$,
whether you include the Gibbs factor or not.
The entropy and the chemical potential would indeed change drastically with the introduction of the Gibbs factor,
but they are not actually measurable quantities in experiments.

<details><summary>In case you feel this too magical</summary>

Let's do this calculation.
The calculation with $\Xi_1$ is standard on textbooks, so I will skip it.
For $\Xi_2$, we have
$$\Xi_2=\fr1{1-\e^{-\alp}V/\lmd^d},$$
where $\alp\ceq-\beta\mu$.
Notice that there is a condition for this convergence, but it does not matter
because we only need to consider those $\alp$ values that make it converge.
Then,
$$\a N=-\fr{\partial}{\partial\alp}\ln\Xi_2
=\fr{\e^{-\alp}V/\lmd^d}{1-\e^{-\alp}V/\lmd^d},$$
$$\a E=-\fr{\partial}{\partial\beta}\ln\Xi_2
=\fr d{2\beta}\fr{\e^{-\alp}V/\lmd^d}{1-\e^{-\alp}V/\lmd^d}
=\fr d{2\beta}\a N.$$
Therefore, it works out.
You may have noticed that the $\a N$ and $\a E$ do not seem to be proportional to $V$,
but it is fine because $\alp$ is not intensive.
Now, for the ideal gas law, we have
$$p=\fr1\beta\fr{\partial}{\partial V}\ln\Xi_2
=\fr1\beta\fr{\e^{-\alp}/\lmd^d}{1-\e^{-\alp}V/\lmd^d}
=\fr{\a N}{\beta V}.$$
Therefore, it works out.

In fact, you can multiply the summand by any (sensible)
function of $N$ without spoiling these state equations,
but it is specific to the ideal gas.
The reason behind this is because of the strict extensivity of $E$ and $N$.

Let's just consider the general case for now.
Assume that the canonical partition function is $\fc fN\fc Z{\beta,N,V}$,
where $\fc fN$ is the Gibbs factor, which can actually be any non-trivial function you like.
Then, the average energy in the canonical ensemble is
$$\a E_Z=-\fr{\partial}{\partial\beta}\fc\ln{\fc fN\fc Z{\beta,N,V}}
=-\fr1{\fc Z{\beta,N,V}}\fr{\partial}{\partial\beta}\fc Z{\beta,N,V}
=\fc u{\beta,N/V}N,$$
where $\fc u{\beta,N/V}$ cannot depend on any extensive quantities
(here, the only things that it can depend on are the temperature $\beta$
and the particle number density $N/V$).
The last step is because both $E$ and $N$ are extensive quantities
(so they must be proportional to each other).
Notice that this requires the thermodynamic limit
unless we are considering the ideal gas, where the extensivity is exact.
Therefore,
$$\fr{\partial}{\partial\beta}\fc Z{\beta,N,V}=-\fc u{\beta,N/V}N\fc Z{\beta,N,V}.$$ {#eq:partial-z}

Particularly, for ideal gases, $\fc u{\beta,N/V}$ only depends on $\beta$, with no $N/V$ dependence.
For more general cases, it is reasonable to assume that $\fc u{\beta,n}$ can be expanded in a power series of $n$:
$$\fc u{\beta,n}=\sum_{k=0}^\infty\fc{u_k}\beta n^k.$$

Then, let's define the grand canonical partition function to be
$$\fc\Xi{\beta,\alp,V}\ceq\sum_N\fc fN\fc Z{\beta,N,V}\e^{-\alp N}.$$
Then, the average energy in the grand canonical ensemble is
$$\a E_\Xi=-\fr{\partial}{\partial\beta}\ln\fc\Xi{\beta,\alp,V}
=-\fr1{\fc\Xi{\beta,\alp,V}}\sum_N\fc fN\fr{\partial\fc Z{\beta,N,V}}{\partial\beta}\e^{-\alp N}.$$
Substitute Equation [@eq:partial-z],
and then we get
$$\a E_\Xi=\sum_k\fr{\fc{u_k}\beta}{V^k}\a{N^{k+1}}_\Xi.$$
For ideal gas, only the $k=0$ term is nonzero, so we recover
$$\a E_\Xi=\fc u{\beta,\a N_\Xi/V}\a N_\Xi.$$ {#eq:grand-canonical-energy}
For more general case, for this to be true, we need to require that
$$\fr{\a{N^k}_\Xi}{\a{N}^k_\Xi}\to1$$
in the thermodynamic limit.
However, this is not true for a general $\fc fN$.
In fact, it is not true already for the $\Xi_2$ example above,
which can be easily shown for $k=2$. Notice that
$$\fr{\a{N^2}_{\Xi_2}-\a N_{\Xi_2}^2}{\a N_{\Xi_2}^2}
=\fr{\fr{\partial^2}{\partial\alp^2}\ln\fc{\Xi_2}{\beta,\alp,V}}{\p{\fr{\partial}{\partial\alp}\ln\fc{\Xi_2}{\beta,\alp,V}}^2}
=\fr1{\e^{-\alp}V/\lmd^d}=1+\fr1{\a N_{\Xi_2}}\to1.$$
Therefore,
$$\fr{\a{N^2}_{\Xi_2}}{\a N_{\Xi_2}^2}\to2.$$
This makes [@eq:grand-canonical-energy] not true if $\fc{u_1}\beta$ is non-trivial.
The deeper reason behind this disagreement is that
the extensivity of the characteristic functions
(in this case, the Helmholtz energy and the grand potential)
is required for the thermodynamic equivalence between different ensembles
(in this case, the canonical ensemble and the grand canonical ensemble).
I will cover this in more detail later in this article.

</details>

This then raises questions.
Does the entropy have to be linear in $N$?
In other words, does the entropy need to meet the traditional sense of extensivity?
Does physics actually care about our definition of the entropy?
The answer to these questions is actually no.
The entropy is not something that we can directly measure in experiments,
and there are some freedom in the definition of the entropy
that does not affect any physical outcomes.

Now, recall that the Gibbs factor accounts for the indistinguishability of particles.
This would mean that whether the particles are actually distinguishable or not
does not matter the actual physics.
Gas particles in real life may well be distinguishable.
For example, chlorine has two stable isotopes that naturally occur with considerable abundance,
and that does not make it substantially different from, say, fluorine,
which has only one stable isotope.
Maybe people will also find observable features in fluorine molecules
that would make them distinguishable, who knows?
That would not deny any of the experimentally tested
thermodynamic theories that can be applied to fluorine today.

Therefore, the Gibbs factor should not be introduced in the sole purpose
of accounting for the indistinguishability of particles.
It is introduced to make the entropy traditionally extensive.
However, as I already stated, it is not necessary for the actual physics,
so why is it important to make the entropy extensive?
The answer is that, otherwise, the free energy
(be it the Helmholtz energy or the Gibbs energy) would not be extensive.
The free energy measures the work that can be extracted from the system,
and by this nature it must be extensive because energy is additive.
Therefore, only when we define the entropy in a way such that it is extensive,
can it possibly make the derived free energy be able to measure the extractable work.

Having the idea that the free energy measures the amount of work that can be extracted from the system,
we would then think we are able to extract some work out of the process of mixing two distinguishable gases.
This is because distinguishability gives rise to a mixing entropy,
which is the whole reason why it makes the entropy fail to be traditionally extensive.
On the other hand, as I stated, whether we regard the two gases distinguishable or not in theory,
it does not matter the actual physics.
However, the amount of work that can be extracted from the process of mixing two gases
is very physical by any means.
To resolve this, the take is that,
if it is possible to extract work from mixing them in one's theory,
then it should also be possible to distinguish the gases in their theory.
On the other hand, if the two gases are indistinguishable in one's theory,
then it is impossible to extract work from mixing them in their theory.
Therefore, it actually does not matter whether the gases are "in reality" distinguishable or not,
the theory would be able to make itself consistent.
The texts about the [mixing paradox](https://en.wikipedia.org/wiki/Gibbs_paradox#Mixing_paradox)
on Wikipedia explain this idea, which is a gist of the
[paper](https://doi.org/10.1007/978-94-017-2219-3_1)
(which unfortunately did not talk about the grand canonical ensemble in detail).

Another importance for the entropy to be extensive is that
only then can different ensembles be thermodynamically equivalent.
The thermodynamical equivalence is the property that
the thermodynamic properties determined from the characteristic functions
(e.g., entropy, Helmholtz energy, and grand potential)
of different statistical ensembles are the same in the thermodynamic limit.
This is not a sufficient condition, though,
because we also need to require that the entropy is a concave function
of the extensive quantities.
There is a good [paper](https://doi.org/10.1007/s10955-015-1212-2)
that explains the equivalence and nonequivalence of ensembles in detail,
assuming the characteristic functions are always extensive.
The main idea is that, for any statistical ensemble,
the probability measure on the space of macrostates,
parametrized by the particle number $N$,
satisfies the large deviation principle with the
[rate function](https://en.wikipedia.org/wiki/Rate_function) being the characteristic function.
With the concavity condition, using a generalization of
[Laplace's method](https://en.wikipedia.org/wiki/Laplace%27s_method),
it can then be proven that
the characteristic functions of different ensembles are related
as being the Legendre transform of each other.

<details><summary>Simplified sketch</summary>

I am writing this because before I read the paper,
I independently came up with the same idea of using Laplace's method
to prove the equivalence of ensembles.
I wrote it on [Zhihu](https://www.zhihu.com/question/35706570/answer/3505430771),
and here is a translation of it.

Assume that the extensive quantity of the system is $E$
and that the corresponding intensive quantity is $I$.
Suppose that the partition function of the $E$-ensemble is $\fc\Omg E$,
and then the characteristic function of the $E$-ensemble would be
$\fc SE\ceq\ln\fc\Omg E$,
and we would have $I=\fc{S'}E$ (the prime denotes the derivative)
in the thermal equilibrium state with fixed $E$.

On the other hand, the partition function $\fc ZI$ of the $I$-ensemble
is the Laplace transform of $\fc\Omg E$:
$$\fc ZI=\int\fc\Omg E\e^{-IE}\,\d E
=\int\e^{\fc SE-IE}\,\d E.$$
We have the characteristic function $\fc FI\ceq-\ln\fc ZI$
of the $I$-ensemble, and we would have $E=\fc{F'}I$
in the thermal equilibrium state with fixed $I$.

The question now is whether $I=\fc{S'}E$ and $E=\fc{F'}I$ are actually the same equation.
In other words, are $S'$ and $F'$ inverse functions of each other?
If they are, then we get the same results from the $E$-ensemble and the $I$-ensemble.
Nevertheless, generally they are not.
We just need one counterexample to show that:
for system with a quadratic Hamiltonian, let $E$ be the energy,
and then its corresponding intensive quantity $I$ is the inverse temperature
(in this case, the $E$-ensemble is the microcanonical ensemble,
and the $I$-ensemble is the canonical ensemble), and we have
$$\fc\Omg E\propto E^{n/2},\quad
\fc{S'}E=\fr{n/2}E,\quad
\fc{F'}I=\fr{1+n/2}I,$$
where $n$ is the number of quadratic terms in the Hamiltonian
(e.g., $n=3N$ for classical monatomic ideal gas).

However, we can see that, for the thermodynamic limit $n\to\infty$,
we indeed have $S'$ and $F'$ being the inverse functions of each other.
We can then conjecture that, under the thermodynamic limit,
different ensembles will get the same result.
Now, what is the thermodynamic limit?
We may think that multiplying extensive quantities by a zooming factor $\lmd$
and letting $\lmd\to\infty$ is the thermodynamic limit.
A good characteristic function should also be extensive in the thermodynamic limit,
so $\fc S{\lmd E}\approx\lmd\fc SE$.
Therefore, we define
$$\fc{S_\lmd}E\ceq\fc S{\lmd E},\quad
\fc{Z_\lmd}I\ceq\int\e^{\fc{S_\lmd}E-I\lmd E}\,\d E
\approx\int\e^{\lmd\p{\fc SE-IE}}\,\d E.$$
When $\lmd\to\infty$, use Laplace's method to get
(assuming that $S$ is a concave function)
$$\fc{Z_\lmd}I\approx\sqrt{\fr{2\pi}{\lmd\v{\fc{S''}{\fc{S^{\prime-1}}{I}}}}}
\e^{\lmd\p{\fc S{\fc{S^{\prime-1}}{I}}-I\fc{S^{\prime-1}}{I}}},$$
and thus (only keeping the highest order term in $\lmd$)
$$\fc{F'_\lmd}I\ceq-\fr\partial{\partial I}\ln\fc{Z_\lmd}I
\approx\lmd\fc{S^{\prime-1}}{I}\approx\fc{S^{\prime-1}_\lmd}I,$$
where $\fc{S'_\lmd}E\ceq\d\fc S{\lmd E}/\d\!\p{\lmd E}
=\fc{S'}{\lmd E}$
(instead of simply the derivative of $S_\lmd$).
This is indeed our expected result:
$S'_\lmd$ and $F'_\lmd$ are inverse functions of each other.

</details>

## Gibbs factor and indistinguishability

Why can the introductiong of the Gibbs factor account for the indistinguishability?

Define $\fc{\Omg^0}{M,N}\ceq M^N$ to be the number of microstates of $N$ distinguishable particles
with $M$ single-particle microstates.
Then, define $\fc{\Omg_0}{M,N}\ceq\fc{\Omg^0}{M,N}/N!$
to be the version with the Gibbs factor.
Also, define $\fc{\Omg_\pm}{M,N}\ceq M^{\overline{\underline N}}/N!$
for bosons and fermions,
where $M^{\overline{\underline N}}$ is
$M^{\overline N}$ or $M^{\underline N}$
corresponding to $+$ or $-$ in the notation "$\pm$" respectively.

If we make the distinguishable particles indistinguishable,
we have to characterize them as either bosons or fermions.
However, $\Omg_0$ and $\Omg_\pm$ are not exactly the same,
This discrepancy can be resolved in the large $M$ limit.
We have
$$\begin{align*}
\fc{\Omg_\pm}{M,N}&=\fr1{N!}\prod_{k=0}^{N-1}\p{M\pm k}
=\fr{M^N}{N!}\prod_{k=0}^{N-1}\p{1\pm\fr kM}\\
&=\fc{\Omg_0}{M,N}\p{1\pm\fr{N\p{N-1}}{2M}+\order{M^{-2}}},
\end{align*}$$
where the big-O notation is understood as $N$ fixed and $M\to\infty$.
Therefore, to have $\Omg_0\approx\Omg_\pm$, loosely speaking,
we need $M\gg N^2$.
In this limit, there is no difference between boson statistics and fermion statistics,
and both of them are the same as distinguishable particles with the Gibbs factor.

Intuitively, if $M$ is very large,
then in most of the microstates, each single-particle microstate
is occupied by at most one particle,
which renders boson statistics and fermion statistics the same.
Particularly, if there are infinitely many single-particle microstates,
then $M$ is effectively infinite,
so $\Omg_0=\Omg_\pm$ is strictly true for any $M$ in this case.
This is why the result for classical ideal gas is exact:
there are so many single-particle microstates that
the probability for two particles to occupy the same microstate is exactly zero,
i.e., such microstates have zero measure.

<details><summary>Classical Fermi gas</summary>

I previously said that, to make things simple, the measure on $\mcal M$ would be the counting measure.
One big reason behind that is the difficulty of a purely classical description of the Fermi gas.

In the classical description of a gas,
the microstates of each particle are points in the $2d$-dimensional phase space,
which is a region in $\bR^{2d}$,
and the measure is just the usual Lebesgue measure
(or any other practically equivalent measure, for math nerds).
Therefore, naturally,
the microstates of many particles with particle number $N$ would be a region in $\bR^{2dN}$,
also equipped with the usual Lebesgue measure.

If the gas consists of fermions, then in any microstate,
two particles cannot be in the same single-particle microstate.
However, the set of all microstates that have two such particles
has zero measure in the $2dN$-dimensional phase space.
Therefore, it just would not matter at all whether the particles are fermions or not in the classical description.

However, we know that is not the actual case.
In practice, we divide the single-particle phase space into cells of size $h^{d}$,
where $h$ is the Planck constant, which we put here by hand.
No two particles can reside in the same cell.
Therefore, any "bulky" region in the single-particle phase space
with volume $\Omg$ cannot contain more than $\Omg/h^{d}$ particles.

This all sounds fine, except that we did not define what a "bulky" region is.
Of course, the Fermi sea is a bulky region,
but what about a tube that is long enough to connect any specified discrete points in the single-particle phase space
but is thin enough to have volume even smaller than $h^{d}$?
In fact, by constructing regions with not-so-exotic shapes,
we can make any distributino of particles in the single-particle phase space
seem like it is violating the Pauli exclusion principle or not arbitrarily.
Just shown in the figure below,
particles that reasonably distribute in different cells may be regarded as being in one cell,
while particles that reasonably occupy the same cell may be regarded as being in different cells.

![Regular phase space cells and exotic ones]({{page.figure}}phase-space-cells.svg){.dark-adaptive}

There are some possible ways to resolve this issue.
One naive way is to stipulate that the cell arranges in some lattice structure
such as the simple cube lattice.
However, this will break the rotational symmetry in the phase space
so that the Fermi sea will not be strictly isotropic anymore.
Also, the introduction of the lattice structure changes the physics of the system
if it is far from the thermodynamic limit.
Only in the thermodynamic limit will the particular choice of lattice structure
be irrelevant to the physics.

Another way is to consider a phase space
[density functional theory](https://en.wikipedia.org/wiki/Density_functional_theory),
where a function $\rho$ is defined on the single-particle phase space,
representing the number of particles in unit volume in the phase space.
The measure of the number of microstates for the many-body system
is then the functional integral of this density function.
The Pauli exclusion principle can then be translated into the constraint
that the value of $\rho$ must not exceed $1/h^{d}$ anywhere,
which prevents the number of particles in any region of size $h^{d}$ from exceeding $1$.
It can also describe bosons by removing this constraint.
I have not explored this approach myself,
but I doubt it would be a good idea
because it seems like an overkill to the problem
and will introduce even more mathematical subtleties with the functional integral.
Also, more careful analysis must be done to devise the proper measure on the functional space
to match the usual sense of number of microstates.
Another issue is that it defies the classical notion of particles as clear points
but instead treats them as cloudy distributions just like quantum mechanics,
and by this very reason it is not capable of being generalized to describe distinguishable particles.

</details>

When $M$ is not very large, using the Gibbs factor is then not a correct way
to account for indistinguishability.
However, it can be corrected, as long as we use
$\fc{\Omg^\pm}{M,N}\ceq M^{\overline{\underline N}}$ instead of
$\fc{\Omg^0}{M,N}$.
Then, we would have $\fc{\Omg^\pm}{M,N}/N!=\fc{\Omg_\pm}{M,N}$ exactly,
corresponding to boson statistics and fermion statistics.
There are indeed combanitorics problems of putting distinguishable balls into boxes
that results in $\fc{\Omg^\pm}{M,N}$.
Actually, $\fc{\Omg^+}{M,N}$ is the number of ways
to put $N$ distinguishable balls into $M$ boxes
with the balls in each box being ordered;
$\fc{\Omg^-}{M,N}$ is the number of ways to put $N$ distinguishable balls into $M$ exclusive boxes
("exclusive" means that each box cannot contain more than one ball).

Now, $\Omg^\pm$ represents two more different rules
under which we put balls into boxes.
Together with $\Omg_0$ and $\Omg_\pm$, there are five different rules in total.
We can summarize them into a table:

| $N$ balls | $M$ boxes | Number of ways | Particles |
|-|-|-|-|
| Distinguishable | Unordered | $\Omg^0=M^N$ | Distinguishable particles |
| Distinguishable | Ordered | $\Omg^+=M^{\overline N}$ | Bosons (without Gibbs factor) |
| Distinguishable | Exclusive | $\Omg^-=M^{\underline N}$ | Fermions (without Gibbs factor) |
| Indistinguishable | Unordered | $\Omg_+=M^{\overline N}/N!$ | Bosons |
| Indistinguishable | Exclusive | $\Omg_-=M^{\underline N}/N!$ | Fermions |

<p class="no-indent">
These are all common enumerative problems of putting balls into boxes
in combinatorics.
One can extend this table by including more different enumerative problems.
There is such a table called the
[twentyfold way](https://en.wikipedia.org/wiki/Twelvefold_way#The_twentyfold_way)
that lists 20 different enumerative problems.
</p>
