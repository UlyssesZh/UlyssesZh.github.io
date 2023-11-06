---
title: 'Relationship between the Gini coefficient and the variance'
date: 2023-02-06 16:38:25 -0800
categories:
- economics
tags:
- from zhihu
- calculus
- probability
layout: post
excerpt: 'Both the Gini coefficient and the variance are measures of statistical dispersion.
We are then motivated to find the relationship between them.
It turns out that there is a neat mathematical relationship between them.'
---

*This article is translated from a
Chinese [article](https://zhuanlan.zhihu.com/p/367530273){target="_blank"} on my Zhihu account.
The original article was posted at 2021-04-25 10:06 +0800.*

---

First, define the Lorenz curve:
it is the curve that consists of all points $(u,v)$ such that
the poorest $u$ portion of population in the country owns $v$ portion of the total wealth.

The Gini coefficient $G/\mu$ is defined as the area between the Lorenz curve and the line $u=v$
divided by the area enclosed by the three lines $u=v$, $v=0$, and $u=1$.

Now, suppose the wealth distribution in the country is $p(X)$,
where $p\!\left(x\right)\mathrm dx$ is the portion of population that has wealth
in the range $[x,x+\mathrm dx]$.

Then, the Lorenz curve is the graph of the function $g$ defined as

$$g(F(x))=\frac1\mu\int_{-\infty}^xtp\!\left(t\right)\mathrm dt,$$

where

$$F\!\left(x\right):=\int_{-\infty}^xp\!\left(t\right)\mathrm dt$$

is the cumulative distribution function of $p(X)$, and

$$\mu:=\int_{-\infty}^{+\infty}tp\!\left(t\right)\mathrm dt$$ {#eq:eq-def-mu}

is the average wealth of the population, which is just $\mathrm E[\mathrm X]$
($X$ is a random variable such that $X\sim p(X)$).

Then, the Lorenz curve is

$$v=g(u):=\frac1\mu\int_{-\infty}^{F^{-1}(u)}tp\!\left(t\right)\mathrm dt.$$

According to the definition of the Gini coefficient,

$$\begin{align*}
G&:=2\mu\int_0^1\left(u-g(u)\right)\mathrm du\\
&=\mu-2\mu\int_0^1g\!\left(u\right)\mathrm du\\
&=\mu-2\int_{u=0}^1\int_{t=-\infty}^{F^{-1}(u)}tp\!\left(t\right)\mathrm dt\,\mathrm du.
\end{align*}$$

Interchange the order of integration, and we have

$$\begin{align*}
G&=\mu-2\int_{t=-\infty}^{+\infty}\int_{u=F(t)}^1tp\!\left(t\right)\mathrm dt\,\mathrm du\\
&=\mu-2\int_{-\infty}^{+\infty}\left(1-F(t)\right)tp\!\left(t\right)\mathrm dt.
\end{align*}$$

Substitute Equation [@eq:eq-def-mu] into the above equation, and we have

$$\begin{align*}
G&=\int_{-\infty}^{+\infty}2tF\!\left(t\right)p\!\left(t\right)\mathrm dt-\mu\\
&=\int_{-\infty}^{+\infty}\left(2tF\!\left(t\right)-1\right)tp\!\left(t\right)\mathrm dt\\
&=\int_0^1\left(2u-1\right)F^{-1}\!\left(u\right)\mathrm du.
\end{align*}$$

Now here is the neat part.
Separate it into two parts, and write them in double integrals:

$$\begin{align*}
G&=\int_0^1uF^{-1}\!\left(u\right)\mathrm du-\int_0^1\left(1-u\right)F^{-1}\!\left(u\right)\mathrm du\\
&=\int_{u_2=0}^1\int_{u_1=0}^{u_2}F^{-1}\!\left(u_2\right)\mathrm du_1\,\mathrm du_2
-\int_{u_1=0}^1\int_{u_2=u_1}^1F^{-1}\!\left(u_1\right)\mathrm du_1\,\mathrm du_2.
\end{align*}$$

Interchange the order of integration of the second term, and we have

$$\begin{align*}
G&=\int_{u_2=0}^1\int_{u_1=0}^{u_2}\left(F^{-1}\!\left(u_2\right)-F^{-1}\!\left(u_1\right)\right)\mathrm du_1\,\mathrm du_2\\
&=\frac12\int_{u_2=0}^1\int_{u_1=0}^1\left|F^{-1}\!\left(u_2\right)-F^{-1}\!\left(u_1\right)\right|\mathrm du_1\,\mathrm du_2\\
&=\frac12\int_{-\infty}^{+\infty}\int_{-\infty}^{+\infty}\left|x_2-x_1\right|p\!\left(x_1\right)p\!\left(x_2\right)\mathrm dx_1\,\mathrm dx_2\\
&=\frac12\mathrm E\!\left[\left|X_2-X_1\right|\right],
\end{align*}$$

where $X_1$ and $X_2$ are two independent random variables with $p$ being their respective distribution functions:
$\left(X_1,X_2\right)\sim p\!\left(X_1\right)p\!\left(X_2\right)$.

By this result, we can easily see how the Gini coefficient represents the statistical dispersion.

We can apply similar tricks to the variance $\sigma_X^2$.

$$\begin{align*}
\sigma_X^2&=\mathrm E\!\left[X^2\right]-\mathrm E\!\left[X\right]^2\\
&=\int_{-\infty}^{+\infty}t^2p\!\left(t\right)\mathrm dt
-\left(\int_{-\infty}^{+\infty}tp\!\left(t\right)\mathrm dt\right)^2\\
&=\int_0^1F^{-1}\!\left(u\right)^2\,\mathrm du
-\left(\int_0^1F^{-1}\!\left(u\right)\mathrm du\right)^2.
\end{align*}$$

Separate the first into two halves, and write the altogether three terms in double integrals:

$$\begin{align*}
\sigma_X^2&=\frac12\int_0^1F^{-1}\!\left(u_2\right)^2\,\mathrm du_2\int_0^1\mathrm du_1\\
&\phantom{=~}{}-\int_0^1F^{-1}\!\left(u_1\right)\mathrm du_1\int_0^1F^{-1}\!\left(u_2\right)\mathrm du_2\\
&\phantom{=~}{}+\frac12\int_0^1F^{-1}\!\left(u_1\right)^2\,\mathrm du_1\int_0^1\mathrm du_2\\
&=\frac12\int_0^1\int_0^1
\left(F^{-1}\!\left(u_2\right)^2-2F^{-1}\!\left(u_1\right)F^{-1}\!\left(u_2\right)+F^{-1}\!\left(u_1\right)^2\right)
\mathrm du_1\,\mathrm du_2\\
&=\frac12\int_{-\infty}^{+\infty}\int_{-\infty}^{+\infty}
\left(x_2-x_1\right)^2p\!\left(x_1\right)p\!\left(x_2\right)\mathrm dx_1\,\mathrm dx_2\\
&=\frac12\mathrm E\!\left[\left(X_2-X_1\right)^2\right].
\end{align*}$$

Then we can derive the relationship between the Gini coefficient and the variance:

$$2\sigma_X^2-4G^2=\sigma_{\left|X_2-X_2\right|}^2.$$
