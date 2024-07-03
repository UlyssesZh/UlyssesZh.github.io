---
title: Regularizing the partition function of a hydrogen atom
date: 2024-06-30 21:18:12 -0700
categories:
- physics
tags:
- statistical mechanics
- complex
- regularization
- long paper
layout: post
excerpt: 'The partition function of a hydrogen atom diverges
(only considering bound states).
However, we can regularize it to get finite answers.
Different regularizations give the same result.
They largely agree with the physical arguments for the case of the hydrogen atom at room or cold temperature,
but this should be considered a mere coincidence.
The results from regularized partition functions cannot generally be trusted.'
---

## Introduction

<details>
<summary>The unit system</summary>

The unit system used in this article is
[Hartree atomic units](https://en.wikipedia.org/wiki/Atomic_units):
$m_\mrm e=k_\mrm B=\hbar=4\pi\veps_0=e=1$,
where $m_\mrm e$ is the electron mass.

In this unit system, the Bohr radius is $a_\mrm B=1$, which is of angstrom order.
Therefore, I will use $10^{10}$ as the order of macroscopic lengths.
The Rydberg unit of energy is $\mrm{Ry}=1/2$, which is of electronvolt order.
Therefore, I will use $10^3$ as the order of inverse room temperature.

One can adjust the units to get results for the cases of other hydrogen-like atoms:
use $Z^2/4\pi\veps_0=1$ instead of $4\pi\veps_0=1$, where $Z$ is the atomic number.

In this article, I also assume that the mass of the nucleus is infinite.
If you want more accuracy, you can use $m_\mrm Nm_\mrm e/\p{m_\mrm N+m_\mrm e}=1$
instead of $m_\mrm e=1$, where $m_\mrm N$ is the mass of the nucleus.

</details>

<details><summary>Terminology about temperatures</summary>

I will mainly be working with the inverse temperature $\beta\ceq1/k_\mrm BT$,
where $T$ is the temperature.
However, I will still use "temperature" often to give some physical intuition.
To avoid confusion in the context of using $\beta$
and in appearance of [negative temperature](https://en.wikipedia.org/wiki/Negative_temperature),
I would avoid using phrases like "high temperature" and "low temperature".
Instead, here are some terminologies that I am going to use:

- "Cold (positive) temperature" means $\beta\to+\infty$.
- "Hot positive temperature" means $\beta\to0^+$.
- "Cold negative temperature" means $\beta\to0^-$.
- "Hot negative temperature" means $\beta\to-\infty$.

</details>

The energy levels of a hydrogen atom are (ignoring fine structures etc.) $E_n=-1/2n^2$,
with each energy level labeled by $n\in\bZ^+$,
and each energy level has $g_n\ceq n^2$ degeneracy (ignoring spin degeneracy,
which merely contributes to an overall factor of the partition function).
The partition function is
$$\fc Z\beta\ceq\sum_{n=1}^\infty g_n\e^{-\beta E_n}
=\sum_{n=1}^\infty n^2\e^{\beta/2n^2},$$ {#eq:Z}
which diverges for any $\beta\in\bC$
(of course, normally we can only have $\beta\in\bR$,
but the point of saying that it diverges for any complex $\beta$ is that
there is no way we can analytically continue the function to get a finite result).
Does this mean that statistical mechanics breaks down for this system?
Not necessarily.
Actually, there are multiple ways we can tackle this divergence.

One should notice that, although this article concentrates on regularizing partition functions
and that of the hydrogen atom in particular,
all the methods are valid for more general divergent sums.

Here is a sentence that is quoted by many literatures on diverging series,
so I want to quote it, too:

<figure class="no-indent">

> Divergente Rækker er i det Hele noget Fandenskap,
og det er en Skam at man vover at grunde nogen Demonstrasjon derpaa.

<figcaption>---N. H. Abel</figcaption>

</figure>

<p class="no-indent">
It translates to "Divergent series are in general deadly,
and it is shameful that anyone dare to base any proof on them."
</p>

## The physical answer

A physicist always tell you that one should not be afraid of infinities.
Instead, one should look at where the infinity comes out from the seemingly physical model,
where there is something sneakily unphysical which ultimately leads to this unphysical divergence.
In our case, the divergence comes from high energy levels.
It is then a good time to question whether those high energy levels are physical.

There is a radius associated with each energy level in the sense of the Bohr model: $r_n=n^2$.
When $r_n\sim L\ceq10^{10}$ (which happens at $n\sim\Lmd\ceq10^5$),
the orbit is really microscopic now,
and the interaction between the electron and the "box" that contains the whole experimental setup
is now having significant effects.
Or, if there is not a box at all, we can use the size of the universe instead,
which is about $r_n\sim L\ceq10^{36}$ ($\Lmd\ceq10^{18}$).
Use the model of particle in a box for energy levels higher than $n=\Lmd$, and we have
$$Z=\sum_{n=1}^\Lmd n^2\e^{\beta/2n^2}
+\sum_{n_x,n_y,n_z=1}^\infty\fc\exp{-\beta\fr{\p{n_x^2+n_y^2+n_z^2}\pi^2}{2L^2}},$$
where $L$ is the side length of the box (assuming that the box is cubic).
If $L$ is very large,
we can approximate the second term as a spherically symmetric integral over the first octant
to get $L^3\p{2\pi\beta}^{-3/2}$.

<details>
<summary>The integral approximation</summary>

This is actually the result for Boltzmann ideal gas, so it should be familar,
but I still write down the calculation here for completeness.

We can approximate
$$\sum_{n_x,n_y,n_z=1}^\infty\fc\exp{-\beta\fr{\p{n_x^2+n_y^2+n_z^2}\pi^2}{2L^2}}
\approx I\ceq\int_0^\infty\d^3n\,\fc\exp{-\beta\fr{\p{n_x^2+n_y^2+n_z^2}\pi^2}{2L^2}},$$
where $\int_0^\infty\d^3n$ means $\int_0^\infty\int_0^\infty\int_0^\infty\d n_x\,\d n_y\,\d n_z$.
We can then change the integral to spherical coordinates:
$$I=\int_0^\infty\fr184\pi n^2\,\d n\,\fc\exp{-\beta\fr{n^2\pi^2}{2L^2}}
=\fr{L^3}{4\pi^2\beta^{3/2}}\int_{-\infty}^\infty\d n\,n^2\e^{-n^2/2},$$
where the factor of $1/8$ is because we only integrate in the first octant,
and the second step utilizes the symmetry of the integrand and redefines the integrated variable.
This integral is than a familiar Gaussian integral of order unity.
The value of it is not important for later discussion because all the arguments that follow
only uses orders of magnitude,
but I tell you it is $\sqrt{2\pi}$, which can be evaluated by integrating by parts once
and utilizing the famous $\int_{-\infty}^{\infty}\e^{-n^2/2}\,\d n=\sqrt{2\pi}$.
The final result is $I=L^3\p{2\pi\beta}^{-3/2}$.

Is this an overestimation or underestimation?
It is actually an overestimation. Draw a picture of $\e^{-n^2/2}$ to convince yourself of this.
We do not need to estimate how large the error is, though,
because we will see that we only need an upper bound to get the arguments we need.

</details>

For the first term, we need to consider how the magnitude of the summand changes with $n$.
The minimum value of the summand is at $n=\sqrt{\beta/2}$.
At room temperature, we have $\beta\sim10^3$, so $\sqrt{\beta/2}$ is well between $1$ and $\Lmd$.
Therefore, the largest term is either $n=1$ or $n=\Lmd$.
The former is $\e^{\beta/2}$, which is of order $10^{217}$,
while the latter is $\Lmd^2$, which is of order $10^{36}$ for the case of the size of the universe.
We may then be interested in the $n=2$ term $4\e^{\beta/8}$, which is of order $10^{54}$.
This is much larger than the $n=\Lmd$ term but much smaller than the $n=1$ term,
so it is second largest term in the sum.

An upper bound of the summation is given by replacing every term except the largest term by the second largest term,
which gives
$$Z<\underbrace{\e^{\beta/2}}_{10^{217}}
+\underbrace{\p{\Lmd-1}4\e^{\beta/8}}_{10^{72}}+\underbrace{L^3\p{2\pi\beta}^{-3/2}}_{10^{48}}\approx\e^{\beta/2}.$$
Therefore, the $n=1$ term dominates the entire partition function.
This means that the hydrogen atom is extremely likely to be in the ground state
(despite the seeming divergence of the partition function).
This is intuitive.
The probability of the system not being in the ground state is of order $10^{-55}$
for the size of the universe and $10^{-158}$ for a typical macroscopic experiment.

<details>
<summary>More accurate considerations</summary>

The usage of the model of particle in a box for energy levels $n>\Lmd$ gives good enough arguments and results,
but one may want to question whether this is appropriate.

What happens if you actually put a hydrogen atom in a box
(for simplicity, make the box spherically symmetric)?
More accurately, consider the quantum mechanical problem in spherically symmetric potential $V$
such that $V\sim-r^{-1}$ for small $r$ but grows fast and high
enough at large $r$ so that the partition function for bound states is convergent.
This is called a confined hydrogen atom.
A book chapter [<cite>The Confined Hydrogen Atom Revisited</cite>](https://doi.org/10.1007/978-3-319-09982-8_3)
discusses this problem in detail
and cited several papers that did the calculations about the energy levels.

</details>

## Cutoff regularization

By analyzing the orders of magnitude, we see that we actually do not lose much
if we just simply cut off the sum at $n=\Lmd$.
This corresponds to a regularization method called the simple cutoff:
it replaces the infinite sum by a finite partial sum.
This can be generalized a little by considering a more general cutoff function $\chi$
such that $\lim_{x\to0^+}\fc \chi x=1$.
Then, an infinite sum $\sum_{n=1}^\infty\fc fn$ can be written as
$$\sum_{n=1}^\infty\fc fn=\lim_{\lmd\to0^+}\sum_{n=1}^\infty\fc fn\fc\chi{\lmd n}.$$
The simple cutoff is then the case where $\fc \chi x\ceq\fc\tht{1-x}$ and $\lmd\ceq1/\Lmd$,
where $\tht$ is the Heaviside step function.
For converging series, this gives the same result as the original sum
thanks to the dominated convergence theorem.

<details><summary>For diverging series</summary>

For diverging series, this may give a finite result.
For example, for $\fc fn\ceq\p{-1}^nn^k$, this method gives $-\fc\eta{-k}$
for any complex $k$ and any smooth enough $\chi$,
where $\eta$ is the [Dirichlet eta function](https://en.wikipedia.org/wiki/Dirichlet_eta_function).
Here is a check for the special case $\fc\chi x\ceq\e^{-x}$
(equivalent to the [Abel summation](https://en.wikipedia.org/wiki/Divergent_series#Abel_summation)).
By definition of the [polylogarithm](https://en.wikipedia.org/wiki/Polylogarithm), we have
$$\sum_{n=1}^\infty\p{-1}^nn^k\e^{-\lmd n}=\fc{\mrm{Li}_{-k}}{-\e^{-\lmd}}.$$
Now, substitute $\lmd=0$, and utilizing the identity $\fc{\mrm{Li}_s}{-1}=-\fc\eta s$,
we have the result $-\fc\eta{-k}$.

You may wonder what is the case for $\fc fn\ceq n^k$,
which is also a diverging series,
and it looks much like the case above.
However, the limit at $\lmd\to0^+$ simply does not exist when $\Re k\ge-1$
(i.e., when the series diverges).
This is because we have $\fc{\mrm{Li}_s}1=\fc\zeta s$ only for $\Re s>1$,
where $\zeta$ is the [Riemann zeta function](https://en.wikipedia.org/wiki/Riemann_zeta_function),
but it is undefined for other values of $s$.
If you analytically continue the result,
you will get the famous Rieman zeta function.

</details>

However, although this series may converge for any positive $\lmd$,
the limit as $\lmd\to0^+$ may not exist.
If it diverges because $\fc fn$ grows too fast
(or decays too slowly) as $n\to\infty$,
then we should expect that the sum also tends to infinity as $\lmd\to0^+$.
Assume that we can characterize this divergence by a Laurent series:
$$\sum_{n=1}^\infty\fc fn\fc\chi{\lmd n}
=\sum_{k=-\infty}^\infty\gma_k\lmd^k.$$ {#eq:cutoff1}
If the $\lmd\to0^+$ limit converge, we would expect $\gma_{k<0}$ to be zero,
and then the result is simply $\gma_0$.
Therefore, we may also want only $\gma_0$ when the limit does not exist.
To pick out $\gma_0$, utilize the residue theorem:
$$\sum_{n=1}^\infty\fc fn=\fr1{2\pi\i}\oint\fr{\d\lmd}\lmd
\sum_{n=1}^\infty\fc fn\fc\chi{\lmd n},$$ {#eq:cutoff2}
where the domain of $\lmd$ is now analytically continued from $\bR^+$
to a deleted neighborhood of $0$.
Equation [@eq:cutoff2] is then a generalized version of Equation [@eq:cutoff1].

Notice that I have been super slippery in math in the discussion.
For example, the Laurent series may not exist at all,
and the analytic continuation may not be possible at all;
even if they exist, the $\lmd\to0^+$ limit may also be different from $\gma_0$.
However, I may claim that we should be able to select smooth enough $\chi$ for all of these to work,
and the results will be independent of the choice of $\chi$
as long as Equation [@eq:cutoff2] works in this form.

Particularly, one can rigorously prove that for $\fc fn\ceq n^k$,
the sum obtained by this precedure is $\fc\zeta{-k}$,
where $\zeta$ is the [Riemann zeta function](https://en.wikipedia.org/wiki/Riemann_zeta_function),
as long as $x^k\fc\chi x$ has bounded $\p{k+2}$th derivative
and the sum converges.
This is proven in an interesting blog
[article](https://terrytao.wordpress.com/2010/04/10/the-euler-maclaurin-formula-bernoulli-numbers-the-zeta-function-and-real-variable-analytic-continuation/).

<details><summary>Alternative forms of cutoff regularization</summary>

In some cases, one may discover that $\sum_n\fc fn\fc\chi{\lmd n}$ is not analytic when $\lmd\to0^+$
so that the Laurent series expansion is not possible.
An example is $E_n\ceq\ln\ln n$ (for $n\ge2$) with no degeneracies
(this system also has a diverging partition function for any complex $\beta$).
In this case, if you try to use the cutoff function $\fc\chi x\ceq\e^{-x}$,
the sum goes like $\p{-\ln\lmd}^{-\beta}/\lmd$ instead of analytically when $\lmd\to0^+$.
Proving this is simple. We have
$$Z_\lmd=\sum_{n=2}^\infty\e^{-\lmd n}\p{\ln n}^{-\beta}
\approx\int_2^\infty\e^{-\lmd n}\p{\ln n}^{-\beta}\d n
=\fr1{\lmd\p{-\ln\lmd}^\beta}\int_{2\lmd}^\infty
\fr{\e^{-x}\,\d x}{\p{1-\ln x/\ln\lmd}^\beta},$$
where the last step uses the substitution $x\ceq\lmd n$.
Using the binomial theorem, we have
$$Z_\lmd\approx\fr1{\lmd\p{-\ln\lmd}^\beta}\int_{2\lmd}^\infty\d x\,\e^{-x}
\sum_{k=0}^\infty\binom{-\beta}k\p{\fr{\ln x}{-\ln\lmd}}^k,$$
where $\binom{-\beta}k$ is the binomial coefficient.
Note that $\fc{\Gma^{\p k}}z=\int_0^\infty x^{k-1}\p{\ln x}^k\e^{-zx}\d x$,
where $\Gma^{\p k}$ is the $k$th derivative to the Euler Gamma function,
so the integral for $x$ gives a factor $\fc{\Gma^{\p k}}1$
in the limit of $\lmd\to0^+$. Therefore,
$$Z_\lmd\approx\fr1{\lmd\p{-\ln\lmd}^\beta},$$
where only the $k=0$ term in the sum is retained for the leading contribution as $\lmd\to0^+$.

However, for any $k\in\bZ^+$, one can always choose functions $h,\chi$ so that the sum
$\sum_n\fc fn\fc\chi{\lmd\fc hn}$ goes like $\lmd^{-k}$ as $\lmd\to0^+$.
For example, for $\fc\chi x\ceq\e^{-x}$
(equivalent to the [Abelian mean](https://en.wikipedia.org/wiki/Divergent_series#Abelian_means)
or the [heat-kernel regularization](https://en.wikipedia.org/wiki/Zeta_function_regularization#Heat_kernel_regularization)),
we have
$$Z_\lmd\approx\int_{n_0}^\infty\e^{-\lmd\fc hn}\fc fn\d n
=\int_{\lmd\fc f{n_0}}^\infty\e^{-x}\fc f{\fc{h^{-1}}{\fr x\lmd}}\fr{\d x}{\lmd\fc{h'}{\fc{h^{-1}}{\fr x\lmd}}}.$$
We can choose $\fc hn\ceq\p{\int\fc fn\d n}^{1/k}$ so that
$$\fc f{\fc{h^{-1}}{\fr x\lmd}}=k\p{\fr x\lmd}^{k-1}\fc{h'}{\fc{h^{-1}}{\fr x\lmd}}.$$
Therefore, as $\lmd\to0^+$, we have
$$Z_\lmd\approx\fr1\lmd\int_{\lmd\fc f{n_0}}^\infty\e^{-x}k\p{\fr x\lmd}^{k-1}\,\d x\approx\fr{k!}{\lmd^k}.$$
However, this does not guarantee that the Laurent series expansion exists.
This is a good trial, though.
My math capacity does not allow me to confirm whether this is the case for the example of $E_n\ceq\ln\ln n$.

</details>

## Regularizing the hydrogen atom

After saying so much about cutoff regularization in general,
what does it say about the partition function of a hydrogen atom?
Try multiplying the cutoff function $\fc\chi{\lmd n}$ to the summand in Equation [@eq:Z]:
$$Z_\lmd\ceq\sum_{n=1}^\infty n^2\e^{\beta/2n^2}\fc\chi{\lmd n}
=\sum_{k=0}^\infty\fr{\p{\beta/2}^k}{k!}\sum_{n=1}^\infty n^{2-2k}\fc\chi{\lmd n}
\to\sum_{k=0}^\infty\fr{\p{\beta/2}^k}{k!}\fc\zeta{2k-2},$$ {#eq:Z-reg}
where the last step utilizes the result for $\fc fn\ceq n^k$,
with which we get rid of the dependence on $\lmd$.
The last expression is then identified as $Z$.

Now that we get the expression of $Z$, we can get some useful things.
However, this time we cannot simply use the summand divided by $Z$ to get the probability of each energy level
because that will break the normalization of the probability distribution.
What we can do, however, is to find the expectation value of the energy using $\a E=-\d\ln Z/\d\beta$.
On the other hand, we have $\a E\le p_1E_1+\p{1-p_1}E_\infty=-p_1/2$,
so the probability $1-p_1$ that the system is not in the ground state
is bounded above by $2\a E+1$.

The first check to do is to verify that this result is consistent with
the known behavior of the system at cold zero temperature,
where the system is almost certainly in the ground state;
in other words, $\lim_{\beta\to+\infty}\a E=-1/2$.
To get $Z$ for large $\beta$,
we notice that $\fc\zeta{+\infty}=1$, so $Z\approx\e^{\beta/2}$,
and this leads to $\a E\approx-1/2$ as expected.

Now, we may try to estimate $\a E$ for finite but large $\beta$ (e.g., $\beta=10^3$)
and thus give an upper bound for $1-p_1$.
We can study the asymptotic behavior of $\a E$ for cold positive temperature.
It turns out that $1-p_1\approx3\e^{-3\beta/8}$, which is $10^{-163}$ for $\beta=10^3$.
As we can see, without any physical arguments but only with regularization,
we get a result that seems sensible and well between the results in the last section
for a hydrogen atom confined in a box with a typical macroscopic size or the size of the universe.

<details><summary>Derivation of the asymptotic behavior at cold positive temperature</summary>

We have
$$Z=\sum_{k=0}^\infty\fr{\p{\beta/2}^k}{k!}\fc\zeta{2k-2},\quad
\fr{\d Z}{\d\beta}=\fr12\sum_{k=0}^\infty\fr{\p{\beta/2}^k}{k!}\fc\zeta{2k}.$$
Therefore,
$$Z-2\fr{\d Z}{\d\beta}=\sum_{k=0}^\infty\fr{\p{\beta/2}^k}{k!}
\p{\fc\zeta{2k-2}-\fc\zeta{2k}}.$$
We can try to find the asymptotic behavior of the coefficient of each term.
We have
$$\fc\zeta{2k-2}-\fc\zeta{2k}=\sum_{n=1}^\infty\p{\fr1{n^{2k-2}}-\fr1{n^{2k}}}
=\sum_{n=1}^\infty\fr{n^2-1}{n^{2k}}
=\fr{3}{2^{2k}}+\O{\fr1{3^{2k}}}.$$
We also have $\fc\zeta{2k-2}=1+\O{2^{-2k}}$, of course.
Therefore,
$$1-p_1\le2\a E+1=\fr{Z-2\d Z/\d\beta}Z
=\fr{\sum_k\fr{\p{\beta/2}^k}{k!}\p{\fr3{2^{2k}}+\O{\fr1{3^{2k}}}}}{\sum_k\fr{\p{\beta/2}^k}{k!}\p{1+\O{\fr1{2^{2k}}}}}.$$
These power series are then simply exponential functions.
Therefore,
$$1-p_1\le\fr{3\e^{\beta/8}+\O{\e^{\beta/18}}}{\e^{\beta/2}+\O{\e^{\beta/8}}}
=3\e^{-3\beta/8}+\O{\e^{-4\beta/9}}.$$ {#eq:1-p1}

</details>

Although the asymptotic behavior at cold temperature ($\beta\to+\infty$) looks good,
its behavior is very wrong at some regimes.
At some temperature, the monoticity of $\a E$ reverts,
and then it gets even lower than the ground state energy $-1/2$ and heads all the way to $-\infty$ at some finite temperature.This is clearly unphysical.
This suggests that it is wrong to use the regularized result.

<details><summary>Plots</summary>

<!--
Z[b_]=Sum[Zeta[2k-2](b/2)^k/k!,{k,1,Infinity}]
ZDataPts=Table[{b,N[Z[b]]},{b,-1,2,0.03}];
dZdbDataPts=Table[{b,N[Z'[b]]},{b,-1,2,0.03}];
EDataPts2=Table[{b,N[-Z'[b]/Z[b]]},{b,10.7,20.7,0.1}];
Export["Data.csv",ZDataPts,"CSV"]
Export["dZdbData.csv",dZdbDataPts,"CSV"]
Export["EData.csv",EDataPts2,"CSV"]
-->
<!--
#!/usr/bin/env python3

import matplotlib.pyplot as plt
import numpy as np
import csv

plt.rcParams.update({
	'text.usetex': True,
	'font.size': 11,
	'font.family': 'lmodern',
	'text.latex.preamble': r'''
		\usepackage{lmodern}
		\renewcommand{\d}{\mathrm{d}}
	'''
})
def savefig(filename):
	plt.savefig(filename, transparent=True, format='pdf', bbox_inches='tight')
	plt.figure()

bRoot = 1.07209
dbRoot = 0.55296
bECross = 11.2485
bEPeak = 13.80209489
ECross = -0.5
EPeak = -0.497781

def read_csv(filename):
	x_list = []
	y_list = []
	with open(filename) as file:
		for x, y in csv.reader(file):
			x_list.append(float(x))
			y_list.append(float(y))
	return np.array(x_list), np.array(y_list)

b, z = read_csv('ZData.csv')
b, dzdb = read_csv('dZdbData.csv')
plt.plot(b, z, label=r'$Z$')
plt.plot(b, dzdb, label=r'$\d Z/\d\beta$')
plt.axhline(0, color='black', linestyle='--')
plt.xlabel(r'$\beta$')
plt.xlim(b[0], b[-1])
plt.legend()
savefig('plotZ.pdf')

e_split = [[]]
i_start = [0]
for i in range(b.shape[0]-1):
	ei = -dzdb[i]/z[i]
	eip1 = -dzdb[i+1]/z[i+1]
	e_split[-1].append(ei)
	if abs(ei - eip1) > 10:
		e_split.append([])
		i_start.append(i+1)
e_split[-1].append(eip1)
for i in range(len(e_split)):
	plt.plot(b[i_start[i]:i_start[i]+len(e_split[i])], e_split[i], color='tab:blue')
plt.axvline(bRoot, linestyle='--', color='black')
plt.axvline(0, linestyle='--', color='black')
plt.xlabel(r'$\beta$')
plt.ylabel(r'$\left<E\right>$')
plt.ylim(-15, 15)
plt.xlim(b[0], b[-1])
savefig('plotE.pdf')

b, e = read_csv('EData.csv')
plt.plot(b, e)
plt.axhline(ECross, linestyle='--', color='black')
#plt.scatter([bECross, bEPeak], [ECross, EPeak])
plt.xlabel(r'$\beta$')
plt.ylabel(r'$\left<E\right>$')
plt.xlim(b[0], b[-1])
savefig('plotE2.pdf')
-->

Here is a plot that shows how $\a E$ starts to decrease with temperature at some point
and becomes even lower than the ground state energy:

![Plot of $\a E$ vs. $\beta$]({{page.figure}}plotE2.svg){.dark-adaptive .center}

Here is a plot that shows how $\a E$ goes to infinity at different temperatures:

![Plot of $\a E$ vs. $\beta$]({{page.figure}}plotE.svg){.dark-adaptive .center}

Here are also plots for $Z$ and $\d Z/\d\beta$, if you are curious:

![Plot of $Z$ and $\d Z/\d\beta$ vs. $\beta$]({{page.figure}}plotZ.svg){.dark-adaptive .center}

The two vertical asymptotes of $\a E$ corresponds to the two zeros of $Z$,
which are $\beta=0$ and $\beta=1.0721$.
It also has a zero, correponding to the zero of $\d Z/\d\beta$
at $\beta=0.5530$.
The point where $\a E=-1/2$ is $\beta=11.2486$,
and the point where $\a E$ has a local maximum is $\beta=13.8021$.

</details>

Another aspect where we can see that this result is wrong is that,
if we look at the hot negative temperature limit $\beta\to-\infty$,
although we have $\a E\to0=\sup_nE_n$ as expected,
it is approaching from the wrong side.
In fact, because $Z>0$ while $\d Z/\d\beta<0$ for $\beta<0$,
we have $\a E>0$ for $\beta<0$, exceeding the supremum of the energy levels, which is unphysical.

<details><summary>Derivation of the hot negative temperature limit</summary>

<!--
First, we need (see Equation 40 in
[Borwein et al., 2000](https://doi.org/10.1016/S0377-0427(00)00336-8))

$$\sum_{k=0}^\infty x^{2k}\fc\zeta{2k}=-\fr\pi2x\cot\pi x.$$

We can then extract $\fc\zeta{2k}$ from this using the residue theorem:

$$\fc\zeta{2k}=\fr1{2\pi\i}\oint\fr{\d x}{x^{2k+1}}\p{-\fr\pi2x\cot\pi x}.$$

Plug this into the expression of $Z$:

$$Z=\sum_{k=0}^\infty\fr{\p{\beta/2}^k}{k!}\fr1{2\pi\i}\oint\fr{\d x}{x^{2k-1}}\p{-\fr\pi2x\cot\pi x}
=\fr\i4\oint\d x\,x^2\e^{\beta/2x^2}\cot\pi x.$$
-->

Here is a non-rigorous derivation.
We can rewrite the regularized $Z$ in a similar form as
$$\begin{align*}
Z&=-\fr\beta4+\sum_{n=1}^\infty n^2\p{\e^{\beta/2n^2}-1-\fr\beta{2n^2}}\\
&=\lim_{N\to\infty}\p{-\p{\fr14+\fr N2}\beta-\fr16N\p{1+N}\p{1+2N}+\sum_{n=1}^Nn^2\e^{\beta/2n^2}}.
\end{align*}$$
For finite $N$, it has a straight line asymptote as $\beta\to-\infty$.
The envelope of this family of straight lines (parametrized by $N$)
is $Z=\p{1-6\beta}^{3/2}/36\sqrt3$, which means that
$Z\sim\p{-\beta}^{3/2}$ as $\beta\to-\infty$,
where "$\sim$" means that the ratio of the two sides approaches a positive constant.
Similarly, we have $\d Z/\d\beta\sim-\p{-\beta}^{1/2}$.
Therefore, $\a E\sim-\beta^{-1}$ as $\beta\to-\infty$.

</details>

<details><summary>Another regularization special to the hydrogen atom</summary>

Here is a special regularization method for the hydrogen atom
which is not applicable to general systems.
Consider the second derivative $\d^2Z/\d\beta^2$
by differentiating the summand twice w.r.t. $\beta$ in Equation [@eq:Z],
and then take twice antiderivative w.r.t. $\beta$.
This gives
$$Z=A+B\beta+\sum_{k=0}^\infty\fr{\p{\beta/2}^k}{k!}\fc\zeta{2k-2}
=A+B\beta+\sum_{n=1}^\infty n^2\p{\e^{\beta/2n^2}-1-\fr{\beta}{2n^2}},$$
where $A,B$ are integration constants.
The result from the cutoff regularization and the zeta function regularization
is simply $A=0$, $B=-1/4$.
What is interesting about this is that it already determines the
asymptotic behavior of $1-p_1$ at cold temperature,
which is $1-p_1\approx3\e^{-3\beta/8}$ (see Equation [@eq:1-p1]),
no matter what $A,B$ are.

</details>

## Zeta function regularization

For a series $\sum_n\fc fn$, if it diverges, we can instead consider
$\sum_n\fc fn^{-s}$ for some $s$ whose real part is big enough for the series to converge.
Then, we can try to analytically continue to $s=-1$ to get a finite result for the original series.
This is called the zeta function regularization.

<details><summary>When zeta function regularization fails</summary>

For the zeta function regularization to work,
the asymptotic behavior of $\fc fn$ needs to be a non-trivial power law as $n\to+\infty$.
Otherwise, the sum may not converge for any $s$.
For example, consider $E_n=\ln\ln n$ (with no degeneracies).
The partition function with zeta function regularization is
$$Z_s\ceq\sum_{n=2}^\infty\p{\ln n}^{\beta s}.$$
This series is divergent for any complex $s$.

</details>

A famous example is $\fc fn\ceq n$, which gives $\sum_nn=\fc\zeta{-1}=-1/12$.
Generally, for $\fc fn\ceq n^k$, we have $\sum_nn^k=\fc\zeta{-k}$.
This is the same as the result for the simple cutoff regularization.
This raises the question of whether the results obtained from those two methods are
necessary the same whenever they both exist.
I do not have a rigorous proof, but a strong argument is that
both of them are the result of some analytic continuation,
so they should be the same by the uniqueness of analytic continuation.

We can check this with the hydrogen atom.
We have, for $s>1/2$ and $\beta$ real,
$$Z_s\ceq\sum_{n=1}^\infty n^{-2s}\e^{-s\beta/2n^2}
=\sum_{k=0}^\infty\fr{\p{-s\beta/2}^k}{k!}\sum_{n=1}^\infty n^{-2s-2k}
=\sum_{k=0}^\infty\fr{\p{-s\beta/2}^k}{k!}\fc\zeta{2s+2k}.$$
Analytically continue this result to $s=-1$,
and then this gives the same result as Equation [@eq:Z-reg].
The rest will be the same as the last section.

## Can we trust this result?

However, can we trust this result, though?
Everything is becoming fishy.
Probabilities are no longer well-defined because how we normally derive them using $Z$
is causing a divergent sum of probabilities and thus invalid.
Yet somehow we are trying to estimate the bound of the probability of the system not being in the ground state
and getting an expected result.
You must have been feeling uncomfortable about this.

The first thing to ask is what we mean by "the expectation value"
when the probability distribution is not even well-defined.
If it means nothing physical, can we still trust its expression?
The simple answer is no.

As we already see, although the result at cold temperature is sensible,
the result at some regimes is clearly unphysical.
We can also see similar problems with other systems.
Consider the system that has energy levels $E_n=\ln n$ (with no degeneracies).
We can easily get $Z=\sum_nn^{-\beta}=\fc\zeta\beta$,
and thus there is a absi at $\beta=1$.
For $\beta>1$, $Z$ converges, and everything looks good.
For $\beta<1$, the system is so hot that $Z$ diverges.
Previous arguments suggest that, in this region, the regularized $Z$ is still $\fc\zeta\beta$.
However, we then have $\a E<0$ in this region, which is lower than the ground state energy.
This clearly should not be trusted.

In another aspect, we should note that since the estimation for $1-p_1$
does not depend on the size of the box confining the hydrogen atom,
its rough agreement with the result in the last section should be considered a coincidence.

Another thing to note is that the result of the regularizations depend on whether we "flatten" the energy levels.
We can "flatten" all the energy levels: pretend no degeneracies exist.
For example, suppose a system with $g_n\ceq n$ and $E_n\ceq n$.
However, we can rewrite the same system as $E_n\ceq1,2,2,3,3,3,\ldots$
(or equivalently $E_n\ceq\floor{\sqrt{2n}+1/2}$)[^A002024],
with no degeneracies.
This "re-grouping" of the energy levels can affect the result of regularizations
and whether a zeta function regularization exists.
For an immediate example, if we flatten the energy levels of the hydrogen atom,
the zeta function regularization does not exist.
Another simple example is that, for a system with $E_n=\mrm{const}$,
we can essentially re-group the all-degenerate states to have any positive integer sequence $g_n$
to get very arbitrary results for the partition function.

[^A002024]: This is [A002024](https://oeis.org/A002024) on OEIS.
Coincidentally, the OEIS number of this sequence is the same as the year
in which I am writing this article.

## Abscissa of convergence

Forget about the hydrogen atom, and let us consider a general system with (ever-increasing) energy levels $E_n$
and degeneracies $g_n$.
For a given system, there is an abscissa of convergence $\beta_\mrm c$,
below (hotter than) which the partition function diverges.
In other words, $Z\ceq\sum_ng_n\e^{-\beta E_n}$ converges for $\Re\beta>\beta_\mrm c$
and diverges for $\Re\beta<\beta_\mrm c$.
For most physical systems, we have $\beta_\mrm c=0$,
meaning that it can have any positive temperature, which sounds sensible.
The hydrogen atom has $\beta_\mrm c=+\infty$,
and a two-level system has $\beta_\mrm c=-\infty$.
A system with $E_n=\ln n$ and no degeneracy has $\beta_\mrm c=1$.

The term "abscissa of convergence" is borrowed from the study of
[general Dirichlet series](https://en.wikipedia.org/wiki/General_Dirichlet_series).
The form of $Z$ is indeed very much like a general Dirichlet series,
but a general Dirichlet series requires $E_\infty=+\infty$,
which is not true for the hydrogen atom.
However, the existence of an abscissa of convergence is still true for the more general case.

What does it mean physically to have an abscissa of convergence $\beta_\mrm c$?
First, if $\beta_\mrm c=-\infty$, then the system is well behaved at any temperature,
which is good and does not need further care.

If $\v{\beta_\mrm c}<\infty$, normally one should say the system
cannot reach a certain temperature:
the system can never be in equilibrium with a heat bath hotter than $\beta_\mrm c$.
Thermodynamically, one can say that the system needs to absorb an infinite amount of heat to reach this temperature.
One can see this easily by considering any sensible system, which has $\beta_\mrm c=0$:
for $\beta$ to go below zero means to make the temperature hotter than infinity,
which of course needs an infinite amount of heat intuitively.
One may want to see whether it is possible to regularize $Z$
to get a finite result for $\Re\beta<\beta_\mrm c$.
A valid claim to make is that, if $Z$ can be analytically continued to
the half real axis to the left of $\beta_\mrm c$,
then any sensible regularization of $Z$ there will give the same result as the analytic continuation.
Actually, the analytic continuation is exactly the zeta function regularization
if there is no degeneracy (or regarding degenerate states as different energy levels).
However, it is possible that the analytic continuation does not exist.
There may be a branch cut or a natural boundary.
For example, if $E_n\ceq\ln p_n$ with no degeneracy, where $p_n$ is the $n$th prime number, then $Z$ is the
[prime zeta function](https://en.wikipedia.org/wiki/Analytic_continuation#Example_I:_A_function_with_a_natural_boundary_at_zero_(the_prime_zeta_function)),
which has a natural boundary at $\Re\beta=0$.
Even if such a regularization exists, it should be questioned whether it is physical.

If $\beta_\mrm c=+\infty$, then the system is not well behaved at any temperature.
This is the case for the hydrogen atom.
Physically, this means that the system cannot be in equilibrium with a heat bath at any temperature.
The problem with regularization is the same as the case with $\v{\beta_\mrm c}<\infty$.

In a previous [article]({% post_url 2023-03-30-measure-ensemble %})
about statistical ensembles, when I defined the partition function,
I briefly mentioned that it is only defined for those intensive variables
($\beta$ in the context of this article) such that the partition function converges.
I did not talk about what to do with the partition function when it diverges,
but what that article implied is that it is simply undefined
and that no physical meaning should be assigned to it in principle.
The existence of an abscissa of convergence tells us that
there is a "hottest possible temperature" for any given system.
The hydrogen atom is symply the case where the hottest possible temperature
coincides with the coldest possible temperature (which is the absolute zero).
For most sensible systems, the hottest possible temperature is just the positive hot limit.
For systems such as $E_n\ceq\ln n$, the hottest possible temperature is a finite positive temperature,
which is at $3.16\times10^5\,\mrm K$,
resulting from $\beta_\mrm c=1$.
This can be conterintuitive at first, but one should realize that
it is not essentially different from the more common case of $\beta_\mrm c=0$.
