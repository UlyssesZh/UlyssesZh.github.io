---
title: The smallest wave packet in the lowest Landau level
date: 2024-07-01 01:01:46 -0700
categories:
- physics
tags:
- quantum mechanics
- condensed matter physics
layout: post
excerpt: 'The smallest wave packet in the lowest Landau level
exists, and is a Gaussian wave packet.
This turns out to be related to the coherent state of the harmonic oscillator.'
---

## Introduction

Exercise 12.5 from *Modern Condensed Matter Physics* (Girvin and Yang, 2019) asks
to construct a Gaussian wave packet in the lowest Landau level in the Landau gauge,
such that it is localized as closely as possible around some point $\mbf R\ceq\p{R_x,R_y}$.

Actually, we can prove that the smallest wave packet is a Gaussian wave packet.
Here is the derivation.

## The problem

First, for readers who are not familiar with the
[Landau levels](https://en.wikipedia.org/wiki/Landau_levels#In_the_Landau_gauge), here is a brief introduction.
For an electron confined in the $xy$ plane under a magnetic field $\mbf B=B\bhat z$,
its Hamiltonian is
$$H=\fr1{2m_e}\p{p_x^2+\p{p_y-\fr{eB}cx}^2}$$
under the Landau gauge $\mbf A=Bx\bhat y$.
Its eigenstates in the position representation are
$$\fc{\psi_{nk}}{x,y}=\e^{\i ky}\fc{H_n}{\fr xl-kl}
\e^{-\p{x-kl^2}^2/2l^2}$$
labeled by $n\in\bN$ and $k\in\bR$,
where $H_n$ is the Hermite polynomial of degree $n$
and $l\ceq\sqrt{\hbar c/eB}$.
States with the same $n$ are degenerate in energy
($E_n=\p{n+1/2}\hbar eB/m_ec$) and make up the $n$th Landau level.
The Landau level with $n=0$ is called the lowest Landau level.

The problem, now, is this optimization problem:
$$\begin{align*}
	\min_{a_k}\quad&\mel{\Psi}{x^2+y^2}{\Psi}\\
	\st\quad&\braket{\Psi}{\Psi}=1,\\
	&\mel{\Psi}{x}{\Psi}=R_x,\\
	&\mel{\Psi}{y}{\Psi}=R_y
\end{align*}$$
(optimizing $\a{x^2+y^2}$ is equivalent to optimizing $\sgm_x^2+\sgm_y^2$
because $\a x$ and $\a y$ are both fixed),
where $\ket\Psi$ is defined as the state whose position representation is
$$\fc\Psi{x,y}=\int\d k\,a_k\e^{\i ky}\e^{-\p{x-kl^2}^2/2l^2}.$$

## The solution

Consider the [moment-generating function](https://en.wikipedia.org/wiki/Moment_generating_function)
$$\begin{align*}
	\fc M{u,v}&\ceq\mel{\Psi}{\e^{ux+vy}}{\Psi}\\
	&=\iint\d x\d y\,\e^{ux+vy}
	\int\d k\,a_k^*\e^{-\i ky}\e^{-\fr1{2l^2}\p{x-kl^2}^2}
	\int\d k'\,a_{k'}\e^{\i k'y}\e^{-\fr1{2l^2}\p{x-k'l^2}^2}\\
	&=\iint\d k\d k'\,a_k^*a_{k'}\int\d x\,\e^{
		ux-\fr1{2l^2}\p{x-kl^2}^2-\fr1{2l^2}\p{x-k'l^2}^2
	}\underbrace{\int\d y\,\fc\exp{vy+\i\p{k'-k}y}}_{2\pi\fc\dlt{k'-k-\i v}}\\
	&=2\pi\int\d k\,a_k^*a_{k+\i v}\underbrace{\int\d x\,\fc\exp{
		ux-\fr1{2l^2}\p{x-kl^2}^2-\fr1{2l^2}\p{x-\p{k+\i v}l^2}^2
	}}_{l\sqrt\pi\fc\exp{\fr14l^2\p{4ku+u^2+2\i uv+v^2}}}\\
	&=2\pi^{3/2}l\fc\exp{\fr14l^2\p{u^2+2\i uv+v^2}}
	\int\d k\,a_k^*a_{k+\i v}\e^{kl^2u}\\
	&=2\pi^{3/2}l\int\d k\,a_k^*\left(
		a_k+kl^2a_ku+\i a_k'v+\fr14l^2\p{1+2k^2l^2}a_ku^2
	\right.\\&\qquad\qquad\qquad\qquad\left.
		{}+\fr14\p{l^2a_k-2a_k''}v^2
		+\fr\i2l^2\p{a_k+2ka_k'}uv+\cdots
	\right),
\end{align*}$$
where $a_k'\ceq\d a_k/\d k$ and $a_k''\ceq\d^2a_k/\d k^2$.
On the other hand, we have
$$\fc M{u,v}=\mel{\Psi}{1+ux+uy+\fr12u^2x^2+\fr12v^2y^2+uvxy+\cdots}{\Psi}.$$
Compare the expansion coefficients, and we have
$$\begin{align*}
	\braket{\Psi}{\Psi}&=2\pi^{3/2}l\int\d k\,a_k^*a_k,\\
	\mel{\Psi}{x}{\Psi}&=2\pi^{3/2}l^3\int\d k\,a_k^*ka_k,\\
	\mel{\Psi}{y}{\Psi}&=2\i\pi^{3/2}l\int\d k\,a_k^*a_k',\\
	\mel{\Psi}{x^2}{\Psi}&=\fr12\pi^{3/2}l^3\int\d k\,a_k^*\p{1+2k^2l^2}a_k,\\
	\mel{\Psi}{y^2}{\Psi}&=\fr12\pi^{3/2}l\int\d k\,a_k^*\p{l^2-2a_k''}a_k.
\end{align*}$$

Define $\fc\vphi k\ceq a_k\sqrt{2\pi^{3/2}l}$.
Define fictitious position and momentum operators acting on $\vphi$ as
$$\Xi\vphi:k\mapsto k\fc\vphi k,\quad
\Pi\vphi:k\mapsto-\i\fc{\vphi'}k.$$
Using the constraints of the original optimization problem
and abusing the bra--ket notation on $\vphi$, we have
$$\braket{\vphi}{\vphi}=1,\quad\mel\vphi\Xi\vphi=\fr{R_x}{l^2},\quad
\mel\vphi\Pi\vphi=-R_y.$$
The objective function then becomes
$$\mel{\Psi}{x^2+y^2}{\Psi}=\fr12l^2+\mel{\vphi}{\mcal H}{\vphi},$$
where $\mcal H\ceq \Pi^2/2+l^4\Xi^2/2$ is a fictitious Hamiltonian,
which is the Hamiltonian of a harmonic oscillator with
mass $1$ and angular frequency $\omg\ceq l^2$.

The optimization problem can now be re-stated in terms of $\ket\vphi$ as
$$\begin{align*}
	\min_{\ket\vphi}\quad&\mel\vphi{\mcal H}{\vphi}\\
	\st\quad&\braket\vphi\vphi=1,\quad\mel\vphi\Xi\vphi=R_x/\omg,\quad\mel\vphi\Pi\vphi=-R_y.
\end{align*}$$
Physically, this means that we want to find the state of a harmonic oscillator
with the given expectation values of position and momentum and the lowest energy.
To find it, we can use Hisenberg's uncertainty principle:
$$\begin{align*}
	\a{\mcal H}&=\fr12\a{\Pi^2}+\fr12\omg^2\a{\Xi^2}\\
	&=\fr12\p{\a\Pi^2+\sgm_\Pi^2}+\fr12\omg^2\p{\a{\Xi^2}+\sgm_\Xi^2}\\
	&=\fr12\sgm_\Pi^2+\fr12\omg^2\sgm_\Xi^2+\fr12R_y^2+\fr12 R_x^2\\
	&\ge\omg\sgm_\Pi\sgm_\Xi+\fr12R^2
	\ge\fr12\omg+\fr12R^2.
\end{align*}$$
The equality in the first "$\ge$" is achieved when $\sgm_\Pi=\omg\sgm_\Xi$,
and that in the second "$\ge$" is achieved when the uncertainty principle is saturated.
As we know from quantum mechanics, the
[coherent state](https://en.wikipedia.org/wiki/Coherent_state)
of a harmonic oscillator satisfies both conditions.
The wavefunction of this state is
$$\fc\vphi k=\p{\fr\omg\pi}^{1/4}
\fc\exp{-\fr12\omg\p{k-\fr{R_x}{\omg}}^2-\i R_yk}.$$
Express the final result in terms of $a_k$:
$$a_k=\fr1{\sqrt2\pi}\e^{-\i kR_y}\e^{-\fr1{2l^2}\p{R_x-kl^2}^2}.$$
We may work out the integral to get the wave function of the wave packet:
$$\fc{\Psi}{x,y}=\fr1{\sqrt{2\pi}l}\fc\exp{-\fr1{4l^2}\p{
	\p{x-R_x}^2+\p{y-R_y}^2-2\i\p{x+R_x}\p{y-R_y}
}}.$$
This is a Gaussian wave packet centered at $\mbf R$ with covariance matrix
$\opc{Diag}{l^2,l^2}$.

## Further problems

The optimal wave packet is indeed Gaussian.
This makes me curious about whether this is a coincidence or not.

Another thing worth noting is that this result is actually
the Dirac delta wave function peaking at $\mbf R$ projected into the lowest Landau level.
This was actually my first idea to solve the problem.
I was like: well, isn't the Dirac delta the smallest possible wave packet by all means?
If the basis is complete, I can surely combine them into a Dirac delta,
and it would be very easy to work out $a_k$ in this case.
Then, I was like: nah, merely a single Landau level is not complete,
so I cannot do that anyway.
I then did not even bother to proceed with this approach and went on to trying other methods.
It turns out that this approach is actually correct---at least
it gives the same result as the correct approach.
