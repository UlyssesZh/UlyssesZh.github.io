---
title: Thoughts on a middle school thermal physics problem
date: 2022-11-06 09:21:56 -08:00
categories:
- physics
tags:
- calculus
layout: post
---

*This article is translated from a
Chinese [article](https://zhuanlan.zhihu.com/p/60146217){:target="_blank"} on my Zhihu account.
The original article was posted at 2019-03-22 21:49.*

---

> A field construction requires heating an aluminum alloy component of mass
$4.2\,\mathrm{kg}$ from $10^\circ\mathrm{C}$ to $63^\circ\mathrm{C}$ or above.
Now, we only have $1.2\,\mathrm{kg}$ of water of $90^\circ\mathrm{C}$ in the thermos.
Ignoring heat dissipation, design a method to heat the component.

These texts are adapted from some competition problem from Zhejiang.
Just throwing the component into the water is not the correct method.
The correct answer is to divide the hot water into $3$ (or more) parts of equal mass,
and heat the components for $3$ times.

The more parts we separate the hot water into, the higher the final temperature of the component is.
This can trigger our thoughts: what is the final temperature  if the number of parts tends to infinity?

Suppose the heat capacity of the component is $C_0$,
the initial temperature is $T_0$;
the heat capacity of hot water is $C$,
the temperature is $T$.
Separate the hot water into $n$ parts of equal heat capacity (i.e. equal mass).
Suppose the temperature of the component is $T_m$ after reaching thermal equilibrium with the $m$th part of the water.
Then, the final temperature is $T_n$.

We now want to find the final temperature at $n\to\infty$:

$$T':=\lim_{n\to\infty}T_n.$$

According to the formula of thermal equilibrium,

$$C_0\left(T_{m+1}-T_m\right)+\frac Cn\left(T_{m+1}-T\right)=0.$$

Solve for $T_{m+1}$:

$$T_{m+1}=\frac{C_0T_m+\frac CnT}{C_0+\frac Cn}.$$

Let $k:=\frac{C_0}{C_0+\frac Cn}$, and $b:=\frac{\frac CnT}{C_0+\frac Cn}$,
and we have

$$T_{m+1}=kT_m+b.$$

Let $m:=0,1,\ldots,n-1$ respectively, and we have

$$\begin{align*}
T_1&=kT_0+b,\\
T_2&=kT_1+b,\\
&\vdots\\
T_n&=kT_{n-1}+b.
\end{align*}$$

Transform the $n$ equations a little, and we have

$$\begin{align*}
k^{n-1}T_1&=k^nT_0+k^{n-1}b,
k^{n-2}T_2&=k^{n-1}T_1+k^{n-2}b,
&\vdots\\
T_n=kT_{n-1}+b.
\end{align*}$$

Sum up all the $n$ equations, and we have

$$T_n=k^nT_0+\sum_{j=0}^{n-1}k^jb.$$

According to the formula for summation of geometric progression, we have

$$T_n=k^nT_0+\frac{1-k^n}{1-k}b$$

(this is actually the formula for the $n$th recursion of linear function.)

Because

$$\begin{align*}
b&:=\frac{\frac CnT}{C_0+\frac Cn}\\
&=\frac{C_0}{C_0+\frac Cn}\frac{\frac CnT}{C_0}\\
&=\frac{C_0}{C_0+\frac Cn}\left(\frac{C_0+\frac Cn}{C_0}-1\right)T\\
&=\left(1-\frac{C_0}{C_0+\frac Cn}\right)T,
\end{align*}$$

then

$$\begin{align*}
T_n&=k^nT_0+\frac{1-k^n}{1-k}\left(1-k\right)T\\
&=T+k^n\left(T_0-T\right).
\end{align*}$$

Now calculate the limit of $k^n$. We have

$$\begin{align*}
\lim_{n\to\infty}k^n&=\lim_{n\to\infty}\left(\frac{C_0}{C_0+\frac Cn}\right)^n\\
&=\lim_{n\to\infty}\frac1{\left(\frac{C_0+\frac Cn}{C_0}\right)^n}\\
&=\lim_{n\to\infty}\frac{1}{\left(1+\frac{\frac C{C_0}}{n}\right)^n}\\
&=\mathrm e^{-\frac C{C_0}}.
\end{align*}$$

Therefore,

$$\begin{align*}
T'&:=\lim_{n\to\infty}T_n\\
&=T+\mathrm e^{-\frac C{C_0}}\left(T_0-T\right).
\end{align*}$$

This is a intuitive result.

(Gonna take exams for high school entrance...)
