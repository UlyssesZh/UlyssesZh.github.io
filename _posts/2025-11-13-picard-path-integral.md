---
title: From Picard iteration to Feynman path integral
date: 2025-11-13 17:31:24 -0800
categories:
- physics
tags:
- ode
- quantum mechanics
- graph theory
- stochastic process
- long paper
layout: post
excerpt: 'The Schr&ouml;dinger equation is an ODE,
so we can approach its solution through Picard iteration.
This approach leads to a sum over walks on the graph formed by an orthonormal basis as vertices
and the Hamiltonian matrix elements as edge weights.
This sum is exactly the Feynman path integral
if we choose the position basis and take the continuum limit.'
---

## Discrete path integral

As we all know, the Schr&ouml;dinger equation is
$$\fr\d{\d t}\ket{\fc\psi t}=-\i\fc Ht\ket{\fc\psi t},$$
where $\ket\psi$ is the state vector and $H$ is the Hamiltonian operator
(may be time-dependent).
This is an ordinary differential equation (ODE),
so we can express its solution as a sum
$$\ket{\fc\psi t}=\sum_{n=0}^\infty\ket{\fc{\psi^{\p n}}t},$$
where each term in the sum is defined iteratively by
(see also [my past article]({% post_url 2022-11-15-ode-recursive %}))
$$\ket{\fc{\psi^{\p0}}t}\ceq\ket{\fc\psi0},\quad
\ket{\fc{\psi^{\p{n+1}}}t}\ceq-\i\int_0^t\d t'\,\fc H{t'}\ket{\fc{\psi^{\p n}}{t'}}.$$
This iteration is called the Picard iteration,
which is most known as a method to prove the Picard--Lindel&ouml;f theorem.

Let us actually write out the general term in this sum as
$$\ket{\fc{\psi^{\p n}}t}=\fc{K^{\p n}}t\ket{\fc\psi0},$$
where
$$\fc{K^{\p n}}t=\p{-\i}^n\int_0^t\d t_n\,\fc H{t_n}\int_0^{t_n}\d t_{n-1}\,\fc H{t_{n-1}}\cdots\int_0^{t_2}\d t_1\,\fc H{t_1}.$$
Now with the trick of time-ordering, we can rewrite this as
$$\begin{align*}
\fc{K^{\p n}}t&=\fr{\p{-\i}^n}{n!}\int_0^t\d t_n\int_0^t\d t_{n-1}\cdots\int_0^t\d t_1\,\bfc{\mcal T}{\fc H{t_n}\fc H{t_{n-1}}\cdots\fc H{t_1}}\\
&=\fr{\p{-\i}^n}{n!}\mcal T\p{\int_0^t\d t'\,\fc H{t'}}^n,
\end{align*}$$
where $\bfc{\mcal T}\cdots$ means to order the operators inside according to their time arguments.
The factor of $1/n!$ appears because there are $n!$ ways to order $n$ time variables,
but another way to see this is to note that the domain of integration
is an $n$-simplex, whose volume is $1/n!$ of the corresponding $n$-parallelotope.
When we then sum over all $n$, we get the time-ordered exponential
$$\ket{\fc\psi t}=\fc Kt\ket{\fc\psi0},\quad
\fc Kt=\sum_n\fc{K^{\p n}}t=\mcal T\fc\exp{-\i\int_0^t\d t'\,\fc H{t'}}.$$ {#eq:time-ordered-exp}
The operator $\fc Kt$ has a bunch of equivalent names,
such as the time evolution operator, the propagator,
the Green's function, the Dyson operator, and the S-matrix
(well, they are not entirely equivalent because they are used under different contexts).

The interesting part comes when we consider the matrix elements of $\fc Kt$
and how they relate to the matrix elements of $\fc Ht$.
We choose an orthonormal basis $\B{\ket x}$,
and then insert a $\sum_x\ket x\bra x$ between each pair of Hamiltonian operators in the expression of $\fc{K^{\p n}}t$:
$$\bra{x_n}\fc{K^{\p n}}t\ket{x_0}
=\fr{\p{-\i}^n}{n!}\int_0^t\d^nt\sum_{x_1,\ldots,x_{n-1}}
\fc{h_{x_nx_{n-1}}}{t_n}\fc{h_{x_{n-1}x_{n-2}}}{t_{n-1}}\cdots\fc{h_{x_1x_0}}{t_1},$$
where we have abbreviated $\fc{h_{xy}}t\ceq\bra x\fc Ht\ket y$,
and $t_1\le\cdots\le t_n$ are a specific ordering of the integrated time variables.
We can pull out the sum over intermediate basis states
and call the summand a contribution from a walk [^walk] from $x_0$ to $x_n$.
In other words,
$$\bra y\fc{K^{\p n}}t\ket x
=\sum_{\B{x_i}}^{\substack{x_n=y\\x_0=x}}\fc K{\B{x_i},t},$$
where the sum is over all walks of length $n$ from $x$ to $y$,
and
$$\fc K{\B{x_i},t}\ceq\fr{\p{-\i}^n}{n!}\int_0^t\d^nt\,
\prod_{i=1}^n\fc{h_{x_ix_{i-1}}}{t_i}.$$
Now, the matrix elements of the full propagator is then the sum over contributions from all walks:
$$\bra y\fc Kt\ket x=\sum_{\text{walks }x\to y}\fc K{\text{walk},t}.$$
We can imagine a "Hamiltonian graph" formed by taking the basis states as vertices
and the Hamiltonian matrix elements as edge weights
(the weight of the directed edge from $x$ to $y$ is $-\i\bra y\fc Ht\ket x$).
Note that an edge can be a self-loop.
Then, the propagator contribution from a walk is given by integrating
the product of all the edge weights along the walk
(for a trivial walk, which has zero length, the contribution is simply $1$).
This formulation may be called the discrete path integral.
There is a [paper](https://arxiv.org/abs/2407.11231)
on arXiv that delivers the idea of the Hamiltonian graph.
Its difference from the current article is
that it only focuses on time-independent Hamiltonians
and that it treats self-loops separately instead of just like normal edges.
The following two sections (excluding self-loops and the Feynman path integral)
largely follow from the ideas from this paper.

[^walk]: You may wonder why I use the word "walk"
while the resultant thing is called a "path" integral.
This is just because "walk" is the correct term in graph theory that describes the object we use here,
and the sum over all the walks is called a "path" integral
because it is what physicists call.
In graph theory, however, a path is a walk in which all vertices are distinct.

## Excluding self-loops

In some cases, it may be hard to consider self-loops on the Hamiltonian graph.
We may then benefit from counting only walks without self-loops.
However, the contributions from each walk will now be different
because we have to account for the same walk with self-loops inserted at various positions.
In other words, for a walk $\B{x_i}$ without self-loops,
instead of contributing $\fc K{\B{x_i},t}$,
we now want to find the contribution $\fc L{\B{x_i},t}$ that sums over all ways to insert self-loops into $\B{x_i}$:
$$\fc L{\B{x_i},t}=\sum_{m_0,\ldots,m_n=0}^\infty
\fc K{\B{x_i^{m_i}},t},$$
where $m_i$ is the number of self-loops inserted at the vertex $x_i$,
and $\B{x_i^{m_i}}$ is an abbreviation of this walk:
$$\underbrace{x_0,\ldots,x_0}_{m_0},
\underbrace{x_1,\ldots,x_1}_{m_1},\ldots,
\underbrace{x_n,\ldots,x_n}_{m_n}.$$

I will show that we can find an expression for $\fc L{\B{x_i},t}$
for the case when the Hamiltonians at different times commute with each other.
In this case, we have
$$\fc K{\B{x_i},t}=\fr{1}{n!}\prod_{i=1}^n
\p{-\i\int_0^t\d t\,\fc{h_{x_ix_{i-1}}}t}.$$
Therefore, by the definition of $\fc L{\B{x_i},t}$, we have
$$\fc L{\B{x_i},t}=\fc K{\B{x_i},t}\sum_{m_0,\ldots,m_n}
\fr{n!}{\p{n+\sum_i m_i}!}
\prod_i\p{-\i\int_0^t\d t\,\fc{h_{x_ix_i}}t}^{m_i}.$$
For abbreviation, for the rest of this section,
we denote $S_i\ceq-\i\int_0^t\d t\,\fc{h_{x_ix_i}}t$.

Now, we use a trick to replace the factorial in the denominator with an contour integral:
$$\fr1{N!}=\fr1{2\pi\i}\oint\d z\fr{\e^z}{z^{N+1}},$$
where the contour is a counterclockwise simple closed curve around the origin in the complex plane.
We then have
$$\fr{\fc L{\B{x_i},t}}{n!\,\fc K{\B{x_i},t}}
=\fr1{2\pi\i}\sum_{m_0,\ldots,m_n}
\oint\d z\fr{\e^z}{z^{n+\sum_im_i+1}}
\prod_i S_i^{m_i}
=\fr1{2\pi\i}\oint\d z\fr{\e^z}{z^{n+1}}
\prod_i\sum_{m_i}\fr{S_i^{m_i}}{z^{m_i}}.$$
We have thus separated the sums over different $m_i$.
Each sum is a geometric series that converges when we choose the contour large enough, so
$$\fr{\fc L{\B{x_i},t}}{n!\,\fc K{\B{x_i},t}}
=\fr1{2\pi\i}\oint\d z\fr{\e^z}{z^{n+1}}
\prod_i\fr1{1-S_i/z}
=\sum_i\fr{\e^{S_i}}{\prod_{j\ne i}\p{S_i-S_j}},$$
where the last step used the residue theorem
for each pole at $z=S_i$.
This expression is exactly the expanded form of
the [divided difference](https://en.wikipedia.org/wiki/Divided_differences#Expanded_form) of $\B{\e^{S_i}}$,
often denoted $\e^{\b{S_0,\ldots,S_n}}$.
Therefore,
$$\fc L{\B{x_i},t}=n!\,\fc K{\B{x_i},t}\e^{\b{S_0,\ldots,S_n}}.$$ {#eq:no-self-loops}

The discrete path integral can then be rewritten in a form
that only involves collecting contributions from walks without self-loops:
$$\bra y\fc Kt\ket x=\sum_{\text{walks }x\to y}^{\text{no self-loops}}\fc L{\text{walk},t}.$$

## Feynman path integral

This discrete path integral formulation of the propagator already looks similar to the Feynman path integral,
but we have to go a step further to take the continuum limit to actually get there.
For simplicity, I will only consider a particle with unvarying mass $m$ moving in a time-independent potential in one dimension.
Its Hamiltonian is $H=p^2/2m+\fc Vx$, and the
orthonormal basis is chosen to be the position basis, also denoted as $\B{\ket x}$.

The more standard way to derive the Feynman path integral is to slice the time integral in Equation [@eq:time-ordered-exp],
to express the total exponentiation as a product as many small exponentiations,
and then to insert $\int\d x\ket x\bra x$ between each pair of exponentiations
(see, e.g., chapter 6 of <cite>Quantum Field Theory</cite> by Mark Srednicki).
However, this approach does not make its connection to the discrete path integral clear.
Instead, we will discretize the position space into a lattice with spacing $a$,
use the discrete path integral formulation on this lattice,
and then take the continuum limit $a\to0$ at the end.
Now, instead of $x\in\bR$, we have $x\in a\bZ$.
Each basis vector $\ket x$ now has two nearest neighbors $\ket{x-a}$ and $\ket{x+a}$.

In the position basis, the kinetic part of the Hamiltonian $p^2/2m$ is a second derivative operator.
From [numerical differentiation](https://en.wikipedia.org/wiki/Numerical_differentiation#Higher_derivatives),
we can approximate it on the lattice as
$$\fr{p^2}{2m}=\fr1{2ma^2}\p{2\ket x-\ket{x+a}-\ket{x-a}}\bra x.$$
Therefore, the discretized Hamiltonian is
$$H=\sum_x\p{\fr1{2ma^2}\p{2\ket x-\ket{x+a}-\ket{x-a}}+\fc Vx\ket x}\bra x.$$
Its matrix elements are then
$$h_{yx}=\fr1{2ma^2}\p{2\dlt_{y,x}-\dlt_{y,x+a}-\dlt_{y,x-a}}+\fc Vx\dlt_{y,x}.$$
Conceptually, it consists of on-site energy $1/ma^2+\fc Vx$
and nearest-neighbor hops.
The on-site energy looks bothersome, but we can remove it if we only consider walks without self-loops.
Equation [@eq:no-self-loops] becomes
$$\bra y\fc Kt\ket x
=\sum_{n=0}^\infty\p{\fr\beta{ma^2}}^n
\sum_{\B{x_i}}^{\substack{x_n=y\\x_0=x}}\e^{\b{S_0,\ldots,S_n}}
\prod_{i=1}^n\p{\fr12\dlt_{x_i,x_{i-1}+a}+\fr12\dlt_{x_i,x_{i-1}-a}},$$ {#eq:discrete-particle}
where $\beta=\i t$ is the imaginary time,
and $S_i\ceq-\beta\p{1/ma^2+\fc V{x_i}}$ is defined for the same abbreviation reason as the previous section.
The terms proportional to $\dlt_{x_i,x_{i-1}}$ in the multiplicant are omitted because we only consider walks without self-loops.
The rest of this section is done under a Wick rotation so that $\beta$ is assumed to be a positive real parameter.

First, let us tackle the divided difference $\e^{\b{S_0,\ldots,S_n}}$.
Define $\Dlt S_i\ceq S_i-\bar S$,
where $\bar S\ceq\sum_i S/\p{n+1}$ is the mean of $\B{S_i}$.
Then, $\Dlt S_i$ is of order unity
(while $S_i$ is of order $\beta/ma^2$, which is much larger than unity for small $a$).
Then, from the expanded form of the divided difference, we can easily get
$$\e^{\b{S_0,\ldots,S_n}}=\e^{\bar S}\e^{\b{\Dlt S_0,\ldots,\Dlt S_n}}.$$
Recalling how we initially derived the divided difference, we have
$$\e^{\b{\Dlt S_0,\ldots,\Dlt S_n}}=\sum_{m_0,\ldots,m_n}\fr1{\p{n+\sum_im_i}!}\prod_i\Dlt S_i^{m_i}.$$
When $n$ is large (the reason of which will be explained in a minute),
we have $n!\ll\p{n+1}!\ll\p{n+2}!$ etc.,
while $Q_i$ is of the order of unity,
so we only need to consider the terms with the lowest $\sum_im_i$.
The leading term is the term with $\sum_im_i=0$, which is trivially $1/n!$,
so we have
$$\e^{\b{S_0,\ldots,S_n}}=\fr1{n!}\e^{\i\bar S}
=\fr1{n!}\fc\exp{-\fr{\beta}{ma^2}-\fr{\beta}{n+1}\sum_i\fc V{x_i}}.$$ {#eq:observation-3}
This contributes to the potential part of the action.

Substitute Equation [@eq:observation-3] into Equation [@eq:discrete-particle],
and we have
$$\bra y\fc Kt\ket x
=\sum_{n=0}^\infty\fr{\e^{-\lmd}\lmd^n}{n!}
\sum_{\B{x_i}}^{\substack{x_n=y\\x_0=x}}
\fc\exp{-\fr{\beta}{n+1}\sum_i\fc V{x_i}}\prod_{i=1}^n\p{\fr12\dlt_\cdots+\fr12\dlt_\cdots},$$
where $\lmd\ceq\beta/ma^2$ is a large positive number when $a$ is small.
Observe that the factor $\e^{-\lmd}\lmd^n/n!$ is the probability mass function
of the Poisson distribution with mean $\lmd$ evaluated at $n$.
When $\lmd$ is very large,
the Poisson distribution can be approximated by a delta distribution
because the standard deviation $\sqrt\lmd$ is much smaller than $\lmd$.
In other words, $\e^{-\lmd}\lmd^n/n!\approx\dlt_{n,\lmd}$.
Therefore,
$$\bra y\fc Kt\ket x
=\sum_{\B{x_i}}^{\substack{x_\lmd=y\\x_0=x}}
\fc\exp{-\fr{\beta}{n+1}\sum_i\fc V{x_i}}
\prod_{i=1}^\lmd\p{\fr12\dlt_{x_i,x_{i-1}+a}+\fr12\dlt_{x_i,x_{i-1}-a}}.$$

<details><summary>Imaginary parameter Poisson distribution</summary>

It was this point that got me thinking the most
when I originally tried to derive the Feynman path integral without the Wick rotation.
While the approximation $\e^{-\lmd}\lmd^n/n!\approx\dlt_{n,\lmd}$ is valid,
the problem is whether we can likewise say $\e^{-\i\lmd}\p{\i\lmd}^n/n!\approx\dlt_{n,\lmd}$ (or $\dlt_{n,\i\lmd}$).
While it is true that the left-hand side has a very large magnitude when $n=\lmd$ so that it dominates the sum,
it does not actually approximate the right-hand side because the right-hand side is of order unity and is real.
In fact, the summand is rapidly oscillating when $n$ is near $\lmd$,
so the numbers of different phases actually cancel each other out and give a number with small magnitude in the end.

If you actually try to walk through the calculation without the Wick rotation,
you will find that what you need to justify in the end is something like this
(there are some other factors dependent on $n$ in the summand,
but we can remove them by some techniques,
so let us ignore them for simplicity):
$$\e^{-\i\lmd}\sum_{n=0}^\infty\fr{\p{\i\lmd}^n}{n!}\e^{-M/n}\approx \e^{\i M/\lmd},$$
where $\lmd$ and $M$ are both large positive numbers.
This is unfortunately false, neither in magnitude nor in phase,
and not even up to an overall factor.

While it is true that a lot of things can be carried over by analytic continuation,
which is the reason why the Wick rotation can give the correct result in many cases,
you can do the analytic continuation only if every step you take is actually analytic.
Having an approximation based on the magnitude of each summand is not analytic
because a fast oscillation can change the result drastically.
Therefore, I am not satisfied with this derivation with the Wick rotation,
but I have not found a better way to do it yet.

</details>

If the factor involving $V$ were not there in the summand,
the sum of products is exactly the probability that a random walk starting at $x$
ends at $y$ after $\lmd$ steps,
where at each step the walk moves to the left or right nearest neighbor with equal probability $1/2$.
Instead of considering one random walk with $\lmd$ steps,
we can consider $N$ random walks with $l\ceq\lmd/N$ steps each,
where both $l$ and $N$ are large.
Because $l$ is large, we can approximate the distribution of the position at the end of the $j$th random walk
as a normally distributed random variable $q_j$ with variance $la^2$.
Note that even though $l$ is large, $la^2$ is still very small,
so the majority of contribution in the sum only comes from those paths
where $x_i$ does not differ too much from the $q_j$ of its corresponding part of random walk.
Therefore, if we fix a set of $\B{q_j}$, the factor involving $V$ in the summand
can be approximated by replacing $\fc V{x_i}$ with $\fc V{q_j}$
for all $x_i$ in the $j$th random walk segment.
We can then pull this factor out of the sum over $\B{x_i}$
(but still inside the integral over $\B{q_j}$).
Therefore, we get
$$\begin{align*}
\bra y\fc Kt\ket x
&=\int_{\B{q_j}}^{\substack{q_N=y\\q_0=x}}\d q_1\cdots\d q_{N-1}
\sum_{\B{x_i}}^{x_{jl}=q_j}\fc\exp{\tfr{-\beta}{n+1}\sum_i\fc V{x_i}}
\prod_{i=1}^\lmd\p{\tfr12\dlt_{x_i,x_{i-1}+a}+\tfr12\dlt_{x_i,x_{i-1}-a}}\\
&=\int_{\B{q_j}}^{\substack{q_N=y\\q_0=x}}\d q_1\cdots\d q_{N-1}
\fc\exp{\tfr{-\beta}{N+1}\sum_j\fc V{q_j}}
\prod_{j=1}^N\p{a\tfr1{\sqrt{2\pi la^2}}\fc\exp{-\tfr{\p{q_j-q_{j-1}}^2}{2la^2}}},
\end{align*}$$
where the extra factor of $a$ in the multiplicant comes from converting a probability density to a probability
(since the probability that the position ends up at the lattice site $y$
is $a$ times the probability density at $y$).

Combining the product of exponentiations into the exponentiation of a sum,
we have
$$\prod_{j=1}^N\p{a\fr1{\sqrt{2\pi la^2}}\fc\exp{-\fr{\p{q_j-q_{j-1}}^2}{2la^2}}}
=\fr1{\sqrt{2\pi l}^N}
\fc\exp{-\sum_{j=1}^N\fr{\p{q_j-q_{j-1}}^2}{2la^2}}.$$
If we introduce the time step $\Dlt t\ceq\beta/N=mla^2$,
for large $N$, we have
$$\sum_{j=1}^N\fr{\p{q_j-q_{j-1}}^2}{2la^2}
=\sum_{j=1}^N\Dlt t\,\fr12m\p{\fr{q_j-q_{j-1}}{\Dlt t}}^2
=\int_0^\beta\d t'\,\fr12m\fc{\dot q}{t'}^2.$$
Similarly, for the potential part we introduce the time step $\Dlt t=\beta/\p{N+1}$ [^plus-1],
$$\fr\beta{N+1}\sum_{j=0}^N\fc V{q_j}
=\sum_{j=0}^N\Dlt t\,\fc V{q_j}
=\int_0^\beta\d t'\,\fc V{\fc q{t'}}.$$
Here, $\fc q{t'}$ and $\fc{\dot q}{t'}$ are
the position and its time at time $t'$ for a particle undergoing these random walks.
Therefore, we have
$$\bra y\fc Kt\ket x
=\sqrt{\fr{ma^2}{2\pi\Dlt t}}^N
\int_{\B{q_j}}^{\substack{q_N=y\\q_0=x}}\d q_1\cdots\d q_{N-1}
\fc\exp{-\int_0^\beta\d t'\p{\fr12m\fc{\dot q}{t'}^2+\fc V{\fc q{t'}}}}.$$

[^plus-1]: Do not ask my why it is $N+1$. It is not important.

Finally, simply revert the Wick rotation by substituting $\beta=\i t$
and rewrite the integral over $\B{q_j}$ as a path integral over all paths $\fc q{t'}$.
Then, we get the Feynman path integral expression of the propagator:
$$\bra y\fc Kt\ket x
=\int^{\substack{\fc qt=y\\\fc q0=0}}
\mcal Dq\fc\exp{\i\int_0^t\d t'\p{\fr12m\fc{\dot q}{t'}^2-\fc V{\fc q{t'}}}}.$$
This completes the derivation.
