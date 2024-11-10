---
title: Using electrostatics to calculate the Fourier transform of inverse square
date: 2024-10-14 22:40:02 -0700
categories:
- math
tags:
- electrodynamics
- fourier transform
- pde
layout: post
excerpt: 'The Fourier transform of $1/x^2$ looks like an electric field:
in 1D, it is that of a uniformly charged plane; in 2D, it is a uniformly charged line;
in 3D, it is a point charge.'
---

<details>
<summary>Conventions</summary>

The unit system I will use in this article is the
[Heaviside--Lorentz units](https://en.wikipedia.org/wiki/Heaviside%E2%80%93Lorentz_units)
($\veps_0=\mu_0=1$).
The reason is that we are going to consider electrodynamics in $d\ne3$ dimensions,
and this unit system allows us to write $\nabla^2\Phi=-\rho$ in any dimension.

The convention for Fourier transformation is $\fc{\fc{\mcal F}f}k=\int\fc fx\e^{-\i kx}\,\d x$,
so there is a factor of $\p{2\pi}^{-d}$ in the inverse transform.

</details>

Define $\fc{f_d}{x}\ceq 1/x^2$ for non-zero $x\in\bR^d$, where $x^2$ is the Euclidean norm squared of $x$.
The question is now to calculate the Fourier transform $\fc{\mcal F}{f_d}$ of $f_d$.

Let us start by considering the 1D case.
We need to calculate
$$\fc{\fc{\mcal F}{f_1}}k=\int\fr1{x^2}\e^{-\i kx}\,\d x.$$
It seems that the integral diverges because of the singularity at $x=0$.
However, we can fix this by integrating by parts and then take the
[Cauchy principal value](https://en.wikipedia.org/wiki/Cauchy_principal_value):
$$\begin{align*}
	\fc{\fc{\mcal F}{f_1}}k&=\int\fr1{x^2}\e^{-\i kx}\,\d x\\
	&=-\i k\int\fr1x\e^{-\i kx}\,\d x\\
	&=-\i k\int_0^\infty\p{\fr{\e^{-\i kx}}x-\fr{\e^{\i kx}}{x}}\d x\\
	&=-\pi k\sgn k,
\end{align*}$$
where the last step is the [Dirichlet integral](https://en.wikipedia.org/wiki/Dirichlet_integral).

If you think this is too hand-wavy, here are some facts for nerdy rigor.
What is going on here is that we actually defined $f_1$ to be (the negative of) the
[distributional derivative](https://en.wikipedia.org/wiki/Distribution_(mathematics)#Differentiation_of_distributions)
of the distribution $\mrm{p.v.}\p{1/x}$,
sometimes simply called the [principal value](https://en.wikipedia.org/wiki/Cauchy_principal_value#Distribution_theory).
Then all the results can be proven mathematically.

Let us head stright to the 2D case.
