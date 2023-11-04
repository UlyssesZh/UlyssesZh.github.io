---
title: Hölder means inequality
date: 2022-11-11 16:42:37 -0800
categories:
- math
tags:
- calculus
- from zhihu
layout: post
excerpt: 'The Hölder mean of $\vec x$ with weights $\vec w$ and a parameter $p$ is defined as
$M_{p,\vec w}\!\left(\vec x\right):=\left(\vec w\cdot\vec x^p\right)^{\frac 1p}$,
and the value at $p=-\infty,0,+\infty$ are defined by the limits.
We can prove using Jensen''s inquality that the Hölder mean increases as $p$ increases.
This property can be used to prove HM-GM-AM-QM inequalities.'
---

*This article is translated from a
Chinese [article](https://zhuanlan.zhihu.com/p/85968527){:target="_blank"} on my Zhihu account.
The original article was posted at 2019-10-12 18:56 +0800.*

---

Some stipulations:

- Without special statements, all vectors appearing in this article are $n$-dimensional vectors, $n\in\mathbb N$;
- Iteration variable $k$ always iterates over $\left[0,n\right)\cup\mathbb Z$;
- $\operatorname{sum}\vec\xi:=\sum_k\xi_k$;
- $\operatorname{prod}\vec\xi:=\prod_k\xi_k$;
- If the independent and dependent variables of function $f$ are both scalars, then define
$f\!\left(\vec\xi\right):=\left(f\!\left(\xi_0\right),f\!\left(\xi_1\right),\ldots,f\!\left(\xi_n\right)\right)$;
- $\vec\xi^{\vec\eta}:=\prod_k\xi_k^{\eta_k}$;
- $\min\vec\xi:=\min_k\xi_k$;
- $\max\vec\xi:=\max_k\xi_k$;
- $\delta_{\xi,\eta}:=\begin{cases}1,&&\xi=\eta,\\\\0,&&\xi\ne\eta;\end{cases}$
- By saying $\vec\xi$ is congruent, all components of $\vec\xi$ are equal to each other.

**Definition 1**.
Suppose we have samples $\vec x\in\left(\mathbb R^+\right)^n$,
weights $\vec w\in\left\{\vec\xi\in\left(\mathbb R^+\right)^n\,\middle\|\,\operatorname{sum}\vec\xi=1\right\}$,
and parameter $p\in\left[-\infty,+\infty\right]$.
Define the Hölder mean by

$$M_{p,\vec w}\!\left(\vec x\right):=\left(\vec w\cdot\vec x^p\right)^{\frac 1p}.$$

*Note.*
The function is indefinite when $p\in\left\{-\infty,0,+\infty\right\}$,
but actually there exist limits

$$\lim_{p\to0}M_{p,\vec w}\!\left(\vec x\right)=\vec x^{\vec w},$$

$$\lim_{p\to-\infty}M_{p,\vec w}\!\left(\vec x\right)=\min\vec x,$$

$$\lim_{p\to+\infty}M_{p,\vec w}\!\left(\vec x\right)=\max\vec x.$$

The limits are to be proved as theorems later.
We can use them to define the Hölder mean for $p\in\left\{-\infty,0,+\infty\right\}$.

**Theorem 1**.

$$\lim_{p\to0}M_{p,\vec w}\!\left(\vec x\right)=\vec x^{\vec w}.$$

*Proof.*

$$\begin{aligned}
\lim_{p\to0}M_{p,\vec w}\!\left(\vec x\right)
&=\lim_{p\to0}\left(\vec w\cdot\vec x^p\right)^{\frac 1p}
&\text{(Definition 1)}\\
&=\lim_{p\to0}\exp\frac{\ln\!\left(\vec w\cdot\vec x^p\right)}p\\
&=\exp\lim_{p\to0}\frac{\ln\!\left(\vec w\cdot\vec x^p\right)}p\\
&=\exp\lim_{p\to0}\frac{\vec w\cdot\left(\vec x^p\ln\vec x\right)}{\vec w\cdot\vec x^p}
&\text{(L'Hôpital's rule)}\\
&=\exp\!\left(\vec w\cdot\ln\vec x\right)\\
&=\vec x^{\vec w}.
&\square
\end{aligned}$$

**Theorem 2**.

$$M_{p,\vec w}\!\left(\vec x\right)=M_{-p,\vec w}\!\left(\vec x^{-1}\right)^{-1}.$$

*Proof.*

$$\begin{aligned}
M_{p,\vec w}\!\left(\vec x\right)
&=\left(\vec w\cdot\vec x^p\right)^{\frac 1p}
&\text{(Definition 1)}\\
&=\left(\left(\vec w \cdot\left(\vec x^{-1}\right)^{-p}\right)^{-\frac1p}\right)^{-1}\\
&=M_{-p,\vec w}\!\left(\vec x^{-1}\right)^{-1}
&\text{(Definition 1)}\\
&&\square
\end{aligned}$$

**Theorem 3**.

$$\lim_{p\to+\infty}M_{p,\vec w}\!\left(\vec x\right)=\max\vec x.$$

*Proof.*
Because $\forall k:\frac{x_k}{\max\vec x}\le1$,
then $\lim_{p\to+\infty}\left(\frac{\vec x}{\max\vec x}\right)^p=\delta_{\max\vec x},\vec x$.

$$\begin{aligned}
\lim_{p\to+\infty}M_{p,\vec w}\!\left(\vec x\right)
&=\lim_{p\to+\infty}\left(\vec w\cdot\vec x^p\right)^{\frac 1p}
&\text{(Definition 1)}\\
&=\left(\max\vec x\right)\lim_{p\to+\infty}\left(\vec w\cdot\left(\frac{\vec x}{\max\vec x}\right)^p\right)^{\frac 1p}\\
&=\max\vec x\left(\vec w\cdot\lim_{p\to+\infty}\left(\frac x{\max\vec x}\right)^p\right)^{\lim_{p\to+\infty}\frac 1p}\\
&=\left(\max\vec x\right)\left(\vec w\cdot\delta_{\left(\max\vec x\right),\vec x}\right)^0\\
&=\max\vec x.
&\square
\end{aligned}$$

**Theorem 4**.

$$\lim_{p\to-\infty}M_{p,\vec w}\!\left(\vec x\right)=\min\vec x.$$

*Proof.*

$$\begin{aligned}
\lim_{p\to-\infty}M_{p,\vec w}\!\left(\vec x\right)
&=\lim_{p\to-\infty}M_{-p,\vec w}\!\left(\vec x^{-1}\right)^{-1}
&\text{(Theorem 2)}\\
&=\lim_{p\to+\infty}M_{p,\vec w}\!\left(\vec x^{-1}\right)^{-1}\\
&=\max\left(\vec x^{-1}\right)^{-1}
&\text{(Theorem 3)}\\
&=\min\vec x.
&\square
\end{aligned}$$

**Theorem 5**.
If $p>q$, then

$$M_{p,\vec w}\!\left(\vec x\right)\ge M_{q,\vec w}\!\left(\vec x\right),$$

he equality holds iff $\vec x$ is congruent.

*Proof.*
Case 1: $p>q>0$.

Let $f:\mathbb R^+\to\mathbb R^+:\xi\mapsto\xi^{\frac pq}$,
then it has second derivative

$$\frac{\mathrm d^2f\!\left(\xi\right)}{\mathrm d\xi^2}=\frac pq\left(\frac pq-1\right)\xi^{\frac pq-2}.$$

Because $p>q>0$,
then $\frac pq\left(\frac pq-1\right)>0$,
and then $\frac{\mathrm d^2f}{\mathrm d\xi^2}>0$,
i.e. $f$ is convex.
Therefore, according to Jensen's inequality,

$$\vec w\cdot f\!\left(\vec x^q\right)\ge f\!\left(\vec w\cdot\vec x^q\right),$$

i.e.

$$\vec w\cdot\vec x^p\ge\left(\vec w\cdot\vec x^q\right)^{\frac pq}.$$

Take $\frac1p$th power to both sides of the equation.
Without changing the direction of the inequality sign,
we have

$$\vec w\cdot\vec x^p\ge\vec w\cdot\vec x^q,$$

i.e. (according to Definition 1)

$$M_{p,\vec w}\!\left(\vec x\right)\ge M_{q,\vec w}\!\left(\vec x\right).$$

According to the condition for the equality to hold in Jensen's inequality,
the equality holds iff $\vec x$ is congruent.

Case 2: $p>q=0$.

Because the logarithm function is concave, according to Jensen's inequality,

$$\ln\!\left(\vec w\cdot\vec x^p\right)\ge\vec w\cdot\ln\vec x^p.$$

Take exponential on both sides of the equation, and we have

$$\vec w\cdot\vec x^p\ge\vec x^{p\vec w}.$$

Take $\frac1p$th power to both sides of the equation.
Without changing the direction of the inequality sign,
we have

$$\left(\vec w\cdot\vec x^p\right)^{\frac1p}\ge\vec x^{\vec w},$$

i.e. (according to Definition 1)

$$M_{p,\vec w}\!\left(\vec x\right)\ge M_{q,\vec w}\!\left(\vec x\right).$$

According to the condition for the equality to hold in Jensen's inequality,
the equality holds iff $\vec x$ is congruent.

Case 3: $p=0>q$.

$$\begin{align*}
M_{q,\vec w}\!\left(\vec x\right)
&=M_{-q,\vec w}\!\left(\vec x^{-1}\right)^{-1}
&\text{(Theorem 2)}\\
&\le M_{0,\vec w}\!\left(\vec x^{-1}\right)^{-1}
&\text{(Case 2)}\\
&=M_{0,\vec w}\!\left(\vec x\right).
&\text{(Theorem 2)}
\end{align*}$$

The equality holds iff $\vec x$ is congruent (Case 2).

Case 4: $0>p>q$.

Because $-q>-p>0$, we have

$$\begin{align*}
M_{q,\vec w}\!\left(\vec x\right)
&=M_{-q,\vec w}\!\left(\vec x^{-1}\right)^{-1}
&\text{(Theorem 2)}\\
&\le M_{-p,\vec w}\!\left(\vec x^{-1}\right)^{-1}
&\text{(Case 1)}\\
&=M_{p,\vec w}\!\left(\vec x\right).
&\text{(Theorem 2)}
\end{align*}$$

The equality holds iff $\vec x$ is congruent (Case 1).

By all 4 cases, the original proposition is proved. $\square$

**Corollary** (HM-GM-AM-QM inequalities).

$$\min\vec x\le n\left(\sum\vec x^{-1}\right)^{-1}
\le\left(\prod\vec x\right)^\frac1n
\le\frac{\sum\vec x}n
\le\sqrt{\frac{\sum\vec x^2}{n}}
\le\max\vec x,$$

where the equality holds iff $\vec x$ is congruent.

*Proof.*
Let $\vec w=\left(\frac1n,\dots,\frac1n\right)$.
Then according to Theorem 5,

$$M_{-\infty,\vec w}\!\left(\vec x\right)
\le M_{-1,\vec w}\!\left(\vec x\right)
\le M_{0,\vec w}\!\left(\vec x\right)
\le M_{1,\vec w}\!\left(\vec x\right)
\le M_{2,\vec w}\!\left(\vec x\right)
\le M_{+\infty,\vec w}\!\left(\vec x\right),$$

i.e. (according to Definition 1)

$$\min\vec x\le n\left(\sum\vec x^{-1}\right)^{-1}
\le\left(\prod\vec x\right)^\frac1n
\le\frac{\sum\vec x}n
\le\sqrt{\frac{\sum\vec x^2}{n}}
\le\max\vec x,$$

where the equality holds iff $\vec x$ is congruent (Theorem 5). $\square$
