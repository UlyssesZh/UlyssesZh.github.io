---
title: 'A measure-theoretic formulation of statistical ensembles (part 1)'
date: 2023-03-30 21:49:51 -0700
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

I feel that the process of using statistical ensembles to find properties of thermal system
is not rigorous enough.
There are some operations that need to be defined precisely.
Also, it is not generalized enough.
Currently, the only generally used statistical ensembles are the microcanonical ensemble,
the canonical ensemble, and the grand canonical ensemble,
but there are actually other possible ensembles that are potentially useful.
Therefore, I feel it necessary to try to have a mathematical formulation.

## Mathematical tools and notations

Suppose $(\Omega,\sigma(\Omega),P)$ is a probability space.
Suppose $W$ is an affine space.
For some map $f:\Omega\to W$, we define the $P$-expectation of $f$ as

$$\mathrm E_P\!\left[f\right]\coloneqq\int_{x\in\Omega}\left(f(x)-e_0\right)\mathrm dP(x)+e_0,$$

where $e_0\in W$ is arbitrary.
Here the integral is Pettis integral.
The expectation is defined if the Pettis integral is defined,
and it is then well-defined in that it is independent of the $e_0$ we choose.

---

Suppose $X,Y$ are Polish spaces.
Suppose $(Y,\sigma(Y),\mu),(X,\sigma(X),\nu)$ are measure spaces,
where $\mu$ and $\nu$ are &sigma;-finite Borel measures.
Suppose $\pi:Y\to X$ is a measurable map so that

$$\forall A\in\sigma(X):\nu(A)=0\Rightarrow\mu\!\left(\pi^{-1}\!\left(A\right)\right)=0.$$

Then, for each $x\in X$, there exists a Borel measure $\mu_x$
on the measurable subspace $\left(\pi^{-1}(x),\sigma\!\left(\pi^{-1}(x)\right)\right)$,
such that for any integrable function $f$ on $Y$,

$$\int_{y\in Y}f\!\left(y\right)\mathrm d\mu(y)
=\int_{x\in X}\mathrm d\nu(x)\int_{y\in\pi^{-1}(x)}f\!\left(y\right)\mathrm d\mu_x(y).$$

<details markdown="1">
<summary>Proof</summary>

*Proof.*
Because $\mu$ is &sigma;-finite,
we have a countable covering of $Y$
by pairwise disjoint measurable sets of finite $\mu$-measure,
denoted as $\left\{Y_i\right\}$.
Each $Y_i$ is automatically stroke='#currentColor'  and inherits the &sigma;-algebra from $Y$,
and $\left(Y_i,\sigma\!\left(Y_i\right),\mu\right)$ is a measure space.

Define $\pi_i:Y_i\to X$ as the restriction of $\pi$ to $Y_i$,
then $\pi_i$ is automatically a measurable map from $Y_i$ to $X$,
and for any $x\in X$,

$$\pi^{-1}(x)=\bigcup_i\pi_i^{-1}(x),$$

and the terms in the bigcup are pairwise disjoint.

Let $\nu_i$ be a measure on $X$ defined as

$$\nu_i(A)\coloneqq\mu\!\left(\pi_i^{-1}\!\left(A\right)\right).$$

This is a measure because $\pi_i$ is a measurable map.
According to the disintegration theorem, for each $x\in X$, there exists a Borel measure $\mu_{i,x}$
on $Y_i$ such that
for $\nu$-almost all $x\in X$, $\mu_{i,x}$ is concentrated on $\pi_i^{-1}(x)$
(in other words, $\mu_{i,x}\!\left(Y\setminus\pi_i^{-1}(x)\right)=0$);
and for any integrable function $f$ on $Y_i$,

$$\int_{y\in Y_i}f\!\left(y\right)\mathrm d\mu(y)
=\int_{x\in X}\mathrm d\nu_i(x)\int_{y\in\pi_i^{-1}(x)}f\!\left(y\right)\mathrm d\mu_{i,x}(y).$$

From the condition in the original proposition, we can easily prove that
$\nu_i$ is absolutely continuous w.r.t. $\nu$.
Therefore, we have their Radon--Nikodym derivative

$$\varphi_i(x)\coloneqq\frac{\mathrm d\nu_i(x)}{\mathrm d\nu(x)}.$$

For each $x\in X$, define the measure $\mu_x$ on $\pi^{-1}(x)$ as

$$\mu_x(A)\coloneqq\sum_i\varphi_i\!\left(x\right)\mu_{i,x}\!\left(A\cap Y_i\right).$$

This is a well-defined measure because the sets $A\cap Y_i$ are pairwise disjoint,
and $\mu_{i,x}$ is well-defined measure on $Y_i$.

Then, for any integrable function $f$ on $Y$,

$$\begin{align*}
\int_{y\in Y}f\!\left(y\right)\mathrm d\mu(y)
&=\sum_i\int_{y\in Y_i}f\!\left(y\right)\mathrm d\mu(y)\\
&=\sum_i\int_{x\in X}\mathrm d\nu_i(x)\int_{y\in\pi_i^{-1}(x)}f\!\left(y\right)\mathrm d\mu_{i,x}(y)\\
&=\sum_i\int_{x\in X}\varphi_i\!\left(x\right)\mathrm d\nu(x)
\int_{y\in\pi_i^{-1}(x)}f\!\left(y\right)\mathrm d\mu_{i,x}(y)\\
&=\int_{x\in X}\mathrm d\nu(x)\sum_i\int_{y\in\pi_i^{-1}(x)}f\!\left(y\right)\mathrm d\mu_x(y)\\
&=\int_{x\in X}\mathrm d\nu(x)\int_{y\in\pi^{-1}(x)}f\!\left(y\right)\mathrm d\mu_x(y).&\square
\end{align*}$$

</details>

Here, the family of measures $\left\{\mu_x\right\}$ is called
the **disintegration** of $\mu$ w.r.t. $\pi$ and $\nu$.

---

For two vector spaces $\vec W_1,\vec W_2$, we denote $\vec W_1\times\vec W_2$ as the direct sum of them.
Also, rather than calling the new vector space their direct sum,
I prefer to call it the product vector space of them (not to be confused with the tensor product)
so that it is consistent with the notion of
product affine spaces, product measure spaces, product topology, etc.
Those product spaces are all notated by "$\times$" in this article.

Also, "$\vec W_1$" can be an abbreviation of $\vec W_1\times\left\{0_2\right\}$,
where $0_2$ is the zero vector in $\vec W_2$.

---

Suppose $W$ is an affine space associated with the vector space $\vec W$.
For any $A\subseteq W$ and $B\subseteq\vec W$, we denote $A+B$ as
the Minkowski sum of $A$ and $B$, i.e.,

$$A+B\coloneqq\left\{a+b\,\middle|\,a\in A,\,b\in B\right\}.$$

This extends the definition of usual Minkowski sums for affine spaces.

By the way, because of the abbreviating "$\vec W_1$"
meaning $\vec W_1\times\left\{0_2\right\}$ above, we can abuse the notation and write

$$\vec W_1+\vec W_2=\vec W_1\times\vec W_2,$$

where "$+$" denotes the Minkowski sum.
This is true for any two vector spaces $\vec W_1,\vec W_2$ that do not share
a non-trivial vector subspace.

---

In general, it is not necessarily possible to decompose a topology as a product of two topologies.
However, it is always possible for locally convex Hausdorff TVSs.
We can always decompose the topology of a locally convex Hausdorff TVS as the product
of the topologies on a pair of its complementary vector subspaces, one of which is finite-dimensional.
This is true because every finite-dimensional subspace in such a space is topologically complemented.
The complete statement is the following:

Let $\vec W$ be a locally convex Hausdorff TVS.
For any finite-dimensional subspace $\vec W^\parallel$ of $\vec W$,
there is a complement $\vec W^\perp$ of it such that
the topology $\tau\!\left(\vec W\right)$ is the product topology of
$\tau\!\left(\vec W^\parallel\right)$ and $\tau\!\left(\vec W^\perp\right)$.

This decomposition is also valid for affine spaces.
If an affine space $W$ is associated with a locally convex Hausdorff TVS $\vec W$,
then for any finite-dimensional vector subspace $\vec W^\parallel$ of $\vec W$,
we can topologically decompose $W$ into $W^\perp+\vec W^\parallel$.

Because the product topology of subspace topologies is the same as
the subspace topology of the product topology,
we can also decompose $E^\perp+\vec W^\parallel$
as the product topological space of $E^\perp$ and $\vec W^\parallel$
if $E^\perp\subseteq W^\perp$.

Such decompositions are useful because they allow us to disintegrate Borel measures.
If we already have a &sigma;-finite Borel measure on $E^\perp+\vec W^\parallel$
and we can define a &sigma;-finite Borel measure on $\vec W^\parallel$,
then we can define a measure on $E^\perp$ by the disintegrating,
and we guarantees that the disintegration is also &sigma;-finite and Borel.

---

When I want to use multi-index notations, I will use "$\bullet$" to denote the indices.
For example,

$$\Sigma\alpha_\bullet\coloneqq\sum_\bullet\alpha_\bullet.$$

$$\alpha_\bullet\beta_\bullet\coloneqq\sum_\bullet\alpha_\bullet\beta_\bullet.$$

$$\alpha_\bullet^{\beta_\bullet}\coloneqq\prod_\bullet\alpha_\bullet^{\beta_\bullet}.$$

$$\alpha_\bullet!\coloneqq\prod_\bullet\alpha_\bullet!.$$

## Extensive quantities and macrostates

First, I need to point out that the most central state function of a thermal system
is not its energy, but its entropy.
The energy is regarded as the central state function in thermodynamics,
which can be seen from the fundamental equation of thermodynamics

$$\mathrm dU=-p\,\mathrm dV+T\,\mathrm dS+\mu\,\mathrm dN.$$

We also always do the Legendre transformations on the potential function $U$
to get other potential functions instead of doing the transformation on other extensive quantities.
All such practices make us think that $S$ is just some quantity that is similar to $V$ and $N$,
and mathematically we can just regard it as an extensive quantity whose changing is a way of doing work.

However, this is not the case.
The entropy $S$ is different from $U,V,N$ in the following sense:

- The entropy is a derived quantity due to a mathematical construction from the second law of thermodynamics,
while $U,V,N$ are observable quantities
that have solid physical meanings before we introduce anything about thermodynamics.
- The entropy may change in an isolated system, while $U,V,N$ do not.
- We may have an intuitive understanding of how different systems in contact
may exchange $U,V,N$ with each other, but $S$ cannot be "exchanged" in such a sense.
- In statistical mechanics, $U,V,N$ restrict what microstates are possible for a thermal system,
but $S$ serves as a totally different role:
it represents something about the probability distribution over all the possible microstates.

Therefore, I would rather rewrite the fundamental equation of thermodynamics as

$$\mathrm dS=\frac1T\,\mathrm dU+\frac pT\,\mathrm dV-\frac\mu T\,\mathrm dN.$$ {#eq:eq-fundamental}

Equation [@eq:eq-fundamental] embodies how different quantities serve different roles more clearly,
but it becomes vague in its own physical meaning.
Does it mean different ways of changing the entropy in quasi-static processes?
Both mathematically and physically, yes, but it is not a useful interpretation.
Because what we are doing is mathematical formulation of physical theories,
we do not need to try to assign physical meanings to anything we construct.
This new equation is purely mathematical, and the only way we use it is to relate intensive variables
to derivatives of $S$ w.r.t. extensive quantities.

From now on, I will call quantities like $U,V,N$ the **extensive quantities**,
not including $S$.
However, this is not a good statement as part of our mathematical formulation.
Considering that there is a good notion of how different systems
may exchange values of extensive quantities
and that we can scale a system by multiplying the extensive quantities by a factor,
we require that the extensive quantities must support at least linear operations... do we?

Well, actually we will see that if we require a space a vector space, things would be a little bit complex
because sometimes we need to construct a new space of extensive quantities out of the
affine subspace of an existing one, which is not a vector space by nature.
If we require the space to be a vector space, we need to translate that affine subspace
to make it pass through the zero element of the vector space,
which is possible but does not give any insight about the physics except adding complicationg to our construction.
Therefore, I will not require the space of extensive quantities to be a vector space,
but be an affine space.

You may ask, OK then, but how do we "add" or "scale" extensive quantities
if they live one an affine space?
First, regarding the addition operation, we will use an abstraction for such operations
so that the actual implementation about how do we combine the summands is hidden under this abstraction.
We will see that this abstraction is useful because it also applies to other senarios or useful operations
that does not necessarily involve any meaningful addition.
Regarding the scaling operation, I would argue that now we do not need them.
I have generalized the notion of extensive quantities so that now the notion "extensive quantities"
includes some quantities that are not really extensive quantities in any traditional sense.
They are no longer meant to be scaled because they simply cannot.
Actually, rather than calling them extensive quantities, I would like to call them
a **macrostate**, with the only difference from the general notion macrostate being that
it has an affine structure so that I can take the ensemble average of it to get its macroscopic value.
I would stick to the term "extensive quantities" because they are actual extensive quantities in all my examples
and because it is a good way to understand its physical meaning with this name,
but you need to keep in mind that what I actually refer to is a macrostate.

There is another difficulty.
If we look closely, Equation [@eq:eq-fundamental] actually does not make much sense in that
$N$ is quantized (and also $U$ if we are doing quantum).
If we are doing real numbers, we can always translate a quantized quantity to something that is not allowed,
which means that we cannot have the full set of operations on the allowed values
of the extensive quantities.
Therefore, we need to specify a subset on the affine space
to represent the allowed values of the extensive quantities.

We also see that Equation [@eq:eq-fundamental] is a relation between differentials.
Do we need to require that we have differential structure on the space of extensive quantities?
Not yet, because it actually is somehow difficult.
The same difficulty about the quantized quantities applies.
The clever way is to just avoid using the differentials.
(Mathematicians are always skeptical about differentiating something
while physicists just assume everything is differentiable...)
It may seem surprising, but actually differentials are evitable in our mathematical formulation
if you do not require intensive variables to be well-defined inside the system itself
(actually, they are indeed not well-defined except when you have
a system in thermal equilibrium and take the thermaldynamic limit).

If we have to use differentials, we can use the Gateaux derivative.
It is general enough to be defined on any locally convex TVS,
and it is intuitive when it is linear and continuous.

Although differential structure is not necessary,
there is an inevitable structure on the space of extensive quantities.
Remember that in canonical and grand canonical ensembles,
we allow $U$ or $N$ to fluctuate,
so we should be able to describe such fluctuations on our space of extensive quantities.
To do this, I think it is safe to assume that we can have some topology on the allowed subset
to make it a Polish space,
just like how probabilists often assume about the probability space they are working on.

A final point.
Here is a difference in how physicists and mathematicians describe probability distributions:
physicists would use a probability density function while mathematicians would use a probability measure.
Mathematically, to have a probability density function,
we need to have an underlying measure on our space for a notion of "volume" on the space,
and then we can define the probability density function as the
Radon--Nikodym derivative of the probability measure w.r.t. the underlying volume measure.
Also, for t he Radon--Nikodym derivative to exist, the probability measure
must be absolutely continuous w.r.t. the volume measure,
which means that we have to sacrifice all the probability distributions that are not absolutely continuous
to take the probability density function approach.
Then, it seems that if we use the probability density function approach,
we are introducing an excess measure structure on the space of extensive quantities
and losing some possibilities and generalizabilities,
but it would turn out that the extra structure is useful.
Therefore, I will use the probability density function approach.

Here is our final definition of the space of extensive quantities:

*Definition.*
A **space of extensive quantities** is a tuple $(W,E,\lambda)$, where

- $W$ is an affine space associated with a reflexive vector space $\vec W$ over $\mathbb R$,
and it is equipped with topology $\tau(W)$ that is naturally constructed from
the topology $\tau\!\left(\vec W\right)$ on $\vec W$;
- $E\subseteq V$ is a topological subspace of $W$,
and its topology $\tau(E)$ makes $E$ a Polish space; and
- $\lambda:\sigma(E)\to[0,+\infty]$ is a non-trivial &sigma;-finite Borel measure,
where $\sigma(E)\supseteq\mathfrak B(E)$ is a &sigma;-algebra on $E$
that contains the Borel &sigma;-algebra on $E$.

Here, I also added a requirement of &sigma;-finiteness.
This is necessary when constructing product measures.
At first I also wanted to require that $\lambda$ has some translational invariance,
but I then realized that it is not necessary,
so I removed it from the definition
(but we will see that we need them as a property of baths).

*Example.*
Here is an example of a space of extensive quantities.

$$\begin{align*}
W&\coloneqq\mathbb R^3,\\
E&\coloneqq(0,+\infty)\times(0,+\infty)\times\mathbb Z^+,\\
\lambda(A)&\coloneqq\sum_{N\in\mathbb Z^+}\operatorname{area}(A\cap(0,+\infty)\times(0,+\infty)\times\{N\}).
\end{align*}$$

Physically we may think of this as the extensive quantities of the system of ideal gas.
The three dimensions of $W$ are energy, volume, and number of particles.

*Example.*
Here is another example of a space of extensive quantities.

$$\begin{align*}
W&\coloneqq\mathbb R^2,\\
E&\coloneqq\{(3N/2+n,N)\,|\,N\in\mathbb Z^+,n\in\mathbb N\},\\
\lambda(A)&\coloneqq\operatorname{card}A.
\end{align*}$$

Physically we may think of this as the extensive quantities of the system of Einstein solid
with $\hbar\omega=1$.
The two dimensions of $W$ are energy and number of particles.

## Thermal systems and the number of microstates

Remember I said above that, in statistical mechanics,
$U,V,N$ restrict what microstates are possible for a thermal system.
We can translate this as such:
for each possible values of extensive quantities, denoted as $e\in E$,
here is a set of possible microstates, denoted as $M_e$
(you can then see why we excluded the entropy from the extensive quantities:
otherwise we cannot do such a classification of microstates).

Now the problem is what structures should we add to $M_e$ for each $e\in E$.
Recall that in statistical mechanics,
we study probability distribution over all possible microstates.
Therefore, we need to be able to have a probability measure on $M_e$.
In other words, $M_e$ should be a measurable space.
As said before, we can either use a probability measure directly,
or use a volume measure together with a probability density function.
This time, we seem to have no choice but the probability density function approach
because there is a natural notion of volume on $M_e$: the number of microstates.

Wait! There is a problem.
Recall that in microcanonical ensemble,
we allow the energy to fluctuate.
The number of microstates at exactly a certain energy is actually zero in most cases,
so we are actually considering those microstates with some certain small range of energy.
In other words, we are considering the **microstate density**:
the number of microstates inside unit range of energy.
Similarly, we should define a measure on $M_e$ to represent the microstate density,
which is the number of microstates inside unit volume of extensive quantities,
where the "volume" is measured by the measure $\lambda$ in the space of the extensive quantities.

This makes our formulation a little bit different from the microcanonical ensemble:
our formulation would allow all extensive quantities to fluctuate
while the microcanonical ensemble would only allow the energy to fluctuate.
This is inevitable because we are treating extensive quantities like energy, volume, and number of particles
as the same kind of quantity.
It is not preferable to separate a subspace out from our affine space $W$ to say
"these are the quantities that may fluctuate, and those are not."
Therefore, we need to justify why we may allow all extensive quantities to fluctuate.
The justification is:
mathematically, we are actually not allowing any extensive quantities to fluctuate.
There is no actual fluctuation, and we are directly considering the microstate density
without involving any change in the extensive quantities.
In other words, using the language of microcanonical ensemble,
we are considering the area of the surface of the energy shell
instead of the volume of the energy shell with a small thickness.

Another important point is that we must make sure that
specifying all the extensive quantities should be enough to restrict the system
to finite number of microstates.
In other words, the total microstate density should be finite for any possible $e\in E$.
Also, there should be at least some possible microstates in $M_e$,
so the total microstate density should not be zero.

We may them sum up the above discussion to give $M_e$ enough structure to make it
the set of microstates of a thermal system with the given extensive quantities $e$.
Then, the disjoint union of all of them (the family of measure spaces) is the thermal system.

*Definition.*
A **thermal system** is a pair $\left(\mathcal E,\mathcal M\right)$,
where

- $\mathcal E\coloneqq\left(W,E,\lambda\right)$ is a space of extensive quantities;
- $\mathcal M\coloneqq\bigsqcup_{e\in E}M_e$ is a family of measure spaces; and
- For each $e\in E$, $M_e$ is a measure space equipped with a measure $\mu_e$ such that
$\mu_e\!\left(M_e\right)$ is finite and nonzero.

From now on, I will use a pair $(e,m)\in\mathcal M$ to specify a single microstate,
where $e\in E$ and $m\in M_e$.

---

*Example.*
For the thermal system of a solid consisting of spin-$\frac12$ particles,
where each particle has two possible states with energy $0$ and $1$,
we can construct

$$\begin{align*}
W&\coloneqq\mathbb R^2,\\
E&\coloneqq\left\{\left(U,N\right)\in\mathbb N\times\mathbb Z^+\,\middle|\,U\le N\right\},\\
\lambda(A)&\coloneqq\operatorname{card}A,\\
M_{U,N}&\coloneqq\left\{n\in\left\{0,1\right\}^N\,\middle|\,\sum_in_i=U\right\},\\
\mu_{U,N}(A)&\coloneqq\operatorname{card}A.
\end{align*}$$

This should be the simplest example of a thermal system.

*Example.*
We may complete the example of the system of ideal gas.
Suppose we are considering the system of ideal atomic gas inside a cubic box.
The construction of the space of extensive quantities is the same as before.
Denote possible values of extensive quantities in coordinates $e=(U,V,N)$.
Now the measure spaces $M_e$ may be constructed as such:

$$\begin{align*}
M_{U,V,N}&\coloneqq\left\{\left(\ldots\right)\in
\left(\left[0,\sqrt[3]V\right]^3\times\mathbb R^3\right)^N
\,\middle|\,\text{lexicographic order, }\sum_i\frac{\left|\mathbf p_i\right|^2}{2m}=U\right\},\\
\mu_{U,V,N}(A)&\coloneqq\frac{H^{6N-1}(A)}{h^{3N}}.
\end{align*}$$

The "lexicographic order" here means that only those configurations where
particle indices coincides with the lexicographic order are included in $M_e$.
This is because the particles are indistinguishable, and the order of particles is irrelevant.
The lexicographic order restriction is the same as using the quotient of the $N$-fold Cartesian product
by permutation actions,
but then defining $\mu_e$ would be difficult.
Alternatively, we may still make them ordered, but divide the result by $N!$ in the definition of $\mu_e$,
but this way is less clear in its physical meaning.

Here $H^d$ is the $d$ dimensional Hausdorff measure.
To understand, the expression $H^{6N-1}(A)$ is just the $(6N-1)$-dimensional "volume" of $A$.

---

Since we have microstate density, why do not we have the true **number of microstates**?
We can define a measure on $\mathcal M$ to represent the number of microstates.

*Definition.*
The **measure of number of microstates** is a measure $\mu:\sigma(\mathcal M)\to\left[0,+\infty\right]$,
where

$$\sigma(\mathcal M)\coloneqq\left\{\bigsqcup_{e\in A}B_e\,\middle|\,A\in\sigma(E),\,B_e\in\sigma(M_e)\right\},$$

and the measure is defined by

$$\mu(A)\coloneqq\iint\limits_{(e,m)\in A}\mathrm d\mu_e(m)\,\mathrm d\lambda(e).$$

The uniqueness of $\mu$ is guaranteed by the &sigma;-finiteness of $\lambda$ and $\mu_e$.
The expression $\mu(A)$ is called the **number of microstates** in $A$.

## States and the entropy

Here is a central idea in statistical ensembles:
a **state** is a probability distribution on the microstates of a thermal system.
It is among the ideas upon which the whole theory of statistical ensembles is built.
I will take this idea, too.

As said before, I have taken the probability density approach of defining a probability distribution.
Therefore, a state is just a probability density function.

*Definition.*
A **state** of a thermal system $(\mathcal E,\mathcal M)$ is a function
$p:\mathcal M\to\left[0,+\infty\right]$ such that $(\mathcal M,\sigma(\mathcal M),P)$ is a probability space,
where $P:\sigma(\mathcal M)\to\left[0,1\right]$ is defined by

$$P(A)\coloneqq\int_Ap\,\mathrm d\mu.$$ {#eq:eq-probability-measure}

Two states are the same if they are equal $\mu$-almost everywhere.

A probability space is just a measure space with a normalized measure,
and here the physical meaning of $p$ is the probability density on $\mathcal M$,
and $P(A)$ is the probability of finding a microstate in $A$.

Note that a state is not necessarily an equilibrium state (thermal state).
We will introduce the concept of equilibrium states later.

---

Now we may introduce the concept of **entropy**.

I need to clarify that the entropy that we are talking about here is just
the entropy in statistical mechanics.
The reason I add this clarification is that we may also formally define an entropy
in the language of measure theory,
which is defined for any probability space
and does not depend on any so-called probability density function
or a "volume" measure (which is the number of microstates in our case).
The definition of this entropy is (if anyone is interested)

$$S^{\mathrm{info}}\coloneqq\sup_\Pi\sum_{A\in\Pi}-P(A)\ln P(A),$$

where $P$ is the probability measure on the probability space,
and the supremum is taken over all $P$-almost partition $\Pi$ of the probability space
($\Pi$ is a subset of the &sigma;-algebra so that
$P(\bigcup_{A\in\Pi}A)=1$ and $P(A\cap B)=0$ for $A,B\in\Pi$).
This definition looks intuitive and nice, and not surprisingly
it is... not consistent with the entropy in statistical mechanics.
The discrepancy happens when we are doing classical statistical mechanics
because the entropy defined above will diverge to infinity for those "continuous" probability distributions.
A quick check is that the entropy of the uniform distribution over $[0,1]$ is $+\infty$.

*Definition.*
The **entropy** of a state $p$ is defined by

$$S[p]\coloneqq\int_\mathcal M-p\ln p\,\mathrm d\mu.$$

Different from extensive quantities, the entropy is a functional of $p$.
The entropy here is consistent with the entropy in thermodynamics or statistical mechanics.

This definition of entropy is called the Gibbs entropy formula.
It agrees with the entropy defined in thermodynamics,
but we are unable to show that at this stage because we have not defined temperature or heat yet.

Note that the base of the logarithm is not important,
and it is just a matter of unit system.
In SI units, the base would be $\exp k_\mathrm B^{-1}$,
where $k_\mathrm B$ is the Boltzmann constant.

---

Physically, the extensive quantities may be measured macroscopically.
The actual values that we get when we measure them are postulated to be the ensemble average.
Therefore, for a given state $p$, we can define the measured values of extensive quantities
by taking the $P$-expectation of the extensive quantities.

*Definition.*
For a thermal system $(\mathcal E,\mathcal M)$
and a state $p$ of it, the **measured value of extensive quantities** of the state $p$ is
the $P$-expectation of the $E$-valued random variable $(e,m)\mapsto e$.
Explicitly, the definition is

$$\varepsilon[p]\coloneqq\mathrm E_P\!\left[\left(e,m\right)\mapsto e\right],$$

where the probability measure $P$ on $\mathcal M$ is defined in Equation [@eq:eq-probability-measure].

In the definition, it involves taking the $P$-expectation of a $W$-valued function.
This involves doing a Pettis integral, which I claim to exist.
It exists because the map $(e,m)\mapsto e-e_0$ must be weakly $P$-measurable,
and such a function must be Pettis-integrable on a reflexive space.

Note that $\varepsilon[p]\in W$, and it is not necessarily in $E$.

The usage of the measured value of extensive quantities is that we can use it to get the
**fundamental equation** of a thermal system,
which describes the relationship between the extensive quantities and the entropy
at any equilibrium state.
Suppose that we postulate a family of states $p_t^\circ$ of the thermal system
(or its slices, which will be introduced below),
labeld by different $t$'s, and call them the possible equilibrium states.
Then, we can have the following two equations:

$$\begin{cases}
S^\circ=S\!\left[p_t^\circ\right],\\
\varepsilon^\circ=\varepsilon\!\left[p_t^\circ\right].
\end{cases}$$ {#eq:eq-fundamental-equation-before}

By cancelling out the $t$ in the two equations (which may be impossible but assumed to be possible),
we can get the fundamental equation in this form:

$$S^\circ=S^\circ\!\left(\varepsilon^\circ\right).$$ {#eq:eq-fundamental-equation}

Then, here we get the function $S^\circ:E^\circ\to\mathbb R$, where $E^\circ$ is a subset of $W$
consisting of all possible measured values of extensive quantities among equilibrium states.
If we can possibly define some differential structure on $E^\circ$
so that we can possibly take the differential of $S^\circ$ and write something sensible like

$$\mathrm dS^\circ=i\!\left(\varepsilon^\circ\right)(\mathrm d\varepsilon^\circ),$$

where $i^\circ\!\left(\varepsilon^\circ\right)\in\vec W'$ is a continuous linear functional,
then we can define $i^\circ\!\left(\varepsilon^\circ\right)$ to be the **intensive quantities**
at $\varepsilon^\circ$.
A proper comparison with differential geometry is that we may analogly call $i^\circ$
be a covector field on $E^\circ$ defined as the differential of the scalar field $S^\circ$.

However, as I have said before, I did not postulate there to be any differential structure on $E^\circ$,
so the intensive quantities should not be generally defined in this way.

## Slicing

A good notion about thermal systems is that we can get new thermal systems from existing ones
(although they are physically essentially the same system,
they have different mathematical structure and contain different amount of information about them).
There are two ways of constructing new thermal systems from existing ones:

- By fixing some extensive quantities.
I call this way **slicing**.
- By allowing some extensive quantities to change freely.
I call this way **contracting**.

I chose the words "slicing" and "contracting".
They are not present in actual physics textbooks, but I found the notion of them necesesary.

Slicing fixes extensive quantities.
How we do it is to pick out a subset of $E$ and make it our new accessible values of extensive quantities.
I find a special way of picking out such a subset is especially useful:
picking it from an affine subspace of $W$.
In this way, we can use a smaller affine space as the underlying space of our new thermal system.
Then we see why I chose the word "slicing":
we are slicing the original affine space into parallel pieces,
and picking one piece as our new affine space,
and picking the corresponding accessible values of extensive quantities and possible microstates
within that piece to form our new thermal system.

*Definition.*
A **slicing** of a space of extensive quantities $\left(W,E,\lambda\right)$
is a pair $\left(W^\parallel,\lambda^\parallel\right)$, where

- $W^\parallel\subseteq W$ is an affine subspace of $W$;
- $E^\parallel\coloneqq E\cap W^\parallel$ is non-empty, and it is Polish as a topological subspace of $E$; and
- $\lambda^\parallel:\sigma\!\left(E^\parallel\right)\to\left[0,+\infty\right)$
is a non-trivial &sigma;-finite Borel measure on $E^\parallel$, where
$\sigma\!\left(E^\parallel\right)\subseteq\mathfrak B\!\left(E^\parallel\right)$
is a &sigma;-algebra on $E^\parallel$ that contains the Borel &sigma;-algebra on $E^\parallel$.

This constructs a new space of extensive quantities $\left(W^\parallel,E^\parallel,\lambda^\parallel\right)$,
called a **slice** of the original space of extensive quantities $\left(W,E,\lambda\right)$.

*Definition.*
A **slice** of a thermal system $\left(\mathcal E,\mathcal M\right)$
defined by the slicing $\left(W^\parallel,\lambda^\parallel\right)$ of $\mathcal E$
is a new thermal system $\left(\mathcal E^\parallel,\mathcal M^\parallel\right)$ constructed as such:

- $\mathcal E^\parallel\coloneqq\left(W^\parallel,E^\parallel,\lambda^\parallel\right)$ is the slice of $\mathcal E$
corrsponding to the given slicing; and
- $\mathcal M^\parallel\coloneqq\bigsqcup_{e\in E^\parallel}M_e$.

The idea behind slicing is to make some extensive quantities become extrinsic parameters
and not part of the system itself.
It would physically mean fixing some extensive quantities.
However, here is a problem: if we fix some extensive quantities,
the dimension ("dimension" as in "dimensional analysis")
of the volume element in the space of extensive quantities would be changed.
In other words, the dimension of $\lambda$ does not agree with $\lambda^\parallel$.
This is physically not desirable because we want to keep the number of microstates dimensionless
so that its logarithm does not depend on the units we use.
However, this is not a problem because here is an argument:
in any physical construction of a thermal system,
it is fine to have non-dimensionless number of microstates,
the cost is that the model must not be valid under low temperature;
in mathematical construction, dimension is never a thing, so we do not even need to worry about it.
In low temperature, we must use quantum statistical mechanics,
where all quantities are quantized so that the number of microstates is literally the number of microstates,
which must be dimensionless.
In high temperature, we do not need the third law of thermodynamics,
which is the only law that restricts how we should choose the zero (ground level) of the entropy,
and in this case we may freely change our units because it only affects the entropy by an additive constant.

*Example.*
In the example of a system of ideal gas,
we may slice the space of extensive quantities to the slice $V=1$ to fix the volume.

## Isolations and the microcanonical ensemble

Here is a special type of slicing.
Because a single point is an (zero-dimensional) affine subspace, it may form a slicing.
Such a slicing fixes all of the extensive quantities.
We may call it an **isolating**.

A thermal system with a zero-dimensional space of extensive quantities is called an **isolated system**.
The physical meaning of such a system is that it is isolated from the outside
so that it cannot exchange any extensive quantities with the outside.
We may construct an isolated system out of an existing thermal system by the process of isolating.

*Definition.*
An **isolating** (at $e^\circ$) of a space of extensive quantities $\left(W,E,\lambda\right)$
is a slicing $\left(W^\parallel,\lambda^\parallel\right)$ of it, constructed as

$$\begin{align*}
W^\parallel&\coloneqq\left\{e^\circ\right\},\\
\lambda^\parallel(A)&\coloneqq\begin{cases}1,&A=\left\{e^\circ\right\},\\0,&A=\varnothing,\end{cases}
\end{align*}$$

where $e^\circ\in E$.

*Definition.*
An **isolated system** is a thermal system whose underlying affine space of its space of extensive quantities
is a single-element set.

*Definition.*
An **isolation** (at $e$) of a thermal system $\left(\mathcal E,\mathcal M\right)$
is the slice of it corresponding to the isolation at $e^\circ$ of $\mathcal E$.

Here is an obvious property of isolated systems:
the measured value of extensive quantities of any state of an isolated system
is $e^\circ$, the only possible value of the extensive quantities.

---

After introducing isolated systems,
we can now introduce the **equal a priori probability postulate**.
Although we may alternatively use other set of axioms to develop the theory of statistical ensembles,
using the equal a priori probability postulate is a simple and traditional way to do it.
Most importantly, this is a way that does not require us to define concepts like the temperature
beforehand, which is a good thing for a mathematical formulation because it would require
less mathematical structures or objects that are hard to well define at this stage.

*Axiom* (the **equal a priori probability postulate**).
The equilibrium state of an isolated system is the uniform distribution.

Actually, instead of saying that this is an axiom, we may say that formally this is a definition of
equilibrium states.
However, I still prefer to call it an axiom because it only defines the equilibrium state of isolated systems
rather than any thermal systems.

The equilibrium state of an isolated system $\left(\mathcal E,\mathcal M\right)$
may be written mathematically as

$$p^\circ\!\left(\cdot\right)\coloneqq\frac1{\mu\!\left(\mathcal M\right)}.$$

(The circle in the superscript denotes equilibrium state.)
After writing this out, we have successfully derived the **microcanonical ensemble**.
We can then calculate the entropy of the state, which is

$$S^\circ\coloneqq S\!\left[p^\circ\right]=\ln\mu(\mathcal M).$$ {#eq:eq-microcanonical-entropy}

Mentioning the entropy, a notable feature about
the equilibrium state of an isolated system is that
it is the state of the system that has the maximum entropy,
and any state different from it has a lower entropy.

*Theorem.*
For an isolated system, for any state $p$ of it,

$$S[p]\le S^\circ,$$

where $S^\circ$ is the entropy of the equilibrium state of it.
The equality holds iff $p$ is the same state as the equilibrium state.

<details markdown="1">
<summary>Proof</summary>

*Proof.*
Define a probability measure $P^\circ$ on $\mathcal M$ by

$$P^\circ(A)\coloneqq\frac{\mu(A)}{\mu(\mathcal M)},$$

then $\left(\mathcal M,\sigma\!\left(\mathcal M\right),P^\circ\right)$ is a probability space.
Any state $p$, as a function on $\mathcal M$, can be regarded as a random variable
in the probability space $\left(\mathcal M,\sigma\!\left(\mathcal M\right),P^\circ\right)$.

Define the real function

$$\varphi(x)\coloneqq\begin{cases}
x\ln x,&x\in\left(0,+\infty\right),\\
0,&x=0.
\end{cases}$$

It is a convex function, so according to the probabilistic form of Jensen's inequality,

$$\varphi\!\left(\mathrm E_{P^\circ}\!\left[p\right]\right)
\le\mathrm E_{P^\circ}\!\left[\varphi\circ p\right].$$

In other words,

$$\frac1{\mu(\mathcal M)}\ln\frac1{\mu(\mathcal M)}
\le\int_{m\in\mathcal M}p\!\left(m\right)\ln p\!\left(m\right)
\,\frac{\mathrm d\mu\!\left(m\right)}{\mu(\mathcal M)}.$$

Then, it follows immediately that $S[p]\le S^\circ$.
The equality holds iff $\varphi$ is linear on a convex set $A\subseteq\left[0,+\infty\right)$
such that the value of the random variable $p$ is $P^\circ$-almost surely in $A$.
However, because $\varphi$ non-linear on any set with more than two points,
the only possibility is that the value of $p$ is $P^\circ$-almost surely a constant,
which means that the probability distribution defined by the probability density function $p$
is equal to the uniform distribution $\mu$-almost everywhere.
Therefore, the equality holds iff $p$ is the same state as the equilibrium state.
$\square$

</details>

This theorem is the well-known relation between the entropy and the equilibrium state.

---

By Equation [@eq:eq-microcanonical-entropy],
we can now derive the relationship between the entropy and the extensive quantities
at equilibrium states by the process of isolating.
Define a family of states $\left\{p^\circ_e\right\}_{e\in E}$,
where each state $p^\circ_e$ is the equilibrium state of the system isolated at $e$.
Then, we have the fundamental equation

$$S^\circ(e)=\ln\Omega(e),$$ {#eq:eq-mce-fundamental-eq}

where $\Omega(e)\coloneqq\ln\mu_e\!\left(M_e\right)$ is called the **counting function** (I invented the phrase),
which is the **microscopic characteristic function** of microcanonical ensembles.
This defines a function $S^\circ:E\to\mathbb R$,
which may be used to give a fundamental equation in the form of Equation [@eq:eq-fundamental-equation],
and it is the **macroscopic characteristic function** of microcanonical ensembles.

We will encounter microscopic or macroscopic characteristic functions for other ensembles later.

*Example.*
In the example of a system of a tank of ideal atomic gas, we have the fundamental equation

$$S^\circ=\ln\!\left(\frac1{h^{3N}N!}V^NS_{3N-1}\!\left(\sqrt{2mU}\right)\right),$$

where $S_n(r)$ is the surface area of an $n$-sphere with radius $r$, which is proportional to $r^n$.
Taking its derivative w.r.t. $U,V,N$ and taking the thermodynamic limit will recover familiar results.

## Contracting

I have previously mentioned that the other way of deriving a new system out of an existing one
is called contracting.
Now we should introduce this concept because it is very useful later
when we need to define the contact between subsystems of a composite system
(whose definition will be given later).

The idea behind contracting is also to reduce the dimension of the space of extensive quantities.
However, rather than making some of the extensive quantities extrinsic parameters,
it makes them "intrinsic" within the space of microstates.
A vivid analogy is this:
imagine a thermal system as many boxes of microstates with each box labeled by
specific values of extensive quantities,
then we partition those boxes to classify them,
and put all the boxes in each partition into one larger box.
The new set of larger boxes are labeled by a specific values of fewer extensive quantities,
and it is the so-called contraction of the origional set of boxes.

I call it contracting because it is like contracting the affine space of extensive quantities
into a flat sheet of its subspace.
The way we do this should be described by a projection.
A projection in affine space maps the whole space into one of its affine subspace,
and the preimage of each point in the subspace is another affine subspace of the original space.
The preimages forms a family of parallel affine subspaces labeled by their image under the projection.
The family of affine subspaces may be used to define a family of slices of
the space of extensive quantities or the thermal system, which are useful when defining the
contraction of the space of extensive quantities or the system.

*Definition.*
A **contracting** of a space of extensive quantities $\left(W,E,\lambda\right)$
is given by a tuple $\left(\pi,\lambda^\perp\right)$, where

- $\pi:W\to W^\perp$ is a projection map from $W$ to an affine subspace $W^\perp$ of $W$;
- $E^\perp\coloneqq\pi(E)$, the image of $E$ under $\pi$, is equipped with the minimal topology
$\tau\!\left(E^\perp\right)$ so that $\pi$ is continuous,
and the topology makes $E^\perp$ Polish;
- $\lambda^\perp:\sigma\!\left(E^\perp\right)\to\left[0,+\infty\right]$
is a non-trivial &sigma;-finite Borel measure on $E^\perp$,
where $\sigma\!\left(E^\perp\right)\supseteq\mathfrak B\!\left(E^\perp\right)$
is a &sigma;-algebra of $E^\perp$ that contains the Borel &sigma;-algebra of $E^\perp$; and
- For any $A\in\sigma\!\left(E^\perp\right)$,
$\lambda^{\perp}(A)=0$ iff $\lambda\!\left(\pi^{-1}(A)\right)=0$.

This contracting defines a new space of extensive quantities
$\left(W^\perp,E^\perp,\lambda^\perp\right)$, called a **contraction** of
the original space of extensive quantities $\left(W,E,\lambda\right)$.

*Definition.*
The **contractive slicings** of a space of extensive quantities $\left(W,E,\lambda\right)$
defined by a contracting $\left(\pi,\lambda^\perp\right)$ of it is a family of slicings
$\bigsqcup_{e\in W^\perp}\left(W^\parallel_e,\lambda^\parallel_e\right)$, where

- $W^\parallel_e\coloneqq\pi^{-1}(e)$ is the preimage of $\left\{e\right\}$ under $\pi$,
an affine subspace of $W$; and
- $\lambda_e^\parallel:\sigma\!\left(E_e^\parallel\right)\to\left[0,+\infty\right]$ is a Borel measure;
the family of measures is the disintegration of $\lambda$ w.r.t. $\pi$ and $\lambda^\perp$.

*Definition.*
A **contraction** of a thermal system $\left(\mathcal E,\mathcal M\right)$
defined by the contracting $\left(\pi,\lambda^\perp\right)$ of $\mathcal E$
is a new thermal system $\left(\mathcal E^\perp,\mathcal M^\perp\right)$ constructed as such:

- $\mathcal E^\perp\coloneqq\left(W^\perp,E^\perp,\lambda^\perp\right)$
is the contraction of $\mathcal E$ corresponding to the given contracting;
- $\mathcal M^\perp\coloneqq\bigsqcup_{e\in E^\perp}M_e^\perp$,
where for each $e\in E^\perp$, $M_e^\perp\coloneqq\mathcal M_e^\parallel$;
the family of systems $\left(\mathcal E_e^\parallel,\mathcal M_e^\parallel\right)$
(labeled by $e\in E^\perp$)
are slices of $\left(\mathcal E,\mathcal M\right)$ corresponding to the contractive slicings
of $\mathcal E$ defined by the contracting $\left(\pi,\lambda^\perp\right)$;
the measure equipped on $\mathcal M_e^\parallel$ is the measure of number of microstates
of $\left(\mathcal E_e^\parallel,\mathcal M_e^\parallel\right)$.

In some cases, the total number of microstates in $\mathcal M^\parallel_e$ is not finite for some $e$,
then the contraction is not defined in this case.

*Example.*
For the thermal system of a solid consisting of spin-$\frac12$ particles,
define a constracting $\left(\pi,\lambda^\perp\right)$ by

$$\begin{align*}
\pi\!\left(U,N\right)&\coloneqq N,\\
\lambda^\perp\!\left(A\right)&\coloneqq\operatorname{card}A.
\end{align*}$$

Then the corresponding contraction of the thermal system may be written as
a thermal system $\left(\left(W,E,\lambda\right),\bigsqcup_{e\in E}M_e\right)$, where

$$\begin{align*}
W&\coloneqq\mathbb R,\\
E&\coloneqq\mathbb Z^+,\\
\lambda\!\left(A\right)&\coloneqq\operatorname{card}A,\\
M_N&\coloneqq\left\{0,1\right\}^N,\\
\mu_N\!\left(A\right)&\coloneqq\operatorname{card}A.
\end{align*}$$

---

Different from a slice of a system,
a contraction of a system does not have the problem about the dimension
("dimension" as in "dimensional analysis") of the measure on the space of extensive quantities.
Although the dimension of $\lambda^\perp$ is different from $\lambda$,
the dimension of $\mu^\perp_e$ (the measure on $M^\perp_e$)
is also different from $\mu$,
and they change together in such a way that the resultant $\mu^\perp$
(the measure of number of microstates on $\mathcal M^\perp$) has the same dimension as $\mu$.

This fact actually hints us that
a contraction of a thermal system is essentially the same as the original thermal system
in such a sense that the microstates in the two systems are naturally one-to-one connected.
Indeed, the natural bijection from $\mathcal M$ to $\mathcal M^\perp$ is given by
$\left(e,m\right)\mapsto\left(\pi(e),\left(e,m\right)\right)$.
It is obvious that for any measurable function $f$ on $\mathcal M^\perp$ we have

$$\int_{\left(e,m\right)\in\mathcal M}f\!\left(\pi(e),(e,m)\right)\mathrm d\mu(e,m)
=\int_{\left(e,m\right)\in\mathcal M^\perp}f\!\left(e,m\right)\mathrm d\mu^\perp(e,m).$$

Using this map, we can pull back any function $f^\perp$ on $\mathcal M^\perp$
to become a function on $\mathcal M$ by

$$f\!\left(e,m\right)\coloneqq f^\perp\!\left(\pi(e),\left(e,m\right)\right)$$

and the other way around.
I want to call $f$ the **contractional pullback** of $f^\perp$ under $\pi$
and call $f^\perp$ the **contractional pushforward** of $f$ under $\pi$.
Specially, we may pull back any state $p^\perp$ of a contraction
to become a state $p$ on the original thermal system.
We will see that pullbacks of states are rather useful.

---

Obviously, the family of affine subspaces $\left\{W^\parallel_e\right\}_{e\in W^\perp}$
are parallel to each other.
Therefore, their associated vector subspaces are the same vector subspace $\vec W^\parallel$ of $\vec W$,
which is a complement of the vector subspace $\vec W^\perp$,
the vector space that $W^\perp$ is associated with.
We can write

$$\vec W=\vec W^\perp+\vec W^\parallel,\quad W=W^\perp+\vec W^\parallel.$$

Each point in $W$ can be written in the form of $e+s$, where $e\in W^\perp$ and $s\in\vec W^\parallel$.
Furthermore, for any $e\in W^\perp$, the map $s\mapsto e+s$ is a bijection
from $\vec W^\parallel$ to $W^\parallel_e$.
This bijection can then push forward linear operations from $\vec W^\parallel$ to $W^\parallel_e$.
For example, we can define the action of some continuous linear functional $i\in\vec W^{\parallel\prime}$
on a point $e'\in W^\parallel_e$ as

$$i\!\left(e'\right)\coloneqq i\!\left(e'-\pi\!\left(e'\right)\right),$$ {#eq:eq-linear-op-on-affine}

where $\pi\!\left(e'\right)$ is just $e$.

However, we need to remember that
there is no generally physically meaningful linear structure on $W^\parallel_e$.
The linear structure that we have constructed is just for convenience in notations.

---

An interesting fact about slicing, isolating, and contracting is that:
an isolation of a contraction is a contraction of a slice.

Suppose we have a thermal system $\left(\mathcal E,\mathcal M\right)$,
and by a contracting $\left(\pi,\lambda^\perp\right)$ we derive its contraction
$\left(\mathcal E^\perp,\mathcal M^\perp\right)$.

Now, consider one of its contractive slices
$\left(\mathcal E^\parallel_{e^\circ},\mathcal M^\parallel_{e^\circ}\right)$,
where $e^\circ\in E^\perp$.
Then, we contract this slice by the contracting $\left(\pi,\lambda^{\perp\prime}\right)$,
where $\pi$ is the same $\pi$ as used above but whose domain is restricted to $W^\parallel_{e^\circ}$,
and $\lambda^{\perp\prime}$ is the counting measure.
Because the whole $W^\parallel_{e^\circ}$ is mapped to $e^\circ$ under $\pi$,
the contraction becomes an isolated system whose only possible value of extensive quantities is $e^\circ$.
Its spaces of microstates consist of only one measure space, which is $\mathcal M^\parallel_{e^\circ}$.

On the other hand, consider isolating $\left(\mathcal E^\perp,\mathcal M^\perp\right)$ at $e^\circ$.
Its isolation at $e^\circ$ is an isolated system whose only possible value of extensive quantities is $e^\circ$.
Its spaces of microstates consist of only one measure space, which is $M^\perp_{e^\circ}$,
which is the same as $\mathcal M^\parallel_{e^\circ}$.

Therefore, an isolation of a contraction is a contraction of a slice.

This fact is useful because it enables us to find the equilibrium state of a slice.
Using microcanonical ensemble, we can already find the equilibrium state of any isolated system,
so we can find the equilibrium state of an isolation of a contraction.
Then, it is the equilibrium state of a contraction of a slice.
Then, by the contractional pullback, it is the equilibrium state of a slice.

## Thermal contact

Composite systems are systems that are composed of other systems.
This is a useful concept because it allows us to treat multiple systems as a whole.
The motivation of develop this concept is that we should use it to derive
the canonical ensemble and the grand canonical ensemble.
In those ensembles, the system is not isolated but in contact with a bath.
To consider them as a whole system, we need to define composite systems.

The simplest case of a composite system is where
the subsystems are independent of each other.
Physically, this means that the subsystems do not have any thermodynamic contact between each other.
I would like to call the simplest case a **product thermal system**
just as how mathematicians name their product spaces constructed out of existing spaces.

*Definition.*
The **product space of extensive quantities** of two spaces of extensive quantities
$\left(W^{(1)},E^{(1)},\lambda^{(1)}\right)$ and $\left(W^{(2)},E^{(2)},\lambda^{(2)}\right)$
is a space of extensive quantities $\left(W,E,\lambda\right)$ constructed as such:

- $W\coloneqq W^{(1)}\times W^{(2)}$ is the product affine space of $W^{(1)}$ and $W^{(2)}$;
- $E\coloneqq E^{(1)}\times E^{(2)}$ is the product topological space as well as the product measure space
of $E^{(1)}$ and $E^{(2)}$; and
- $\lambda$ is the product measure of $\lambda^{(1)}$ and $\lambda^{(2)}$,
whose uniqueness is guaranteed by the &sigma;-finiteness of $\lambda^{(1)}$ and $\lambda^{(2)}$.

*Definition.*
The **product thermal system** of two thermal systems
$\left(\mathcal E^{(1)},\mathcal M^{(1)}\right)$ and $\left(\mathcal E^{(2)},\mathcal M^{(2)}\right)$
is a thermal system $\left(\mathcal E,\mathcal M\right)$ constructed as such:

- $\mathcal E\coloneqq\left(W,E,\lambda\right)$ is the product space of extensive quantities
of $\mathcal E^{(1)}$ and $\mathcal E^{(2)}$; and
- $\mathcal M\coloneqq\bigsqcup_{(e_1,e_2)\in E}M_{e_1,e_2}$,
where $M_{e_1,e_2}\coloneqq M^{(1)}_{e_1}\times M^{(2)}_{e_2}$
is the product measure space of $M^{(1)}_{e_1}$ and $M^{(2)}_{e_2}$,
equipped with measure $\mu_{e_1,e_2}$,
the product measure of $\mu^{(1)}_{e_1}$ and $\mu^{(2)}_{e_2}$.

By this definition, $\mathcal M$ is naturally identified with $\mathcal M^{(1)}\times\mathcal M^{(2)}$,
and the measure of number of microstates $\mu$ on $\mathcal M$ is in this sense
the same as the product measure of $\mu^{(1)}$ and $\mu^{(2)}$
(the measures of number of microstates on $\mathcal M^{(1)}$ and $\mathcal M^{(2)}$).
We can project elements in $\mathcal M$ back into $\mathcal M^{(1)}$ and $\mathcal M^{(2)}$
by the map $(e_1,e_2,m_1,m_2)\mapsto(e_1,m_1)$ and the map $(e_1,e_2,m_1,m_2)\mapsto(e_2,m_2)$.

This hints us that a probability distribution on $\mathcal M$
(which may be given by a state $p$ of $(\mathcal E,\mathcal M)$)
can be viewed as a joint probability distribution of the two random variables on $\mathcal M$:
$(e_1,e_2,m_1,m_2)\mapsto(e_1,m_1)$ and $(e_1,e_2,m_1,m_2)\mapsto(e_2,m_2)$.
As we all know, a joint distribution encodes conditional distributions and marginal distributions.
Therefore, given any state of a product thermal system,
we can define its **conditional states** and **marginal states** of the subsystems.
Conditional states are not very useful because they are not physically observed states of subsystems.
The physically observed states of subsystems are marginal states,
so marginal states are of special interest.

*Definition.*
Given a state $p$ of the product thermal system $(\mathcal E,\mathcal M)$
of $\left(\mathcal E^{(1)},\mathcal M^{(1)}\right)$ and $\left(\mathcal E^{(2)},\mathcal M^{(2)}\right)$,
its **marginal state** of the subsystem $\left(\mathcal E^{(1)},\mathcal M^{(1)}\right)$
is a state $p^{(1)}$ of the system $\left(\mathcal E^{(1)},\mathcal M^{(1)}\right)$ defined by

$$p^{(1)}\!\left(e_1,m_1\right)\coloneqq\int_{\left(e_2,m_2\right)\in\mathcal M^{(2)}}
p\!\left(e_1,e_2,m_1,m_2\right)\mathrm d\mu^{(2)}\!\left(e_2,m_2\right).$$

Physically, if a product thermal system is in equilibrium,
then each of its subsystems is in equilibrium as well.
Therefore, if $p^\circ$ is an equilibrium state of the product thermal system,
then the marginal states of $p^\circ$ are equilibrium states of the subsystems.

---

Now, we need to consider how to describe the thermodynamic contact between subsystems.
In the simplest case, where there is no thermodynamic contact between subsystems,
the composite system is just the product thermal system of the subsystems,
and the dimension of its space of extensive quantities is the sum of the that of the subsystems'.
If there is some thermal contact between subsystems,
then the dimension of the space of extensive quantities of the composite system
will be less than that of the product thermal system.
For example, if the subsystems are allowed to exchange energy,
then two original extensive quantities
(the energy of the first subsystem and that of the second subsystem)
will be replaced by a single extensive quantity
(the total energy of the composite system).
Such a reduction in the dimension of the space of extensive quantities
is the same as contracting that we defined above.
Therefore, we can define a thermally composite system
as a contraction of the product thermal system.
Denote the projection map of the contracting as $\pi:W\to W^\perp:(e_1,e_2)\mapsto e$.
(From now on in this section, composite systems refer to thermally composite system.
I will introduce non-thermally composite systems later
(in [part 2]({% post_url 2023-05-01-measure-ensemble-2 %})),
which describe non-thermal contacts between subsystems and are more complicated.)

Besides being the contraction of the product thermal system,
there is an additional requirement.
Given the extensive quantities of the composite system and those of one of the subsystems,
we should be able to deduce those of the other subsystem.
For example, if the subsystems are allowed to exchange energy,
then the total energy of the composite system minus the energy of one of the subsystems
should be the energy of the other subsystem, which is uniquely determined
(if this is an allowed energy).
Mathematically, thie means that for any $e_1\in W^{(1)}$ and $e_2\in W^{(2)}$,
the two maps $\pi\!\left(e_1,\cdot\right)$ and $\pi\!\left(\cdot,e_2\right)$
are both injections.

*Definition.*
A **(thermally) composite thermal system** of two thermal systems
is the contraction of their product thermal system
corresponding to a contracting $(\pi,\lambda^\perp)$, where
$\pi:W\to W^\perp:(e_1,e_2)\mapsto e$ satisfies that
for any $e_1\in W^{(1)}$ and $e_2\in W^{(2)}$,
the two maps $\pi\!\left(e_1,\cdot\right)$ and $\pi\!\left(\cdot,e_2\right)$
are both injections.

We may define projection maps to get the extensive quantities of the subsystems
from those of the composite system:

$$c^{(1)}:W\to W^{(1)}:(e_1,e_2)\mapsto e_1,\quad
c^{(2)}:W\to W^{(2)}:(e_1,e_2)\mapsto e_2.$$

Then, for each $e\in W^\perp$, the two spaces

$$W^{\parallel(1)}_e\coloneqq c^{(1)}\!\left(W_e^\parallel\right),\quad
W^{\parallel(2)}_e\coloneqq c^{(2)}\!\left(W_e^\parallel\right)$$

are respectively affine subspaces of $W^{(1)}$ and $W^{(2)}$,
where $W_e^\parallel\coloneqq\pi^{-1}\!\left(e\right)$.
The two affine subspaces are actually isomorphic to each other
because of our additional requirement on the projection map $\pi$.
Because $\pi\!\left(e_1,\cdot\right)$ is an injection,
for any $e_1\in W^{\parallel(1)}_e$ there is a unique $e_2\in W^{\parallel(2)}_e$
such that $\pi\!\left(e_1,e_2\right)=e$, and vice versa.
This gives a correspondence between the two affine subspaces.
In other words, for each $e\in W^\perp$,
there is a unique bijection $\rho_e:W^{\parallel(1)}_e\to W^{\parallel(2)}_e$ such that

$$\forall e_1\in W^{\parallel(1)}_e:
\pi\!\left(e_1,e_2\right)=e\Leftrightarrow e_2=\rho_e\!\left(e_1\right).$$ {#eq:eq-pi-and-rho-e}

The bijection $\rho_e$ is an affine isomorphism
from $W^{\parallel(1)}_e$ to $W^{\parallel(2)}_e$.

What is more, $c^{(1)}$ is an affine isomorphism
from $W^{\parallel}_e$ to $W^{\parallel(1)}_e$,
and $c^{(2)}$ is an affine isomorphism
from $W^{\parallel}_e$ to $W^{\parallel(2)}_e$.
The three affine spaces $W^{\parallel}_e,W^{\parallel(1)}_e,W^{\parallel(2)}_e$
are then mutually isomorphic.

*Example.*
Suppose we have two thermal systems,
each of them have two extensive quantities called the energy and the number of particles.
We write them as $\left(U_1,N_1\right)$ and $\left(U_2,N_2\right)$.
They are in thermal contact so that they can exchange energy but not particles.
Then, the extensive quantities of the composite system may be written as $\left(U/2,U/2,N_1,N_2\right)$,
with $\pi:\left(U_1,U_2\right)\mapsto\left(U/2,U/2\right)$ defined as

$$\pi\!\left(U_1,U_2\right)\coloneqq\left(\frac{U_1+U_2}2,\frac{U_1+U_2}2\right).$$

The isomorphism $\rho_{U/2,U/2,N_1,N_2}$ is then

$$\rho_{U/2,U/2,N_1,N_2}\!\left(U_1,N_1\right)=\left(U-U_1,N_2\right).$$

The contracting is not unique.
For example, $\left(U_1,U_2\right)\mapsto\left(3U/4,U/4\right)$ is another valid projection
for constructing the composite thermal system, and it has exactly the same physical meaning
as the one I constructed above.

---

The isomorphism from $W^{\parallel}_e$
can push forward the measure $\lambda^\parallel_e$ on $E^\parallel_e$
to a new measure $\lambda^{\parallel(1)}_e$ on $E^{\parallel(1)}_e$.
Then, $\left(W^{\parallel(1)}_e,\lambda^{\parallel(1)}_e\right)$
is a slicing of $\left(W^{(1)},E^{(1)},\lambda^{(1)}\right)$,
and we can get a slice $\left(\mathcal E^{\parallel(1)}_e,\mathcal M^{\parallel(1)}_e\right)$
of $\left(\mathcal E^{(1)},\mathcal M^{(1)}\right)$
out of this slicing.
I would like to call this slice the
**compositing slice** of $\left(\mathcal E^{(1)},\mathcal M^{(1)}\right)$ at $e$.
Similarly, we define compositing slices of $\left(\mathcal E^{(2)},\mathcal M^{(2)}\right)$,
denoted as $\left(\mathcal E^{\parallel(2)}_e,\mathcal M^{\parallel(2)}_e\right)$.

Similarly to how we can define marginal states of subsystems of a product thermal system,
we can define marginal states of the compositing slices
given a state of a contractive slice of the composite system.
However, this time, there is a key difference:
the subsystems (compositing slices) have isomorphic
and completely dependent (deterministic) extensive quantities
instead of having completely independent extensive quantities.
Taken this into account, we can define marginal states of compositing slices as follows:

$$p^{\parallel(1)}\!\left(e_1,m_1\right)
\coloneqq\int_{m_2\in M^{(2)}_{\rho_e(e_1)}}p^\parallel\!\left(e_1,\rho_e(e_1),m_1,m_2\right)
\mathrm d\mu^{(2)}_{\rho_e(e_1)}\!\left(m_2\right),$$ {#eq:eq-slice-marginal-state}

where $p^{\parallel(1)}$ is a state of $\left(\mathcal E^{\parallel(1)}_e,\mathcal M^{\parallel(1)}_e\right)$,
and $p^\parallel$ is a state of $\left(\mathcal E^{\parallel}_e,\mathcal M^{\parallel}_e\right)$
(a contractive slice of the composite system).

---

There is an additional property that $\rho_e$ has.

As we all know, an affine map is a linear map combined with a translation:

$$\rho_e\!\left(e_1\right)=\vec\rho\!\left(e_1-e_0\right)+\rho_e\!\left(e_0\right),$$ {#eq:eq-rho-e-and-vec-rho}

where $e_0$ is a fixed point in $W^{\parallel(1)}_e$,
and $\vec\rho:\vec W^{\parallel(1)}_e\to \vec W^{\parallel(2)}_e$
is a linear map that is independent of the choice of $e_0$.
Because $\rho_e$ is a bijection, $\vec\rho$ is also a bijection,
and is thus a linear isomorphism from $\vec W^{\parallel(1)}_e$ to $\vec W^{\parallel(2)}_e$.

Because different slices $W^{\parallel(1)}_e$ with different $e$ are parallel to each other,
actually $\vec W^{\parallel(1)}_e$ is the same vector subspace of $\vec W^{(1)}$ for any $e\in W^\perp$.
We can write it as $\vec W^{\parallel(1)}$.
Similarly, $\vec W^{\parallel(2)}_e$ is the same vector subspace $\vec W^{\parallel(2)}$
of $\vec W^{(2)}$ for any $e\in W^\perp$.
Therefore, we can say $\vec\rho$ is
a linear isomorphism from $\vec W^{\parallel(1)}$ to $\vec W^{\parallel(2)}$.

Then, here is the interesting claim:

*Theorem.*
The linear map $\vec\rho$ defined above is independent of the choice of $e$.

<details markdown="1">
<summary>Proof</summary>

*Proof.*
Because $\pi$ is an affine map, we have

$$\pi\!\left(e_1,e_2\right)
=\vec\pi\!\left(e_1-e_0,e_2-\rho_e\!\left(e_0\right)\right)+\pi\!\left(e_0,\rho_e\!\left(e_0\right)\right),$$

where $e\in W^\perp$ is fixed,
$e_0\in W^{\parallel(1)}_e$ is also fixed,
and $\vec\pi:\vec W\to\vec W^\perp$ is a linear map that is independent of the choice of $e$ and $e_0$.

Let $e_2\coloneqq\rho_e\!\left(e_1\right)$ in the equation above, and we have

$$\pi\!\left(e_1,\rho_e\!\left(e_1\right)\right)
=\vec\pi\!\left(e_1-e_0,\rho_e\!\left(e_1\right)-\rho_e\!\left(e_0\right)\right)
+\pi\!\left(e_0,\rho_e\!\left(e_0\right)\right).$$

According to Equation [@eq:eq-pi-and-rho-e] and [@eq:eq-rho-e-and-vec-rho],
we have

$$e=\vec\pi\!\left(e_1-e_0,\vec\rho\!\left(e_1-e_0\right)\right)+e.$$

In other words,

$$\vec\pi\!\left(s_1,\vec\rho\!\left(s_1\right)\right)=0,$$ {#eq:eq-pi-s1-rho-s1-0}

where $s_1\in\vec W^{\parallel(1)}$ is an arbitrary vector.

Prove by contradition.
Assume that $\vec\rho$ is dependent on the choice of $e$,
then there exists two choices of $e$ such that we have two different $\vec\rho$'s,
denoted as $\vec\rho$ and $\vec\rho'$.
Because they are different maps,
there exists an $s_1\in\vec W^{\parallel(1)}$ such that $\vec\rho(s_1)\ne\vec\rho'(s_1)$.

On the other hand, we have

$$\vec\pi\!\left(s_1,\vec\rho\!\left(s_1\right)\right)=0,\quad
\vec\pi\!\left(s_1,\vec\rho'\!\left(s_1\right)\right)=0.$$

Subtract the two equations, and because of the linearity of $l$, we have

$$\vec\pi\!\left(0,\delta\right)=0,$$

where $\delta\coloneqq\vec\rho(s_1)-\vec\rho'(s_1)$ is a nonzero vector.
Then, we have

$$\pi\!\left(e_1,e_2+\delta\right)-\pi\!\left(e_1,e_2\right)=\vec\pi(0,\delta)=0,$$

which contradicts with the requirement that $\pi\!\left(e_1,\cdot\right)$ is injective.
$\square$

</details>

Besides, because $\vec\rho$ is a linear isomorphism
from $\vec W^{\parallel(1)}$ to $\vec W^{\parallel(2)}$,
the map $i_1\mapsto i_1\circ\vec\rho^{-1}$ is a linear isomorphism
from $\vec W^{\parallel(1)\prime}$ to $\vec W^{\parallel(2)\prime}$.
The inverse of this isomorphism is $i_2\mapsto i_2\circ\vec\rho$.

As we know, $i_1$ and $i_2$ are actually intensive quantities.
The physical meaning of them being each other's image/preimage under this isomorphism is that,
if the two subsystems in thermal contact have intensive quantities $-i_1$ and $i_2$ respectively,
then they are in equilibrium with each other.
Therefore, I would like to call this pair of intensive quantities to be **anticonsistent**.

---

Since we have a family of slices called the compositing slices of a subsystem,
can we make them the contractive slices of some contracting of the subsystem?
Well, it depends.
The first difficulty is that
$W^{\parallel(1)}_e$ may be the same subspace of $W^{(1)}$ for different $e\in W^\perp$
and thus make $E^{\parallel(1)}_e$ equipped with possibly different measures.

Anyway, ignore this at this stage.
Let me first construct a subspace $W^{\perp(1)}$
and a projection $\pi^{(1)}:W^{(1)}\to W^{\perp(1)}$
so that $W^{\parallel(1)}_e$ are preimages of points in $W^{\perp(1)}$,
and then see what will happen.

Since any vector subspace has a complement,
we can pick a subspace of $\vec W^{(1)}$ that is a complement of $\vec W^{\parallel(1)}$
and call it $\vec W^{\perp(1)}$.
Any vector in $\vec W^{(1)}$ can be uniquely decomposed into the sum of
a vector in $\vec W^{\perp(1)}$ and a vector in $\vec W^{\parallel(1)}$.

Then, we pick some fixed $e_1\in W^{(1)}$,
and it can be used to generate an affine subspace $W^{\perp(1)}\coloneqq e_1+\vec W^{\perp(1)}$ of $W^{(1)}$.
Then, each point in $W^{(1)}$ can be uniquely decomposed into the sum of
a point in $W^{\perp(1)}$ and a vector in $\vec W^{\parallel(1)}$.
Such unique decompositions can be encoded into a projection map $\pi^{(1)}:W^{(1)}\to W^{\perp(1)}$.

It seems that we are now halfway to the construction of our contracting.
However, before we proceed, I would like to prove a property of $W^{\perp(1)}$ we construct:

*Theorem.*
The map $\pi$ is an affine isomorphism
from the product affine space $W^{\perp(1)}\times W^{(2)}$ to $W^\perp$.

<details markdown="1">
<summary>Proof</summary>

*Proof.*
The map $\pi$ is itself affine, so we just need to prove that it is injective and surjective.

To prove it is injective, suppose that we have two points
$(e_1,e_2)$ and $(e_1',e_2')$ in $W^{\perp(1)}\times W^{(2)}$, such that

$$\pi\!\left(e_1,e_2\right)=\pi\!\left(e_1',e_2'\right)=:e.$$

Then, we have

$$\left(e_1,e_2\right),\left(e_1',e_2'\right)\in W^\parallel_e.$$

Therefore, $e_1,e_1'\in W^{\parallel(1)}_e$, so

$$e_1-e_1'\in\vec W^{\parallel(1)}.$$

On the other hand, because $e_1,e_1'\in W^{\perp(1)}$, we have

$$e_1-e_1'\in\vec W^{\perp(1)}.$$

Because $\vec W^{\perp(1)}$ is a complement of $\vec W^{\parallel(1)}$,
the only possible case is that $e_1=e_1'$.
Then, due to $\pi\!\left(e_1,\cdot\right)$ being injective, $e_2=e_2'$.
Therefore, $\left(e_1,e_2\right)=\left(e_1',e_2'\right)$.
Therefore, $\pi$ is injective if its domain is restricted to $W^{\perp(1)}\times W^{(2)}$.

To prove it is surjective, suppose $e\in W^\perp$.
Because $\pi$ is surjective from $W$ to $W^\perp$,
there exists some $\left(e_1',e_2'\right)\in W$ such that

$$\pi\!\left(e_1',e_2'\right)=e.$$

According to Equation [@eq:eq-pi-and-rho-e], this is equivalently

$$e_2'=\rho_e\!\left(e_1'\right).$$

We can uniquely decompose $e_1'\in W^{(1)}$ into
the sum of a point $e_1\in W^{\perp(1)}$ and a vector $\delta\in\vec W^{\parallel(1)}$.
Then, according to Equation [@eq:eq-rho-e-and-vec-rho], we have

$$e_2'=\rho_e\!\left(e_1+\delta\right)=\rho_e\!\left(e_1\right)+\vec\rho\!\left(\delta\right).$$

Thus $e_2\coloneqq e_2'-\vec\rho\!\left(\delta\right)=\rho_e\!\left(e_1\right)$.
According to Equation [@eq:eq-pi-and-rho-e], this is equivalently

$$\pi\!\left(e_1,e_2\right)=e.$$

Therefore, $\left(e_1,e_2\right)\in W^{\perp(1)}\times W^{(2)}$
is the desired point in $W^{\perp(1)}\times W^{(2)}$ that is mapped to $e$ under $\pi$.
Therefore, $\pi$ is surjective if its domain is restricted to $W^{\perp(1)}\times W^{(2)}$.
$\square$

</details>

Then, it seems that if we need a measure on $E^{\perp(1)}$ that is consistent with our theory,
the product measure of it and that on $E^{(2)}$ should be equal to that on $E^\perp$.
However, it is not always possible to find such a measure.
This is our second difficulty.

Therefore, in order to construct a contracting, we need to following assumptions:

- For different $e\in E^\perp$,
$\lambda^{\parallel(1)}_e$ is the same measure whenever $W^{\parallel(1)}_e$ is the same subspace.
- There exists a measure $\lambda^{\perp(1)}$ on $E^{\perp(1)}$ so that $\lambda^\perp$
is the pushforward of the product measure of $\lambda^{\perp(1)}$ and $\lambda^{(2)}$ under $\pi$.

Given those assumptions, if we define $\lambda^{\parallel(1)\prime}_{e_1}$ to be the measures from
the disintegration of $\lambda^{(1)}$ w.r.t. $\pi^{(1)}$ and $\lambda^{\perp(1)}$
(just the way we constructed the measures in constructive slicings),
then we can verify that they are actually the same as $\lambda^{\parallel(1)}_e$ defined before,
for any $e$ in the image of $\pi\!\left(e_1,\cdot\right)$.
You can verify this easily by the following check (not a rigorous proof),
where $\otimes$ denotes product measures or integration:

$$\lambda=\lambda^{\perp}\otimes\left\{\lambda^\parallel_e\right\}
=\lambda^{\perp(1)}\otimes\lambda^{(2)}\otimes\left\{\lambda^\parallel_e\right\}.$$

On the other hand,

$$\lambda=\lambda^{(1)}\otimes\lambda^{(2)}
=\lambda^{\perp(1)}\otimes\left\{\lambda^{\parallel(1)\prime}_{e_1}\right\}\otimes\lambda^{(2)}.$$

Comparing them, we have

$$\left\{\lambda^{\parallel(1)\prime}_{e_1}\right\}=\left\{\lambda^\parallel_e\right\}
=\left\{\lambda^{\parallel(1)}_e\right\}.$$

An explicit verification is more tedious and is omitted here.

Those assumptions are very strong, so we do not want to assume them.
Without those assumptions, we still have a well-constructed $W^{\perp(1)}$ and $\pi^{(1)}$
so that $W^{\parallel(1)}_e$ are preimages of points in $W^{\perp(1)}$ under $\pi$.
Then, we can use similar tricks as Equation [@eq:eq-linear-op-on-affine] to define
the action of any continuous linear functional $i_1\in\vec W^{\parallel(1)\prime}$
on a point $e_1\in W^{(1)}$ as

$$i_1\!\left(e_1\right)\coloneqq i_1\!\left(e_1-\pi^{(1)}\!\left(e_1\right)\right).$$

We can also do the same thing on $W^{(2)}$.
Then, an interesting thing to notice is that if we have
$e_1\in W^{(1)}$ and $e_2\in W^{(2)}$ such that

$$e\coloneqq\pi\!\left(e_1,e_2\right)
=\pi\!\left(\pi^{(1)}\!\left(e_1\right),\pi^{(2)}\!\left(e_2\right)\right),$$

then we have

$$i_1\!\left(e_1\right)=i_2\!\left(e_2\right),$$

where $i_1\in\vec W^{\parallel(1)\prime}$ and $i_2\in\vec W^{\parallel(2)\prime}$
are anticonsistent to each other.

*Example.*
In the example of two thermal systems that can exchange energy but not number of particles,
we may choose

$$\pi^{(1)}\!\left(U_1,N_1\right)\coloneqq\left(0,N_1\right),\quad
\pi^{(2)}\!\left(U_2,N_2\right)\coloneqq\left(0,N_2\right).$$

Such projections are not unique, but this is the simplest one
and also the most natural one considering their physical meanings.

---

We have newly defined some vector spaces.
There are interesting relations between them:

*Theorem.*

$$\vec W^{\perp\parallel}\coloneqq\vec\pi\!\left(\vec W^{\parallel(1)}+\vec W^{\parallel(2)}\right)
=\vec\pi\!\left(\vec W^{\parallel(1)}\right)=\vec\pi\!\left(\vec W^{\parallel(2)}\right).$$

<details markdown="1">
<summary>Proof</summary>

*Proof.*
Obviously
$\vec\pi\!\left(\vec W^{\parallel(2)}\right)\subseteq
\vec\pi\!\left(\vec W^{\parallel(1)}\times\vec W^{\parallel(2)}\right)$,
so we just need to prove that
$\vec\pi\!\left(\vec W^{\parallel(1)}\times\vec W^{\parallel(2)}\right)
\subseteq\vec\pi\!\left(\vec W^{\parallel(2)}\right)$.
To prove this, we just need to prove that for any

$$s\coloneqq\vec\pi\!\left(s_1,s_2\right)\in\vec\pi\!\left(\vec W^{\parallel(1)}\times\vec W^{\parallel(2)}\right),$$

where $s_1\in\vec W^{\parallel(1)}$ and $s_2\in\vec W^{\parallel(2)}$, we have
$s\in\vec\pi\!\left(\vec W^{\parallel(2)}\right)$.
To prove this, subtract Equation [@eq:eq-pi-s1-rho-s1-0] from the definition of $s$, and we have

$$s=\vec\pi\!\left(0,s_2-\vec\rho\!\left(s_1\right)\right)\in\vec\pi\!\left(\vec W^{\parallel(2)}\right).$$

Therefore,
$\vec\pi\!\left(\vec W^{\parallel(1)}\times\vec W^{\parallel(2)}\right)
\subseteq\vec\pi\!\left(\vec W^{\parallel(2)}\right)$.
Similarly,
$\vec\pi\!\left(\vec W^{\parallel(1)}\times\vec W^{\parallel(2)}\right)
\subseteq\vec\pi\!\left(\vec W^{\parallel(1)}\right)$.
Therefore, we proved the theorem. $\square$

</details>

Here we defined a new vector space $\vec W^{\perp\parallel}$.
Obviously it is a subspace of $\vec W^\perp$.
Because $\vec\pi(s_1,\cdot)$ and $\vec\pi(\cdot,s_2)$ are injective,
$\vec\pi$ is a linear isomorphism from $\vec W^{\parallel(1)}$ to $\vec W^{\perp\parallel}$
and a linear isomorphism from $\vec W^{\parallel(2)}$ to $\vec W^{\perp\parallel}$.

Here is another interesting thing about this vector space:

*Theorem.*
Suppose $e,e'\in W^\perp$.
Iff $W^{\parallel(1)}_e=W^{\parallel(1)}_{e'}$ and $W^{\parallel(2)}_e=W^{\parallel(2)}_{e'}$,
then $e'-e\in\vec W^{\perp\parallel}$.

<details markdown="1">
<summary>Proof</summary>

*Proof.*
First, prove the "if" direction.

Because $W^{\parallel(1)}_e=W^{\parallel(1)}_{e'}$, we have
$c^{(1)}\!\left(\pi^{-1}\!\left(e\right)\right)=c^{(1)}\!\left(\pi^{-1}\!\left(e'\right)\right)$.
In other words,

$$\forall x\in\pi^{-1}(e):\exists s_2\in\vec W^{(2)}:x+\left(0,s_2\right)\in\pi^{-1}(e').$$

Equivalently, this means

$$\pi(x)=e\Rightarrow\exists s_2\in\vec W^{(2)}:\pi\!\left(x+\left(0,s_2\right)\right)=e'.$$

Note that $\pi\!\left(x+\left(0,s_2\right)\right)=\pi(x)+\vec\pi\!\left(0,s_2\right)$,
which is just $e+\vec\pi\!\left(0,s_2\right)$, and we have

$$\exists s_2\in\vec W^{(2)}:e'-e=\vec\pi\!\left(0,s_2\right).$$

Similarly,

$$\exists s_1\in\vec W^{(1)}:e'-e=\vec\pi\!\left(s_1,0\right).$$

Subtract the two equations, and we have

$$0=\vec\pi\!\left(s_1,-s_2\right),$$

which means

$$\left(s_1,-s_2\right)\in\vec\pi^{-1}(0)=\vec W^\parallel.$$

Therefore,

$$s_1\in c^{(1)}\!\left(\vec W^\parallel\right)=\vec W^{\parallel(1)}.$$

Therefore,

$$e'-e=\vec\pi\!\left(s_1,0\right)\in\vec\pi\!\left(\vec W^{\parallel(1)}\right)
=\vec W^{\perp\parallel}.$$

Now, prove the "only if" direction.

Because $e'-e\in\vec W^{\perp\parallel}=\vec\pi\!\left(\vec W^{\parallel(2)}\right)$,
there exists $s_2\in\vec W^{\parallel(2)}$ such that

$$e'=e+\vec\pi\!\left(0,s_2\right).$$

Therefore, obviously we have
$c^{(1)}\!\left(\pi^{-1}\!\left(e\right)\right)=c^{(1)}\!\left(\pi^{-1}\!\left(e'\right)\right)$,
and thus $W^{\parallel(1)}_e=W^{\parallel(1)}_{e'}$.

Similarly, we can prove that $W^{\parallel(2)}_e=W^{\parallel(2)}_{e'}$. $\square$

</details>

This means that, given both $W^{\parallel(1)}_e$ and $W^{\parallel(2)}_e$,
we can determine $e$ upto a vector in $\vec W^{\perp\parallel}$.

Because we already have $\vec W^{\perp\parallel}$,
we can define a new affine subspace
$W^{\perp\perp}\coloneqq\pi\!\left(W^{\perp(1)}\times W^{\perp(2)}\right)$
so that $W^\perp=W^{\perp\perp}+\vec W^{\perp\parallel}$,
and each point in $W^\perp$ can be uniquely decomposed as a sum of a point in $W^{\perp\perp}$
and a vector in $\vec W^{\perp\parallel}$.
We can prove this easily.
Such decomposition can be encoded into a projection $\pi^\perp:W^\perp\to W^{\perp\perp}$
so that for any $e\in W^\perp$, we have $e-\pi^\perp(e)\in\vec W^{\perp\parallel}$.
Also, we can easily prove that $\pi$ is an affine isomorphism from
$W^{\perp(1)}\times W^{\perp(2)}$ to $W^{\perp\perp}$.

Now that we have defined many affine spaces and vector spaces,
here is a diagram of the relation between (some of) them
(powered by [quiver](https://q.uiver.app){target="_blank"}):

<details>
<summary>Diagrarm</summary>
<iframe class="quiver-embed dark-adaptive" src="https://q.uiver.app/?q=WzAsMTEsWzIsMCwiVyJdLFswLDIsIldeeygxKX0iXSxbNCwyLCJXXnsoMil9Il0sWzAsNCwiV157XFxwZXJwKDEpfSJdLFs0LDQsIldee1xccGVycCgyKX0iXSxbMCw2LCJcXHZlYyBXXntcXHBhcmFsbGVsKDEpfSJdLFs0LDYsIlxcdmVjIFdee1xccGFyYWxsZWwoMil9Il0sWzIsOCwiXFx2ZWMgV15cXHBhcmFsbGVsIl0sWzIsMTAsIldeXFxwZXJwIl0sWzEsMTEsIlxcdmVjIFdee1xccGVycFxccGFyYWxsZWx9Il0sWzMsMTEsIldee1xccGVycFxccGVycH0iXSxbMSwyLCJcXHRpbWVzIiwyLHsiY3VydmUiOi00LCJzdHlsZSI6eyJoZWFkIjp7Im5hbWUiOiJub25lIn19fV0sWzEsNCwiXFx0aW1lcyIsMCx7ImN1cnZlIjo1LCJzdHlsZSI6eyJoZWFkIjp7Im5hbWUiOiJub25lIn19fV0sWzMsMiwiXFx0aW1lcyIsMCx7ImN1cnZlIjo1LCJzdHlsZSI6eyJoZWFkIjp7Im5hbWUiOiJub25lIn19fV0sWzMsNCwiXFx0aW1lcyIsMCx7ImN1cnZlIjo1LCJzdHlsZSI6eyJoZWFkIjp7Im5hbWUiOiJub25lIn19fV0sWzksMTAsIisiLDIseyJjdXJ2ZSI6LTEsInN0eWxlIjp7ImhlYWQiOnsibmFtZSI6Im5vbmUifX19XSxbNSw2LCJcXHZlY1xccmhvIiwyLHsiY3VydmUiOjMsInN0eWxlIjp7ImJvZHkiOnsibmFtZSI6ImJhcnJlZCJ9fX1dLFs3LDUsIlxcdmVjIGNeeygxKX0iLDAseyJjdXJ2ZSI6LTEsInN0eWxlIjp7ImJvZHkiOnsibmFtZSI6ImJhcnJlZCJ9fX1dLFs3LDYsIlxcdmVjIGNeeygyKX0iLDIseyJjdXJ2ZSI6MSwic3R5bGUiOnsiYm9keSI6eyJuYW1lIjoiYmFycmVkIn19fV0sWzcsOCwiKyIsMCx7ImN1cnZlIjo0LCJzdHlsZSI6eyJoZWFkIjp7Im5hbWUiOiJub25lIn19fV0sWzQsNiwiKyIsMix7ImN1cnZlIjotMiwic3R5bGUiOnsiaGVhZCI6eyJuYW1lIjoibm9uZSJ9fX1dLFszLDUsIisiLDAseyJjdXJ2ZSI6Miwic3R5bGUiOnsiaGVhZCI6eyJuYW1lIjoibm9uZSJ9fX1dLFs1LDYsIlxcdGltZXMvKyIsMCx7InN0eWxlIjp7ImhlYWQiOnsibmFtZSI6Im5vbmUifX19XSxbMCw4LCJcXHBpIiwwLHsiY3VydmUiOi01fV0sWzUsOSwiXFx2ZWNcXHBpIiwyLHsiY3VydmUiOjMsInN0eWxlIjp7ImJvZHkiOnsibmFtZSI6ImJhcnJlZCJ9fX1dLFs2LDksIlxcdmVjXFxwaSIsMCx7ImN1cnZlIjotNSwic3R5bGUiOnsiYm9keSI6eyJuYW1lIjoiYmFycmVkIn19fV0sWzEsMywiXFxwaV57KDEpfSJdLFsyLDQsIlxccGleeygyKX0iXSxbMTEsMCwiIiwwLHsibGV2ZWwiOjF9XSxbMTIsOCwiXFxwaSIsMCx7ImN1cnZlIjoxLCJsZXZlbCI6MSwic3R5bGUiOnsiYm9keSI6eyJuYW1lIjoiYmFycmVkIn19fV0sWzEzLDgsIlxccGkiLDAseyJjdXJ2ZSI6LTEsImxldmVsIjoxLCJzdHlsZSI6eyJib2R5Ijp7Im5hbWUiOiJiYXJyZWQifX19XSxbMTQsMTAsIlxccGkiLDIseyJjdXJ2ZSI6LTMsImxldmVsIjoxLCJzdHlsZSI6eyJib2R5Ijp7Im5hbWUiOiJiYXJyZWQifX19XSxbMTUsOCwiIiwyLHsibGV2ZWwiOjF9XSxbMTksMCwiIiwwLHsiY3VydmUiOi0zLCJsZXZlbCI6MX1dLFsyMCwyLCIiLDIseyJjdXJ2ZSI6MywibGV2ZWwiOjF9XSxbMjEsMSwiIiwyLHsiY3VydmUiOi0zLCJsZXZlbCI6MX1dLFsyMiw5LCJcXHZlY1xccGkiLDIseyJjdXJ2ZSI6NCwibGV2ZWwiOjF9XV0=&embed" style="border-radius: 8px; border: none; width: 100%; aspect-ratio: 1/2"></iframe>
</details>

*Example.*
In the example of two thermal systems that can exchange energy but not number of particles,
we may have

$$\pi^\perp\!\left(\frac U2,\frac U2,N_1,N_2\right)=\left(0,0,N_1,N_2\right).$$

## Baths

**Bath**s are a special class of thermal systems.
They are systems that have some of their intensive quantities well-defined and constant.

According to Equation [@eq:eq-mce-fundamental-eq],
to make the intensive quantities constant,
$\ln\Omega(e)$ should be linear in $e$.
If we just require some of the intensive quantities to be constant,
we need to make it be linear when $e$ moves in directions in some certain vector subspace.

The requirement above is required by the microcanonical ensemble,
which does not involve change in extensive quantities.
An intuitive requirement is that $\lambda$ is also
translationally invariant in such directions.

Then, here comes the definition of a bath:

*Definition.*
A thermal system $(\mathcal E,\mathcal M)$ is called
a **$\left(\vec W^\parallel,i\right)$-bath**,
where $\mathcal E=(W,E,\lambda)$ and $\mathcal M=\bigsqcup_{e\in W}M_e$, if

- $\vec W^\parallel$ is a vector subspace of $\vec W$ and is a Polish reflexive space;
- For any $e\in E$ and $s\in\vec W^\parallel$, $e+s\in E$.
- $\lambda$ is invariant under translations in $\vec W^\parallel$;
in other words, for any $s\in\vec W^\parallel$ and $A\in\sigma(E)$, we have $\lambda(A+s)=\lambda(A)$;
- $i\in\vec W^{\parallel\prime}$ is a continuous linear functional on $\vec W^\parallel$,
called the **constant intensive quantities** of the bath; and
- For any $e\in E$ and $s\in\vec W^\parallel$,

$$\ln\mu_{e+s}\!\left(M_{e+s}\right)=i(s)+\ln\mu_e\!\left(M_e\right).$$

---

An important notice is that $\vec W^\parallel$ must be finite-dimensional
because a metrizable TVS with a non-trivial &sigma;-finite
translationally quasi-invariant Borel measure must be finite-dimensional
([Feldman, 1966](https://doi.org/10.2307/2035076){target="_blank"}).

We can then define the
non-trivial &sigma;-finite translationally invariant Borel measure on $\vec W^\parallel$,
denoted as $\lambda^\parallel$.
It is unique up to a positive constant factor.

---

We may construct an affine subspace $W^\perp$ for the bath
so that every point in $W$ can be uniquely decomposed into the sum of a point in $W^\perp$
and a vector in $\vec W^\parallel$.
Then, we have a projection map $\pi:W\to W^\perp$
so that for any $e\in W$ we have $e-\pi(e)\in\vec W^\parallel$.
Then, obviously, $\mu_e\!\left(M_e\right)$ must be in the form

$$\mu_e\!\left(M_e\right)=f\!\left(\pi(e)\right)\mathrm e^{i(e-\pi(e))},$$ {#eq:eq-Omega-of-bath}

where $f:W^\perp\to\mathbb R^+$ is some function.
The eplicit formula of $f$ is $f(e)\coloneqq\mu_e\!\left(M_e\right)$.

Further, we may require that $W^\perp$ is associated with a topological complement of $\vec W^\parallel$
(this is because $\vec W$ is locally convex and Hausdorff and $\vec W^\parallel$ is finite-dimensional).
Then, by the mathematical tools that were introduced in the beginning,
we can disintegrate the measure $\lambda$ w.r.t. $\lambda^\parallel$ to get a measure $\lambda^\perp$ on $W^\perp$
(it is the same for any element in $\vec W^\parallel$ because $\lambda$ is
$\vec W^\parallel$-translationally invariant).
Then, $\lambda$ is the product measure of $\lambda^\perp$ and $\lambda^\parallel$.
In other words, for any measurable function $f:E\to\mathbb R$, we have

$$\int_Ef\,\mathrm d\lambda=
\int_{e\in E^\perp}\int_{s\in\vec W^\parallel}f\!\left(e+s\right)
\mathrm d\lambda^\perp\!\left(e\right)\mathrm d\lambda^\parallel\!\left(s\right).$$

## Thermal ensembles

Different from microcanonical ensembles,
**thermal ensemble**s are ensembles where the system we study is in thermal contact with a bath.
For example, canonical ensembles and grand canonical ensembles are thermal ensembles.
There are also non-thermal ensembles,
which will be introduced later after we introduce non-thermal contacts
(in [part 2]({% post_url 2023-05-01-measure-ensemble-2 %})).

The thermal ensemble of a thermal system
is the ensemble of the composite system of the system in question (subsystem 1) and
a $\left(\vec W^{\parallel(2)},-i\circ\vec\rho^{-1}\right)$-bath (subsystem 2),
where $i\in\vec W^{\parallel(1)\prime}$ is a parameter, with an extra requirement:

$$\forall s_2\in\vec W^{\parallel(2)},A\in\sigma(E):
\lambda^\perp\!\left(\pi\!\left(A+s_2\right)\right)=\lambda^\perp\!\left(\pi\!\left(A\right)\right).$$ {#eq:eq-W2-translationally-invariant}

The physical meaning of $i$ is the intensive variables
that the system is fixed at by contacting the bath.

This composite system is called the
**composite system for the $\vec W^{\parallel(1)}$-ensemble**.
It is called that because we will see that the only important thing
that distinguishes different thermal ensembles is the choice of $\vec W^{\parallel(1)}$,
and the choices of $\pi,\lambda^\perp,W^{\perp(1)},W^{\perp(2)}$ are not important.

*Definition.*
The **composite system for the $\vec W^{\parallel(1)}$-ensemble**
of the system $\left(\mathcal E^{(1)},\mathcal M^{(1)}\right)$ is the composite system
of $\left(\mathcal E^{(1)},\mathcal M^{(1)}\right)$ and $\left(\mathcal E^{(2)},\mathcal M^{(2)}\right)$,
where

- $\left(\mathcal E^{(2)},\mathcal M^{(2)}\right)$
is a $\left(\vec W^{\parallel(2)},-i\circ\vec\rho^{-1}\right)$-bath,
where $i\in\vec W^{\parallel(1)\prime}$ is a parameter called the **fixed intensive quantities**;
- Equation [@eq:eq-W2-translationally-invariant] holds.

---

From the properties of a bath, we can derive a useful property of $\lambda^{\parallel(1)}_e$.

<!--
*Theorem.*
In the composite system for the $\vec W^{\parallel(1)}$-ensemble,
for $e,e'\in E^\perp$, if $e'-e\in\vec W^{\perp\parallel}$,
then for any $A\in\sigma\!\left(W^{\parallel(1)}_e\right)$, we have

$$f\!\left(e'\right)\lambda^{\parallel(1)}_{e'}(A)=f\!\left(e\right)\lambda^{\parallel(1)}_e(A),$$

where $f:E^\perp\to\mathbb R^+$ is some function.

<details markdown="1">
<summary>Proof</summary>

*Proof.*
Because $\vec\pi$ is a linear isomorphism from $\vec W^{\parallel(2)}$ to $\vec W^{\perp\parallel}$,
there is a unique $s_2\in\vec W^{\parallel(2)}$ such that

$$e'=e+\vec\pi\!\left(0,s_2\right).$$

Obviously, for any $A\in\sigma\!\left(E\right)$, $A+\left(0,s_2\right)\in\sigma\!\left(E\right)$.
Also,

$$\begin{align*}
\lambda\!\left(A+\left(0,s_2\right)\right)
&=\int_{e_1\in E^{(1)}}\lambda^{(2)}\!\left(
  \left(A+\left(0,s_2\right)\right)\cap{c^{(1)}}^{-1}\!\left(e_1\right)
\right)\mathrm d\lambda^{(1)}\!\left(e_1\right)\\
&=\int_{e_1\in E^{(1)}}\lambda^{(2)}\!\left(
  \left(A\cap{c^{(1)}}^{-1}\!\left(e_1\right)\right)+\left(0,s_2\right)
\right)\mathrm d\lambda^{(1)}\!\left(e_1\right)\\
&=\int_{e_1\in E^{(1)}}\lambda^{(2)}\!\left(
   A\cap{c^{(1)}}^{-1}\!\left(e_1\right)
\right)\mathrm d\lambda^{(1)}\!\left(e_1\right)\\
&=\lambda(A).
\end{align*}$$

Because $\pi$ is an affine map, for any $e\in W$, we have

$$\pi\!\left(e+\left(0,s_2\right)\right)=\pi(e)+\vec\pi\!\left(0,s_2\right),$$

so for any $A\in\sigma\!\left(W^\perp\right)$, we have

$$\pi^{-1}(A+\vec\pi\!\left(0,s_2\right))=\pi^{-1}(A)+\left(0,s_2\right),$$

and thus

$$\lambda\!\left(\pi^{-1}(A+\vec\pi\!\left(0,s_2\right))\right)=\lambda\!\left(\pi^{-1}(A)\right).$$

A requirement of contracting states that
$\lambda^\perp(A)=0\Leftrightarrow\lambda\!\left(\pi^{-1}(A)\right)=0$, so by the equation above,
we have

$$\lambda^\perp\!\left(A+\vec\pi\!\left(0,s_2\right)\right)=0\Leftrightarrow\lambda^\perp(A)=0.$$

Therefore, if we define a new measure

$$\lambda^\perp_{s_2}(A)\coloneqq\lambda^\perp\!\left(A+\vec\pi\!\left(0,s_2\right)\right),$$

then $\lambda^\perp_{s_2}$ is absolutely continuous with respect to $\lambda^\perp$.
We can then define their Radon--Nikodym derivative

$$\varphi_{s_2}(e)\coloneqq\frac{\mathrm d\lambda^\perp_{s_2}(e)}{\mathrm d\lambda^\perp(e)},$$

and $\varphi_{s_2}(e)>0$ for $\lambda^\perp$-almost all $e\in E^\perp$.

Now, for any $A\in\sigma(E)$, we have

$$\begin{align*}
\lambda\!\left(A+\left(0,s_2\right)\right)
&=\int_{e\in E^\perp}\lambda^\parallel_e\!\left(
  \left(A+\left(0,s_2\right)\right)\cap W^\parallel_e
\right)\mathrm d\lambda^\perp(e)\\
&=\int_{e\in E^\perp}\lambda^\parallel_{e+\vec\pi(0,s_2)}\!\left(
  \left(A+\left(0,s_2\right)\right)\cap W^\parallel_{e+\vec\pi(0,s_2)}
\right)\mathrm d\lambda^\perp\!\left(e+\vec\pi(0,s_2)\right)\\
&=\int_{e\in E^\perp}\lambda^\parallel_{e+\vec\pi(0,s_2)}\!\left(
  \left(A+\left(0,s_2\right)\right)\cap W^\parallel_{e+\vec\pi(0,s_2)}
\right)\varphi_{s_2}\!\left(e\right)\mathrm d\lambda^\perp\!\left(e\right).
\end{align*}$$

On the other hand,

$$\lambda\!\left(A+\left(0,s_2\right)\right)
=\lambda(A)
=\int_{e\in E^\perp}\lambda^\parallel_e\!\left(
  A\cap W^\parallel_e
\right)\mathrm d\lambda^\perp(e).$$

Compare the two equations, and because everything is arbitrary, we have

$$\lambda^\parallel_{e+\vec\pi(0,s_2)}\!\left(
  \left(A+\left(0,s_2\right)\right)\cap W^\parallel_{e+\vec\pi(0,s_2)}
\right)\varphi_{s_2}\!\left(e\right)=
\lambda^\parallel_e\!\left(A\cap W^\parallel_e\right).$$

Notice that

$$\begin{align*}
&x\in\left(A+\left(0,s_2\right)\right)\cap W^\parallel_{e+\vec\pi(0,s_2)}\\
\Leftrightarrow{}&x\in A+\left(0,s_2\right)\land x\in\pi^{-1}\!\left(e+\vec\pi\!\left(0,s_2\right)\right)\\
\Leftrightarrow{}&x\in A+\left(0,s_2\right)\land x\in\pi^{-1}\!\left(e\right)+\left(0,s_2\right)\\
\Leftrightarrow{}&x\in\left(A\cap\pi^{-1}\!\left(e\right)\right)+\left(0,s_2\right),
\end{align*}$$

so

$$\left(A+\left(0,s_2\right)\right)\cap W^\parallel_{e+\vec\pi(0,s_2)}
=\left(A\cap\pi^{-1}\!\left(e\right)\right)+\left(0,s_2\right).$$

Now, for any $A\in\sigma\!\left(E^\parallel_e\right)$, we have

$$\lambda^\parallel_{e+\vec\pi(0,s_2)}\!\left(A+\left(0,s_2\right)\right)\varphi_{s_2}\!\left(e\right)=
\lambda^\parallel_e\!\left(A\right).$$

Because $\lambda^{\parallel(1)}_e$ is the pushforward of $\lambda^\parallel_e$ under $c^{(1)}$,
we have

$$\lambda^{\parallel(1)}_{e+\vec\pi(0,s_2)}\!\left(
  c^{(1)}\!\left(A+\left(0,s_2\right)\right)
\right)\varphi_{s_2}\!\left(e\right)=\lambda^{\parallel(1)}_e\!\left(c^{(1)}\!\left(A\right)\right).$$

Notice that $c^{(1)}\!\left(A+\left(0,s_2\right)\right)=c^{(1)}\!\left(A\right)$.
Now, for any $A\in\sigma\!\left(E^{\parallel(1)}_e\right)$, we have

$$\lambda^{\parallel(1)}_{e+\vec\pi(0,s_2)}(A)\varphi_{s_2}(e)=\lambda^{\parallel(1)}_e(A).$$

Now, let

$$e'\coloneqq e+\vec\pi(0,s_2),\quad g\!\left(e,e'\right)=\frac1{\varphi_{s_2}(e)},$$

and we have

$$\lambda^{\parallel(1)}_{e'}(A)=g\!\left(e,e'\right)\lambda^{\parallel(1)}_e(A).$$

Now we just need to prove that $g$ can be written as a quotient.
To see this, we first need to notice that for any $s_2,s_2'\in\vec W^{\parallel(2)}$, we have

$$\begin{align*}
\frac1{\varphi_{s_2}(e)}&=\frac{\mathrm d\lambda^\perp\!\left(e\right)}
{\mathrm d\lambda^\perp\!\left(e+\vec\pi\!\left(0,s_2\right)\right)}\\
&=\frac{\mathrm d\lambda^\perp\!\left(e\right)}
{\mathrm d\lambda^\perp\!\left(e+\vec\pi\!\left(0,s_2'\right)\right)}
\frac{\mathrm d\lambda^\perp\!\left(e+\vec\pi\!\left(0,s_2'\right)\right)}
{\mathrm d\lambda^\perp\!\left(e+\vec\pi\!\left(0,s_2\right)\right)}\\
&=\frac1{\varphi_{s_2'}(e)}
\varphi_{s_2'-s_2}\!\left(e+\vec\pi\!\left(0,s_2\right)\right).
\end{align*}$$

This means that, for any $e,e',e'\'\in E^\perp$
such that the difference of any two of them is in $\vec W^{\perp\parallel}$, we have

$$g\!\left(e,e'\right)=\frac{g\!\left(e,e''\right)}{g\!\left(e',e''\right)}.$$

Let $e'\'\coloneqq\pi^\perp(e)=\pi^\perp\!\left(e'\right)$ in the equation above.
Then, we have

$$g\!\left(e,e'\right)=\frac{f\!\left(e\right)}{f\!\left(e'\right)},$$

where $f(e)\coloneqq g\!\left(e,\pi^\perp(e)\right)$.
This then proves the conclusion we want. $\square$

</details>

This means that,
whenever $W^{\parallel(1)}_e=W^{\parallel(1)}_{e'}$ and $W^{\parallel(2)}_e=W^{\parallel(2)}_{e'}$,
the two measures $\lambda^{\parallel(1)}_e$ and $\lambda^{\parallel(1)}_{e'}$
are the same measure up to a constant factor.
This is important because it ensures a consistency:
if two states on the same compositing slice are the same up to a constant factor,
then they are the same probability distribution.

Also, note that the value of the function $f(e)$ here is not uniquely determined.
It can be multiplied by an arbitrary function that is only related to $\pi^\perp(e)$.
Also, it can be modified arbitrarily on any set of points in $E^\perp$
that has zero $\lambda^\perp$ measure.
-->

Because $\lambda^{\parallel(1)}_e$ is the pullback of $\lambda^{\parallel(2)}_e$ under $\rho_e$,
but $\lambda^{\parallel(2)}_e$ is just the same $\lambda^{\parallel(2)}$ for all $e$
(although $\lambda^{\parallel(2)}_e$ is defined on $W^{\parallel(2)}_e$ but
$\lambda^{\parallel(2)}$ is defined on $\vec W^{\parallel(2)}$),
we have $\lambda^{\parallel(1)}_e$ is the same as long as $W^{\parallel(1)}_e$ is the same.
This means that we are able to be consistent with different compositing slices of our subsystem.

---

As we have claimed before,
the isolation of a contraction is the same as the full contraction of a contractive slice.
Therefore, we can use the microcanonical ensemble to find the equilibrium state of any contractive slice.
Then, we can use the marginal state of each contractive slice to get the equilibrium state of
each compositing slice in the subsystem.

Because the equal a priori probability postulate,
the equilibrium state $p^{\parallel\circ}_e$ on the contractive slice
$$\left(\mathcal E^\parallel_e,\mathcal M^\parallel_e\right)$$ is

$$p^{\parallel\circ}_e\!\left(e_1,e_2,m_1,m_2\right)
=\frac1{\mu^\parallel_e\!\left(\mathcal M^\parallel_e\right)}\propto1,$$

where $\mu^\parallel_e$ is the measure of the number of microstates on $\mathcal M^\parallel_e$.
Here $\propto$ means that the factor is only related to $e$.
We just need "$\propto$" instead of "$=$" because we can always normalize a probability density function.

Substitute this into Equation [@eq:eq-slice-marginal-state], and we get that
the equilibrium state $p^{\parallel\circ(1)}_e$ on the compositing slice
$$\left(\mathcal E^{\parallel(1)}_e,\mathcal M^{\parallel(1)}_e\right)$$ is

$$\begin{align*}
p^{\parallel\circ(1)}_e\!\left(e_1,m_1\right)
&\propto\mu^{(2)}_{\rho_e(e_1)}\!\left(M^{(2)}_{\rho_e(e_1)}\right)
\nonumber\\
&=f\!\left(\pi^{(2)}\!\left(\rho_e\!\left(e_1\right)\right)\right)
\mathrm e^{\left(-i\circ\vec\rho^{-1}\right)\left(\rho_e(e_1)-\pi^{(2)}(\rho_e(e_1))\right)}
\nonumber\\
&\propto\mathrm e^{-i(e_1)}.
\end{align*}$$ {#eq:eq-p-1-propto-e-i-e1}

Here we utilized Equation [@eq:eq-Omega-of-bath] and the fact that for any $e_1\in W^{\parallel(1)}_e$,
$\pi^{(2)}\!\left(\rho_e(e_1)\right)=\pi^{(2)}\!\left(W^{\parallel(2)}_e\right)$
is the same and is only related to $e$.
Note that we have already illustrated that
$\lambda^{\parallel(1)}_e$ is the same as long as $W^{\parallel(1)}_e$ is the same,
so we can normalize $p^{\parallel\circ(1)}_e$ to get the same state
as long as $W^{\parallel(1)}_e$ is the same,
avoiding any inconsistency.

Before we proceed to normalize $p^{\parallel\circ(1)}_e$,
I would like to talk about what is just enough information to determine $\lambda^{\parallel(1)}_e$.
First, we need to know how different $e$ can still make $W^{\parallel(1)}_e$ the same.
We already know that $W^\perp$ is just $W^{\perp\perp}+\vec W^{\perp\parallel}$,
and the component in $\vec W^{\perp\parallel}$ does not affect
$W^{\parallel(1)}_e$ and $W^{\parallel(2)}_e$, so we only need to know no more than $\pi^\perp(e)$.
Then, because $W^{\perp\perp}$ is isomorphic to $W^{\perp(1)}\times W^{\perp(2)}$
but the corresponding change in $W^{\perp(2)}$ does not affect $W^{\parallel(1)}_e$,
we only need to know the component
$\pi^{(1)}\!\left(e_1\right)=\pi^{(1)}\!\left(\pi^{-1}(e)\right)$,
where $e_1$ is just the $e_1$ in Equation [@eq:eq-p-1-propto-e-i-e1].
The space $W^{\parallel(1)}_e$ is just $\pi^{(1)-1}\!\left(e_1\right)$.

Besides these information (components of $e$) is useless, there is other useless information.
I have previously mentioned that
the choices of $\lambda^\perp$, $\lambda^{\perp(2)}$ etc. are also irrelevant.
We can see this by noting that $\lambda^{\parallel(1)}$ is always
the non-trivial translationally invariant &sigma;-finite Borel measure on $W^{\parallel(1)}_e$,
which is unique up to a constant postive factor (and exists because it is finite-dimensional).
This is not related to the choices of $\lambda^\perp$, $\lambda^{\perp(2)}$ etc.
By this, we reduced the only thing that we need to care about into three ones
$\lambda^{(1)}$, $\lambda^{\perp(1)}$, and $\lambda^{\parallel(1)}$,
and their relation is given by the following:

$$\int_{E^{(1)}}f\,\mathrm d\lambda^{(1)}=
\int_{e_1\in E^{\perp(1)}}\mathrm d\lambda^{\perp(1)}\!\left(e_1\right)
\int_{s_1\in\vec E^{\parallel(1)}_{e_1}}
f\!\left(e_1+s_1\right)\mathrm d\lambda^{\parallel(1)}\!\left(s_1\right),$$

where $E^{\perp(1)}\coloneqq\pi^{(1)}\!\left(E^{(1)}\right)$ and
$\vec E^{\parallel(1)}_{e_1}\coloneqq\left(E^{(1)}-e_1\right)\cap\vec W^{\parallel(1)}$
is the region of $s_1\in\vec W^{\parallel(1)}$ in which $e_1+s_1$ is in $E^{(1)}$.

Next, what we need to do is to normalize Equation [@eq:eq-p-1-propto-e-i-e1].
The denominator in the normalization factor, which we could call the **partition function**
$Z:\bigsqcup_{e_1\in E^{\perp(1)}}I^{(1)}_{e_1}\to\mathbb R$, is

$$\begin{align*}
Z\!\left(e_1,i\right)&\coloneqq\int_{s_1\in\vec E^{\parallel(1)}_{e_1}}
\int_{m_1\in M^{(1)}_{e_1+s_1}}
\mathrm e^{-i\left(s_1\right)}\,\mathrm d\lambda^{\parallel(1)}\!\left(s_1\right)
\mathrm d\mu^{(1)}_{e_1+s_1}\!\left(m_1\right)\\
&=\int_{s_1\in\vec E^{\parallel(1)}_{e_1}}
\Omega^{(1)}\!\left(e_1+s_1\right)
\mathrm e^{-i\left(s_1\right)}\,\mathrm d\lambda^{\parallel(1)}\!\left(s_1\right),
\end{align*}$$

where $I_{e_1}\subseteq\vec W^{\parallel(1)\prime}$
is the region of $i$ in which the integral converges.
It is possible that $I_{e_1}=\varnothing$ for all $e_1\in E^{\perp(1)}$,
and in this case the thermal ensemble is not defined.

---

Because we have got rid of arguments about the bath and the composite system,
we can now define the partition function without the "$(1)$" superscript:

$$Z\!\left(e,i\right)=\int_{s\in\vec E^{\parallel}_e}
\Omega\!\left(e+s\right)
\mathrm e^{-i\left(s\right)}\,\mathrm d\lambda^{\parallel}\!\left(s\right),\quad
e\in E^\perp,\quad i\in I_e\subseteq\vec W^{\parallel\prime}.$$

By looking at the definition,
we may see that the partition function is just the partial Laplace transform of $\Omega$.

Note that the partition function is unique only up to a positive constant factor
because we can choose another $\lambda^\parallel$ by multiplying a positive constant factor.

The partition function has very good properties.

*Theorem.*
For any $e\in E^\perp$, $I_e$ is convex.

<details markdown="1">
<summary>Proof</summary>

*Proof.*
Suppose $i,i'\in I_e$.
The functional $i'-i$ defines a hyperplane $H\coloneqq\operatorname{Ker}\!\left(i'-i\right)$.
The hyperplane separate $\vec W^\parallel$ into two half-spaces $H^+$ and $H^-$ defined as

$$H^\pm\coloneqq\left\{s\in\vec W^\parallel\,\middle|\,i'\!\left(s\right)-i\!\left(s\right)\gtrless0\right\}.$$

By definition, $Z\!\left(e,i\right)$ and $Z\!\left[e,i'\right]$ both converge.
Let $t\in\left[0,1\right]$, and we have

$$\begin{align*}
Z\!\left(e,i+t\left(i'-i\right)\right)
&=\left(\int_{s\in\vec E^{\parallel}_e\cap H^+}+\int_{s\in\vec E^{\parallel}_e\cap H^-}\right)
\Omega\!\left(e+s\right)
\mathrm e^{-i(s)-t(i'(s)-i(s))}\,\mathrm d\lambda^{\parallel}\!\left(s\right)\\
&\le\int_{s\in\vec E^{\parallel}_e\cap H^+}\Omega\!\left(e+s\right)
\mathrm e^{-i(s)}\,\mathrm d\lambda^{\parallel}\!\left(s\right)
+\int_{s\in\vec E^{\parallel}_e\cap H^-}\Omega\!\left(e+s\right)
\mathrm e^{-i'(s)}\,\mathrm d\lambda^{\parallel}\!\left(s\right)\\
&<\infty.
\end{align*}$$

Therefore, $Z\!\left[e,i+t\left(i'-i\right)\right]$ converges.
$\square$

</details>

Being convex is good because it means that $I_e$ is not too shattered.
It is connected, and its interior $\operatorname{Int}I_e$ and closure $\operatorname{Cl}I_e$
look very much like $I_e$ itself.
Also, every point in $I_e$ is a limit point of $I_e$.
This makes it possible to talk about the limits and derivatives of $Z\!\left(e,i\right)$ w.r.t. $i$.

Since $I_e$ is a region in a finite-dimensional space $\vec W^{\parallel\prime}$,
we may define the derivatives w.r.t. $i$ in terms of partial derivatives to components of $i$.
To define the components of $i$, we need first a basis on $\vec W^\parallel$,
which sets a coordinate system
although actually we should finally derive coordinate-independent conclusions.

Suppose we have a basis on $\vec W^\parallel$.
Then, for any $s\in\vec W^\parallel$, we can write its components as $s_\bullet$,
and for any $i\in\vec W^{\parallel\prime}$, we can write its components as $i_\bullet$.
The subscript "$\bullet$" here can act as dummy indices (for multi-index notation).
For example, we can write $i(s)=i_\bullet s_\bullet$.
I do not use superscript and subscript to distinguish vectors and linear functionals
because it is just for multi-index notation
and because I am going to use them to label multi-index objects
that are neither vectors nor linear functionals.

*Theorem.*
For any $e\in E^\perp$, $Z\!\left(e,i\right)$ is $C^\infty$ w.r.t. $i$ on $\operatorname{Int}I_e$.

<details markdown="1">
<summary>Proof</summary>

*Proof.*
By the definition of the interior of a region,
for any $i\in\operatorname{Int}I_e$ and any $p\in\vec W^{\parallel\prime}$,
there exists $\delta_{i,p}>0$ such that $i+\delta_{i,p}p\in I_e$.

By Leibniz's integral rule, the partial derivatives of $Z\!\left(e,i\right)$ w.r.t. $i$
(if existing) are given by

$$\begin{align*}
\frac{\partial^{\Sigma\alpha_\bullet}Z\!\left(e,i\right)}{\partial^{\alpha_\bullet}i_\bullet}
&=\int_{s\in\vec E^{\parallel}_e}
\Omega\!\left(e+s\right)\left(-s_\bullet\right)^{\alpha_\bullet}
\mathrm e^{-i\left(s\right)}\,\mathrm d\lambda^{\parallel}\!\left(s\right)\\
&\le\int_{s\in\vec E^{\parallel}_e}
\Omega\!\left(e+s\right)\left|s_\bullet\right|^{\alpha_\bullet}
\mathrm e^{-i\left(s\right)}\,\mathrm d\lambda^{\parallel}\!\left(s\right)
\end{align*}$$

where $\alpha_\bullet$ is some natural numbers indexed by $\bullet$.
Now we just need to prove that this integral converges for any $i\in\operatorname{Int}I_e$.

Because of the inequality

$$a\ln x-bx\le a\left(\ln\frac ab-1\right),\quad a,b,x>0,$$

where the equality holds when $x=a/b$, we have

$$\left|s_\bullet\right|^{\alpha_\bullet}
\le\left(\frac{\alpha_\bullet}{\mathrm eb}\right)^{\alpha_\bullet}\mathrm e^{b\Sigma\left|s_\bullet\right|},
\quad b>0$$

There are $2^{\dim\vec W^\parallel}$ orthants in $\vec W^\parallel$.
We can label each of them by a string $\sigma_\bullet$ of $\pm1$ of length $\dim\vec W^\parallel$.
Then, each orthant can be denoted as $O_\sigma$.
Then, we have

$$\forall s\in O_\sigma:\sigma_\bullet s_\bullet=\Sigma\left|s_\bullet\right|.$$

Therefore,

$$\forall s\in O_\sigma:\left|s_\bullet\right|^{\alpha_\bullet}
\le\left(\frac{\alpha_\bullet}{\mathrm eb}\right)^{\alpha_\bullet}\mathrm e^{b\sigma_\bullet s_\bullet},
\quad b>0.$$

Let $b\coloneqq\delta_{i,-\sigma}$, where $\sigma:s\mapsto\sigma_\bullet s_\bullet$ is a linear functional.
Then,

$$\forall s\in O_\sigma:\left|s_\bullet\right|^{\alpha_\bullet}\mathrm e^{-i(s)}
\le\left(\frac{\alpha_\bullet}{\mathrm e\delta_{i,-\sigma}}\right)^{\alpha_\bullet}
\mathrm e^{-\left(i-\delta_{i,-\sigma}\sigma\right)(s)}.$$

Because $i-\delta_{i,-\sigma}\sigma\in I_e$, we have

$$\frac{\partial^{\Sigma\alpha_\bullet}Z\!\left(e,i\right)}{\partial^{\alpha_\bullet}i_\bullet}
\le\sum_\sigma\left(\frac{\alpha_\bullet}{\mathrm e\delta_{i,-\sigma}}\right)^{\alpha_\bullet}
\int_{s\in\vec E^{\parallel}_e\cap O_\sigma}\Omega\!\left(e+s\right)
\mathrm e^{-\left(i-\delta_{i,-\sigma}\sigma\right)(s)}\,
\mathrm d\lambda^{\parallel}\!\left(s\right)<\infty.$$

Therefore, the partial derivatives exist.
$\square$

</details>

---

The next step is to find the macroscopic quantities.
The equilibrium states are

$$p_e^{\parallel\circ}\!\left(e,m\right)
=\frac{\mathrm e^{-i\left(e\right)}}{Z\!\left(\pi(e),i\right)}.$$

where $Z$ is the partition function.
Here the role of $e$ becomes the label parameter in Equation [@eq:eq-fundamental-equation-before].
The measured value of extensive quantities under equilibrium is then

$$\begin{align*}
\varepsilon^\circ
&=\frac1{Z\!\left(e,i\right)}\int_{s\in\vec E^{\parallel}_e}
\left(e+s\right)\mathrm e^{-i\left(s\right)}
\Omega\!\left(e+s\right)\mathrm d\lambda^{\parallel}\!\left(s\right)\\
&=e+\frac1{Z\!\left(e,i\right)}\int_{s\in\vec E^{\parallel}_e}
s\mathrm e^{-i\left(s\right)}
\Omega\!\left(e+s\right)\mathrm d\lambda^{\parallel}\!\left(s\right)\\
&=e+\frac{\partial\ln Z\!\left(e,i\right)}{\partial i}.
\end{align*}$$

The entropy under equilibrium is then

$$\begin{align*}
S^\circ
&=\int_{s\in\vec E^{\parallel}_e}
\frac{\mathrm e^{-i(s)}}{Z\!\left(e,i\right)}\ln\frac{\mathrm e^{-i(s)}}{Z\!\left(e,i\right)}
\Omega\!\left(e+s\right)\mathrm d\lambda^{\parallel}\!\left(s\right)\\
&=-\frac1{Z\!\left(e,i\right)}\int_{s\in\vec E^{\parallel}_e}
i\!\left(s\right)\mathrm e^{-i\left(s\right)}
\Omega\!\left(e+s\right)\mathrm d\lambda^{\parallel}\!\left(s\right)
+\ln Z\!\left(e,i\right)\\
&=-i\!\left(\frac{\partial\ln Z\!\left(e,i\right)}{\partial i}\right)+\ln Z\!\left(e,i\right).
\end{align*}$$

By this two equations, we can eliminate the parameter $e$ and get the fundamental equation
in the form of Equation [@eq:eq-fundamental-equation]:

$$S^\circ=i\!\left(\varepsilon^\circ\right)+\ln Z\!\left(\pi\!\left(\varepsilon^\circ\right),i\right).$$

We can see that $S^\circ$ decouples into two terms,
one of which is only related to the $\vec W^\parallel$ component of $\varepsilon^\circ$,
and the other of which is only related to the $W^\perp$ component of $\varepsilon^\circ$.
What is good is that we have a good notion of derivative w.r.t. the first term,
and it is $i$.
Therefore, the intensive quantities corresponding to change of extensive quantities
in the subspace $\vec W^\parallel$ is well defined and is constant $i$,
which is just what we have been calling the fixed intensive quantities.
The other components of the intensive quantities are not guaranteed to be well-defined
because $Z\!\left(\cdot,i\right)$ is not guaranteed to have good enough properties.

---

*This articled is continued in [part 2]({% post_url 2023-05-01-measure-ensemble-2 %}).*
