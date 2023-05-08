---
title: 'Free trade (single good case)'
date: 2023-05-01 17:10:11 -0700
categories:
- economics
tags:
- global economy
- from zhihu
layout: post
excerpt: 'I set up a simple model to determine the production and consumption
in free trade between nations.'
---

*This article is translated from a Chinese [article](https://zhuanlan.zhihu.com/p/424773907) on my Zhihu account.
The original article was posted at 2021-04-26 14:27 +0800.*

---

## The general model

The model is as follows.
There are $n$ agents (nations), they can trade some type of good,
and they use the same currency.
Every agent may produce or consume the good.
The benefit function of the $j$th agent is $B_j$,
and the cost function is $C_j$.
The amount of export from the $j$th agent to the $k$th agent is $T_{j,k}$.
The amount of trade cost by the $j$th agent is $S_j$.
Now, we want to find the amount $Q_j$ that every agent produce
and the amount $T_{j,k}$ that every agent import from other agents.
Assume that $S$ is only related to $T$ and does not depend on $Q$.
Also, assume that there is no externality (i.e. whenever $j\ne k$,
$\partial_kB_j=0$ and $\partial_kC_j=0$).
Also, assume that every agent is rational and with perfect information.

Now, consider the profit $\Pi_j$ of the $j$th agent.
Subtract the cost from the benefit, and we have

$$\textstyle
\Pi_j=B_j\!\left(Q_j+\sum_kT_{j,k}\right)-C_j\!\left(Q_j\right)-S_j\!\left(T\right).$$

According to the fundamental theorem of welfare economics,
$T$ and $Q$ is Pareto optimal under market equilibrium.
We assume that this case happens at the stationary point of the social benefit,
and the social benefit is the sum of the profit of every agent.
We can then get the equations

$$\begin{align*}
&0=\frac{\partial}{\partial Q_l}\sum_j\Pi_j
=B_l'\!\left(Q_l+\sum_kT_{l,k}\right)-C_l'\!\left(Q_l\right),\quad\forall l;\\
&0=\frac{\partial}{\partial T_{l,k}}\sum_j\Pi_j
=B_l'\!\left(Q_l+\sum_kT_{l,k}\right)-B_m'\!\left(Q_m+\sum_kT_{m,k}\right)
-\sum_j\frac{\partial S_j}{\partial T_{l,m}}\!\left(T\right),\quad\forall l<m.
\end{align*}$$

Here are $n+\frac{n\left(n-1\right)}2$ equations,
and exactly $Q$ and $T$ have $n+\frac{n\left(n-1\right)}2$ degrees of freedom in total
(note that $T$ is anti-symmetric).
In principle, we are able to solve $Q$ and $T$.

## Zero trade cost

For the case where there is no trade cost,
we can see that the domestic prices are all equal, and the price may be called the world price.

However, given $S=0$, the equations above are not independent.
Actually, there are only $2n-1$ independent equations
(all $2n$ components of $B'$ and $C'$ are equal).
This means that, for $n>2$, the free trade with zero trade cost is an **indeterminate system**.

This phenomenon looks counter-intuitive, but it is actually understandable:
under zero trade cost, every two agents may trade arbitrary amount of goods under the same world price,
this provides extra degrees of freedom to the model.
To be specific, if $(Q,T)$ is a solution to the model,
then $(Q,T+\Delta T)$ is also a solution, where the anti-symmetric matrix $\Delta T$ satisfies

$$\sum_k\Delta T_{j,k}=0,\quad\forall j,$$

where there are $n-1$ independent equations in the $n$ equations.
Therefore, the total number of degrees of freedom in the solution of the model is

$$n+\frac{n\left(n-1\right)}2-\left(\frac{n\left(n-1\right)}2-\left(n-1\right)\right)=2n-1.$$

Now, the useful quantities that we can solve is
the production and the net-import $T_j:=\sum_kT_{j,k}$ of every agent.
Note that the net-import actually has only $n-1$ degrees of freedom because of the restriction $\sum_jT_j=0$.

## The middleman (re-exportation)

It is worth pointing out that the existence of the middleman or re-exportation
is completely due to the presence of trade cost.
Here we consider a simplified problem:
there are three agents playing respectively as the producer, the retailer, and the customer.
The producer does not consume (the benefit is $0$);
the customer does not produce (the cost and the marginal cost is infinity);
and the retailer does not produce or consume.
Assume that the trade between any two of them does not bring cost to the third one.
Then, the social benefit is

$$\Pi=B\!\left(T_{\mathrm c,\mathrm r}+T_{\mathrm c,\mathrm p}\right)
-C\!\left(T_{\mathrm c,\mathrm p}+T_{\mathrm r,\mathrm p}\right)
-S_\mathrm c\!\left(T_{\mathrm c,\mathrm r},T_{\mathrm c,\mathrm p}\right)
-S_\mathrm r\!\left(T_{\mathrm c,\mathrm r},T_{\mathrm r,\mathrm p}\right)
-S_\mathrm p\!\left(T_{\mathrm c,\mathrm p},T_{\mathrm r,\mathrm p}\right).$$
