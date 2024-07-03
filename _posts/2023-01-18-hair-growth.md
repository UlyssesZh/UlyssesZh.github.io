---
title: 'This is what will happen after you get a haircut'
date: 2023-01-18 12:11:41 -0800
categories:
- math
tags:
- calculus
- probability
- pde
layout: post
excerpt: 'Denote the length distribution of one''s hair to be $f(l,t)$,
where $l$ is hair length, and $t$ is time.
Considering that each hair may be lost naturally from time to time
(there is a probability of $\lambda\,\mathrm dt$ for each hair to be lost
within time range from $t$ to $t+\mathrm dt$)
and then restart growing from zero length,
how will the length distribution of hair evolve with time?
It turns out that we may model it with a first-order PDE.'
---

Denote the length distribution of one's hair to be $f(l,t)$.
This means that, at time $t$,
the number of hairs within the length range from $l$ to $l+\mathrm dl$
is $Nf\!\left(l,t\right)\mathrm dl$, where $N$ is the total number of hairs.

Each hair grows at constant speed $v$.
However, they cannot grow indefinitely because
there is a probability of $\lambda$ per unit time for a hair to be lost naturally
(this is the same assumption as the exponential decay).
After a hair is lost, it restarts growing from zero length.

Suppose that at $t=0$ you have got a haircut so that the hair length distribution becomes
$$f(l,0)=f_0(l).$$ {#eq:eq-initial-condition}
Then, how does the distribution evolve with time?

---

Because $f$ is a distribution function,
There is a normalization restriction on $f$:
$$\int_0^\infty f\!\left(l,t\right)\mathrm dl=1,\quad t\ge0.$$ {#eq:eq-normalization}
This normalization condition also applies to the initial condition ($t=0$).
This means that the function $f_0$ also satisfies the normalization restriction (Equation [@eq:eq-normalization])
$$\int_0^\infty f_0\!\left(l\right)\mathrm dl=1.$$ {#eq:eq-normalization-f0}
Because of the natural loss of hair,
only a $1-\lambda\,\mathrm dt$ portion of hair will survive $\mathrm dt$.
According to this, we can construct the following equation:
$$f\!\left(l+v\,\mathrm dt,t+\mathrm dt\right)=
\left(1-\lambda\,\mathrm dt\right)f\!\left(l,t\right).$$
This equation can be reduced to a first-order linear PDE:
$$v\frac{\partial f}{\partial l}+\frac{\partial f}{\partial t}+\lambda f=0.$$ {#eq:eq-pde}

Define $\theta\coloneqq l-vt$, and define a new function
$$g\!\left(\theta,t\right)\coloneqq f\!\left(\theta+vt,t\right).$$
Then,
$$\frac{\partial g}{\partial t}=v\frac{\partial f}{\partial l}+\frac{\partial f}{\partial t}.$$
Then, Equation [@eq:eq-pde] can be reduced to
$$\frac{\partial g}{\partial t}+\lambda g=0.$$
The solution is
$$g\!\left(\theta,t\right)=\Phi\!\left(\theta\right)\mathrm e^{-\lambda t},$$
where $\Phi$ is an arbitrary function defined on $\mathbb R$.
Therefore, the general solution to Equation [@eq:eq-pde] is
$$f\!\left(l,t\right)=\Phi\!\left(l-vt\right)\mathrm e^{-\lambda t}.$$ {#eq:eq-general-solution}

By utilizing Equation [@eq:eq-initial-condition], we can find $\Phi(\theta)$ for $\theta>0$.
Substitute $t=0$ into Equation [@eq:eq-general-solution]
and compare with Equation [@eq:eq-initial-condition],
and we have
$$\Phi(\theta>0)=f_0(\theta).$$ {#eq:eq-Phi-theta-0}
This only gives $\Phi(\theta)$ for $\theta>0$
because $f_0$ is not defined on negative numbers.
The rest of $\Phi$, however, may be deduced from Equation [@eq:eq-normalization].

Substitute Equation [@eq:eq-general-solution] into Equation [@eq:eq-normalization],
and we have
$$\begin{align*}
1&=\int_0^\infty\Phi\!\left(l-vt\right)\mathrm e^{-\lambda t}\,\mathrm dl\\
&=\mathrm e^{-\lambda t}\left(
  \int_0^{vt}\Phi\!\left(l-vt\right)\mathrm dl
  +\int_{vt}^\infty\Phi\!\left(l-vt\right)\mathrm dl
\right)\\
&=\mathrm e^{-\lambda t}\left(
  \int_{-vt}^0\Phi\!\left(\theta\right)\mathrm d\theta
  +\int_0^\infty f_0\!\left(\theta\right)\mathrm d\theta
\right)\\
&=\mathrm e^{-\lambda t}\left(1-\int_0^{-vt}\Phi\!\left(\theta\right)\mathrm d\theta\right).
\end{align*}$$
Therefore, we have the integral of $\Phi$ on negative intervals:
$$\int_0^{-vt}\Phi\!\left(\theta\right)\mathrm d\theta
=1-\mathrm e^{\lambda t}.$$
Find the derivative of both sides of the equation w.r.t. $t$, and we have
$$-v\Phi\!\left(-vt\right)=-\lambda\mathrm e^{\lambda t}.$$
In other words,
$$\Phi\!\left(\theta<0\right)=\frac\lambda v\mathrm e^{-\frac\lambda v\theta}.$$ {#eq:eq-Phi-theta-lt-0}

Combining Equation [@eq:eq-Phi-theta-0] and [@eq:eq-Phi-theta-lt-0]
and substituting back to Equation [@eq:eq-general-solution],
we can find the special solution to Equation [@eq:eq-pde]
subject to restrictions Equation [@eq:eq-normalization] and [@eq:eq-initial-condition]:
$$f(l,t)=\begin{cases}
\frac\lambda v\mathrm e^{-\frac\lambda vl},&0<l<vt,\\
\mathrm e^{-\lambda t}f_0(l-vt),&l>vt.
\end{cases}$$ {#eq:eq-solution}

This is our final answer.

---

This result is interesting in that any distribution will finally evolve
into an exponential distribution with the rate parameter being $\frac\lambda v$
as $t\to\infty$ no matter what the initial distribution is:
$$f(l,\infty)=\frac\lambda v\mathrm e^{-\frac\lambda vl}.$$
This distribution is the stationary solution to Equation [@eq:eq-pde].
This is actually a normal behavior for first-order PDEs.
For example,
the thermal equilibrium state is the stationary solution to the heat equation,
and any other solution approaches to the stationary solution over time.

This behavior can explain why human body hair tends to grow to only a certain length
instead of being indefinitely long.
You may try shaving your leg hair and wait for some weeks.
You can observe that they grow to approximately the original length but not any longer.
It is similar for your hair (on top of your head),
but $\lambda$ of hair is so small that it can hardly reach its terminal length
if you get haircuts regularly.

Another thing to note is that this may explain a phenomenon that we may observe:
the longer your hair is, the more slowly it grows,
and your hair no longer seems to grow when it reaches a certain length.
If the length of hair that we observe is actually the mean length of the hair, then it is
$$\mu(t)=\int_0^\infty lf\!\left(l,t\right)\mathrm dl
=\left(\mu_0-\frac v\lambda\right)\mathrm e^{-\lambda t}+\frac v\lambda,$$
where $\mu_0$ is the mean of the distribution $f_0$.
It can be seen that the growth rate of the mean length of hair varies exponentially.
