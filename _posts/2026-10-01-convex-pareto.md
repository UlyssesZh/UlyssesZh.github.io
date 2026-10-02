---
title: The Pareto set of distance preference relations and the closed convex hull of their ideal points
date: 2026-10-01 16:03:46 -0700
categories:
  - math
tags:
  - functional analysis
  - preference relation
  - pareto efficiency
  - convex analysis
  - long paper
layout: post
excerpt: >
  The distance preference relation is the preference relation over a metric space
  where points nearer to the ideal point are preferred.
  Suppose there are some agents with distance preference relations over a real normed space,
  then the Pareto set of them may contain or be contained by the closed convex hull of their ideal points.
  This article completely classifies normed spaces based on whether the property holds
  for finite, bounded, or arbitrary sets of ideal points.
---

## Introduction

For a real normed space $X$, let $S\subseteq X$ and $x\in X$.
Define
$$\fc I{S,x}\ceq\bigcap_{a\in S}\fc B{a,\V{x-a}},\qquad
\fc{\bar I}{S,x}\ceq\bigcap_{a\in S}\fc{\bar B}{a,\V{x-a}}$$ {#eq:pareto-improvements}
(specially, $\fc I{\varnothing,x}=\fc{\bar I}{\varnothing,x}=X$),
where
$$\fc B{a,r}\ceq\set{y\in X}{\V{y-a}<r},\qquad
\fc{\bar B}{a,r}\ceq\set{y\in X}{\V{y-a}\le r}$$
denote the respectively open and closed ball centered at $a$ with radius $r$, and
$$\fc PS\ceq\set{x\in X}{\fc I{S,x}=\varnothing},\qquad
\fc{\bar P}S\ceq\set{x\in X}{\fc{\bar I}{S,x}=\B x}.$$ {#eq:pareto-sets}
This article presents a complete analysis of the four properties:
$$P_1:\qquad \opn{\overline{conv}}S\subseteq\fc PS,\qquad
\bar P_1:\qquad \opn{\overline{conv}}S\subseteq\fc{\bar P}S,$$
$$P_2:\qquad \fc PS\subseteq\opn{\overline{conv}}S,\qquad
\bar P_2:\qquad \fc{\bar P}S\subseteq\opn{\overline{conv}}S,$$
where $\opn{\overline{conv}}S$ denotes the
[closed convex hull](https://en.wikipedia.org/wiki/Convex_hull#Closed_and_open_hulls)
of $S$.

Based on the property of $S$, the two properties multiply to twelve properties:
$P_{1,2}^\mrm f$ means $P_{1,2}$ holds for all finite $S\subseteq X$;
$P_{1,2}^\mrm b$ means $P_{1,2}$ holds for all bounded $S\subseteq X$;
$P_{1,2}^\mrm a$ means $P_{1,2}$ holds for all $S\subseteq X$;
and similarly for $\bar P_{1,2}^{\mrm f,\mrm b,\mrm a}$.

Some of the properties are stronger than others.
First, all finite sets are bounded.
Second, we can easily see that $\fc{\bar P}S\subseteq\fc PS$.
Therefore,
$$P_{1,2}^\mrm a\Rightarrow P_{1,2}^\mrm b\Rightarrow P_{1,2}^\mrm f,\qquad
\bar P_{1,2}^\mrm a\Rightarrow \bar P_{1,2}^\mrm b\Rightarrow \bar P_{1,2}^\mrm f,$$
$$\bar P_1^{\mrm f,\mrm b,\mrm a}\Rightarrow P_1^{\mrm f,\mrm b,\mrm a},\qquad
P_2^{\mrm f,\mrm b,\mrm a}\Rightarrow \bar P_2^{\mrm f,\mrm b,\mrm a}.$$

The complete classification of these properties across all real normed spaces is summarized in the following table:

| Property | Characterization |
|-|-|
| $P_1^{\mrm f,\mrm b}$ | inner product space or plane |
| $\bar P_1^{\mrm f,\mrm b},P_2^{\mrm f,\mrm b}$ | inner product space or strictly convex plane |
| $P_1^\mrm a$ | inner product space or asymptotically balanced plane |
| $\bar P_1^\mrm a$ | inner product space or strictly convex asymptotically balanced plane |
| $\bar P_2^\mrm f$ | ? (between: inner product space or plane; infinite-dimensional space or inner product space or plane) |
| $\bar P_2^\mrm b$ | ? (between: inner product space or plane; infinite-dimensional space or inner product space or plane) |
| $P_2^\mrm a$ | Hilbert space or strictly convex plane |
| $\bar P_2^\mrm a$ | Hilbert space or plane |

<p class="no-indent">
Here, a plane means a two-dimensional real normed space.
See Definition [@thm:asymptotically-balanced]
for the definition of being asymptotically balanced.
</p>

In the following sections, a vector space is assumed to be over the real numbers unless otherwise specified.

## Background

The background of this study is in economics,
where preference relations and Pareto efficiency are studied.

My motivation of studying the properties originates from
[my previous article]({% post_url 2023-03-25-voting-pareto %}) on voting systems,
dates back to more than three years ago.

In the end of that article, I used an example of this preference relation:
an agent prefers points nearer to the ideal point.
Mathematically, it says that in the metric space $\p{X,d}$,
for an agent with ideal point $a\in X$, $y\succeq x$ iff $\fc d{y,a}\le\fc d{x,a}$.
Such a preference relation is what I call a <dfn>distance preference relation</dfn>.

That article also focuses on the concept of Pareto efficiency, or particularly, weak Pareto efficiency.
Suppose that we have a set $S$ of agents,
and we denote the preference relation of each agent $a\in S$ as $\succeq_a$,
and suppose all preference relations are complete over a space $X$.
Then, we say $y\in X$ is a <dfn>strong Pareto improvement</dfn> of $x\in X$
iff $\forall a\in S:y\succ_a x$;
$y$ is a <dfn>weak Pareto improvement</dfn> of $x$
iff $\forall a\in S:y\succeq_a x$.
Note that neither concept is the actual definition of Pareto improvement used in economics,
which says that $y$ is an <dfn>(economic) Pareto improvement</dfn> of $x$
iff $\forall a\in S:y\succeq_a x$ and $\exists a\in S:y\succ_a x$.
However, since the weak Pareto improvement and the strong Pareto improvement
have simpler mathematical definitions, they will be the focus of this article.

The set of all strong Pareto improvements of $x$ is denoted as $\fc I{S,x}$.
We say $x$ is <dfn>weak Pareto optimal</dfn> iff $\fc I{S,x}=\varnothing$,
and the <dfn>weak Pareto set</dfn> is the set of all weak Pareto optimals, denoted as $\fc PS$.
Similarly, we can denote the set of weak Pareto improvements as $\fc{\bar I}{S,x}$.
We say $x$ is <dfn>strong Pareto optimal</dfn> iff $\fc{\bar I}{S,x}=\B x$,
and the <dfn>strong Pareto set</dfn> $\fc{\bar P}S$ is the set of all strong Pareto optimals.
When $X$ is a metric space and the preference relations are distance preference relations,
the definitions of $\fc I{S,x}$, $\fc{\bar I}{S,x}$, $\fc PS$, and $\fc{\bar P}S$
match exactly with the definitions in Equation [@eq:pareto-improvements] and Equation [@eq:pareto-sets].

In the end of my previous article referenced here,
there was an example taking $X$ as a Euclidean plane as an example.
There was a figure visualizing the weak Pareto sets for finite numbers of agents,
but I never explained how I derived the weak Pareto sets.
From the figure, it seems that the weak Pareto set is the convex hull of the ideal points of the agents.
I originally planned to prove this in that article,
but it turned out that it was too difficult, so I just left it without justification.

## Preliminaries

<p class="no-indent">
**Theorem {#thm:not-strictly-convex-to-not-p2f}.**
If a normed space is not [strictly convex](https://en.wikipedia.org/wiki/Strictly_convex_space),
then it does not satisfy $P_2^\mrm f$.
</p>

<details><summary>Proof</summary>

Let $X$ be a normed space that is not strictly convex.
Its unit sphere contains a nontrivial line segment,
so ther exist distinct unit vectors $u,v\in X$ such that $\V{u+v}=2$.
Set $S\ceq\B{u,-v}$.

Suppose for contradiction that
$$y\in\fc I{S,0}=\fc B{u,1}\cap\fc B{-v,1}.$$
We then have $\V{y-u}<1$ and $\V{y-\p{-v}}<1$.
The triangle inequality gives
$$2=\V{u+v}\le\V{u-y}+\V{y-\p{-v}}<1+1=2,$$
a contradiction.
Therefore, $\fc I{S,0}=\varnothing$, so $0\in\fc PS$.

Suppose for contradiction that
$$0\in\opn{\overline{conv}}S=\set{\lmd u-\p{1-\lmd}v}{\lmd\in\b{0,1}}.$$
Then there exists $\lmd\in\b{0,1}$ such that $0=\lmd u-\p{1-\lmd}v$.
Taking the norm on both sides gives
$$0=\V{\lmd u-\p{1-\lmd}v}\ge\lmd\V u-\p{1-\lmd}\V v=2\lmd-1,$$
$$0=\V{\lmd u-\p{1-\lmd}v}\ge\p{1-\lmd}\V v-\lmd\V u=1-2\lmd.$$
These two inequalities imply $\lmd=1/2$.
This then gives $0=u/2-v/2$, which implies $u=v$.
This contradicts with $u\ne v$.
Therefore, $0\notin\opn{\overline{conv}}S$.

Thus, we have found a counterexample to $P_2^\mrm f$.
{% qed %}

</details>

<p class="no-indent">
**Theorem {#thm:not-strictly-convex-to-not-bar-p1f}.**
If a normed space is not strictly convex,
then it does not satisfy $\bar P_1^\mrm f$.
</p>

<details><summary>Proof</summary>

Let $X$ be a normed space that is not strictly convex.
Its unit sphere contains a nontrivial line segment,
so ther exist distinct unit vectors $u,v\in X$ such that $\V{u+v}=2$.
Set $S\ceq\B{u,-v}$ and $x\ceq\p{u-v}/2$.
Obviously we have $x\in\opn{\overline{conv}}S$.
We have
$$\V{x-u}=\V{\fr{-u-v}2}=1,\qquad
\V{x+v}=\V{\fr{u+v}2}=1.$$

Now set $y\ceq u-v$.
Because $u,v$ are distinct vectors, we have $y\ne x$.
We also have
$$\V{y-u}=\V{-v}=1\le\V{x-u},\qquad
\V{y+v}=\V u=1\le\V{x-v}.$$
Therefore, $y\in\fc{\bar I}{S,x}$.
We have found a counterexample to $\bar P_1^\mrm f$.
{% qed %}

</details>

<details><summary>Other preliminaries</summary>

<p class="no-indent">
**Definition {#thm:voronoi-cell}.**
Let $X$ be a normed space.
The <dfn>(open) Voronoi cell</dfn> w.r.t. $x$ of $y\in X$ is the set
$$D_{y,x}\ceq\set{a\in X}{\V{y-a}<\V{x-a}}.$$
Also denote $D_y\ceq D_{y,0}$, called the Voronoi cell of $y$.
Similarly, the <dfn>closed Voronoi cell</dfn> w.r.t. $x$ of $y\in X$ is
$$\bar D_{y,x}\ceq\set{a\in X}{\V{y-a}\le\V{x-a}},$$
and denote $\bar D_y\ceq\bar D_{y,0}$.
</p>

<p class="no-indent">
**Theorem {#thm:voronoi-cell-equivalence}.**
We can equivalently rewrite $P_1^{\mrm f,\mrm a}$ and $\bar P_1^{\mrm f,\mrm a}$ as follows:
$$\begin{align*}
	P_1^\mrm f:\qquad&\forall y\in X:0\notin\opn{conv}D_y,\\
	P_1^\mrm a:\qquad&\forall y\in X:0\notin\opn{\overline{conv}}D_y,\\
	\bar P_1^\mrm f:\qquad&\forall y\in X\setminus\B0:0\notin\opn{conv}\bar D_y,\\
	\bar P_1^\mrm a:\qquad&\forall y\in X\setminus\B0:0\notin\opn{\overline{conv}}\bar D_y.\\
\end{align*}$$
</p>

<details><summary>Proof</summary>

By Definition [@thm:voronoi-cell], we have $y\in\fc I{S,x}\Leftrightarrow S\subseteq D_{y,x}$.
Then, $P_1$ can be rewritten as
$$P_1:\qquad\p{\exists y\in X:S\subseteq D_{y,x}}\Rightarrow x\notin\opn{\overline{conv}}S.$$
For any $x_0\in X$, note that this is equivalent to
$$P_1:\qquad\p{\exists y\in X:S\subseteq D_{y-x_0,x-x_0}}
\Rightarrow x-x_0\notin\opn{\overline{conv}}S.$$
We may then simply pick $x_0\ceq x$ to get
$$P_1:\qquad\p{\exists y\in X:S\subseteq D_y}\Rightarrow 0\notin\opn{\overline{conv}}S.$$
Using some first-order logic, we can rewrite this as
$$P_1:\qquad\forall y\in X:\p{S\subseteq D_y\Rightarrow 0\notin\opn{\overline{conv}}S}.$$
Now dictate it to be true for all finite, bounded, or arbitrary $S$, and we get
$$P_1^{\mrm f,\mrm b,\mrm a}:\qquad\forall y\in X:
0\notin\bigcup_{\substack{S\subseteq D_y\\\mrm f,\mrm b,\mrm a}}\opn{\overline{conv}}S.$$
By the same argument, we have
$$\bar P_1^{\mrm f,\mrm b,\mrm a}:\qquad\forall y\in X\setminus\B0:
0\notin\bigcup_{\substack{S\subseteq\bar D_y\\\mrm f,\mrm b,\mrm a}}\opn{\overline{conv}}S.$$

One of the equivalent definitions of the convex hull is the set of all convex combinations
of finitely many points in the set.
Notice that for finite $S$, $\opn{\overline{conv}}S$ is exactly the set of convex combinations of $S$.
Therefore, we have
$$\bigcup_{\substack{S\subseteq D_y\\\mrm{finite}}}\opn{\overline{conv}}S=\opn{conv}D_y.$$
Thus,
$$P_1^\mrm f:\qquad\forall y\in X:0\notin\opn{conv}D_y.$$

When $S$ can be any set such that $S\subseteq D_y$, one case is to have $S=D_y$.
We then have
$$\bigcup_{S\subseteq D_y}\opn{\overline{conv}}S=\opn{\overline{conv}}D_y.$$
Thus,
$$P_1^\mrm a:\qquad\forall y\in X:0\notin\opn{\overline{conv}}D_y.$$

By the same arguments, we have
$$\begin{align*}
	\bar P_1^\mrm f:\qquad\forall y\in X\setminus\B0:0\notin\opn{conv}\bar D_y,\\
	\bar P_1^\mrm a:\qquad\forall y\in X\setminus\B0:0\notin\opn{\overline{conv}}\bar D_y.
\end{align*}$$
{% qed last %}

</details>

<p class="no-indent">
**Definition {#thm:subdifferential}.**
Let $X$ be a normed space. Then, the <dfn>subdifferential</dfn> at $x\in X$ is defined as
$$\fc Jx\ceq\set{f\in X^*}{\V f\le1,\fc fx=\V x}.$$
An element of $\fc Jx$ is called a <dfn>subgradient</dfn> at $x$.
Moreover, $X$ is said to be <dfn>smooth</dfn> at $x$ if there is a unique subgradient at $x$,
and we say $X$ is <dfn>smooth</dfn> if it is smooth at every nonzero point.
</p>

<p class="no-indent">
**Theorem {#thm:subdifferential-properties}.**
Let $X$ be a normed space.
For any $x\in X$, $\fc Jx$ is a nonempty weak\*-compact convex subset of $X^*$, and it has the following properties:
$$\forall t\in\bR\setminus\B0:\fc J{tx}=\fc Jx\sgn t,$$ {#eq:subdifferential-scaling}
$$\forall f\in\fc Jx,v\in X:\V{x+v}\ge\V x+\fc fv.$$ {#eq:subdifferential-inequality}
</p>

<details><summary>Proof</summary>

When $x=0$, $\fc Jx$ is the closed unit ball of $X^*$.
It is weak\*-compact by the
[Banach--Alaoglu theorem](https://en.wikipedia.org/wiki/Banach%E2%80%93Alaoglu_theorem).
All other properties are trivial.
From now on, we assume $x\ne0$.

To prove that $\fc Jx$ is nonempty, we define a linear functional $f_0$
on the one-dimensional subspace $\bR x$ of $X$ as $\fc{f_0}{tx}\ceq t\V x$.
We can easily find that this functional has norm $1$. By the
[norm-preserving Hahn--Banach continuous extension theorem](https://en.wikipedia.org/wiki/Hahn%E2%80%93Banach_theorem#Continuous_extension_theorem),
we can extend it to a linear functional $f\in X^*$ with $\V f=1$.
We can easily see that $f\in\fc Jx$, so $\fc Jx$ is nonempty.

To prove that $\fc Jx$ is convex, let $f_1,f_2\in\fc Jx$ and $\lmd\in\b{0,1}$.
By definition of $\fc Jx$, we can easily see that $\lmd f_1+\p{1-\lmd}f_2\in\fc Jx$.

To prove that $\fc Jx$ is weak\*-compact,
first note that $\fc\cdot x$ is a weak\*-continuous linear functional on $X^*$
by the definition of the weak\* topology.
Its preimage of any closed set on $\bR$ is then weak\*-closed.
Then, from
$$\fc Jx=\set{f\in X^*}{\V f\le1}\cap\set{f\in X^*}{\fc fx=\V x}
=\fc J0\cap\fc{\p{\fc\cdot x}^{-1}}{\B{\V x}},$$
we see that $\fc Jx$ is the intersection of a weak\*-compact set and a weak\*-closed set,
so $\fc Jx$ is weak\*-compact.

Equation [@eq:subdifferential-scaling] is easy to verify from the definition of $\fc Jx$.

To prove Equaion [@eq:subdifferential-inequality], write
$$\V x+\fc fv=\fc fx+\fc fv=\fc f{x+v}\le\v{\fc f{x+v}}\le\V f\V{x+v}=\V{x+v}.$$

All properties have been proven.
{% qed %}

</details>

<p class="no-indent">
**Definition {#thm:directional-derivative}.**
Let $X$ be a vector space, $v\in X$,
and $f:D\to\bR$ be a function defined on a subset $D\subseteq X$.
The <dfn>directional derivative</dfn> of $f$ in the direction of $v$
is a function $\partial_v f:D'\to\bR$ defined as
$$\partial_v\fc fx\ceq\lim_{t\to0^+}\fr{\fc f{x+tv}-\fc fx}t.$$
The domain $D'$ is all points where this expression makes sense
(i.e., $x\in X$ such that $0$ is a limit point of $\set{t>0}{x+tv\in D}$)
and the limit exists.
</p>

<p class="no-indent">
**Theorem {#thm:subdifferential-directional-derivative}.**
Let $X$ be a normed space and $v\in X$.
Then, $\partial_v\V\cdot$ is defined on all of $X$, and it satisfies
$$\forall x\in X,t\in\bR\setminus\B0:\partial_v\V x=\max_{f\in\fc Jx}\fc fv
\le\fr{\V{x+tv}-\V x}t.$$ {#eq:subdifferential-directional-derivative}
</p>

<details><summary>Proof</summary>

For fixed $x\in X$, define $g:\p{0,+\infty}\times X\to\bR$ as
$$\fc g{t,w}\ceq\fr{\V{x+tw}-\V x}t.$$
By Definition [@thm:directional-derivative], we have $\partial_v\V x=\fc g{0^+,v}$.

First prove that $\fc g{0^+,w}$ exists.
By the triangle inequality, when $t'>t>0$, we have
$$\begin{align*}
	\fc g{t',w}-\fc g{t,v}
	&=\fr{\V{x+t'w}-\V x}{t'}-\fr{\V{x+tv}-\V x}t\\
	&\ge\fr{\V{x+t'w}-\V x}{t'}-\fr{\V{\fr t{t'}x+tv}+\V{x-\fr t{t'}x}-\V x}t\\
	&=0,
\end{align*}$$
so $\fc g{\cdot,w}$ is a monotonically non-decreasing function on $\p{0,+\infty}$.
Also, we have
$$\fc g{t,w}\ge\fr{\V{x+tw}-\V{x+tw}-\V{-tw}}t=-\V w,$$
so $\fc g{\cdot,w}$ is bounded below.
Therefore, $\fc g{0^+,w}$ exists.

To prove that $\forall t\in\bR\setminus\B0:\partial_v\V x\le\p{\V{x+tv}-\V x}/t$,
we first note that this statement is exactly $\fc g{0^+,v}\le\fc g{t,v}$ when $t>0$,
which follows from the monotonicity of $\fc g{\cdot,v}$.
When $t<0$, we simply replace $v$ with $-v$ and $t$ with $-t$ to get
$\fc g{0^+,-v}\le\fc g{-t,-v}$, which is true by the same reason.

Then prove that $\max\fc fv$ exists.
This is obvious as we are maximizing a continuous function $f$ over a nonempty weak\*-compact set $\fc Jx$.

By Equation [@eq:subdifferential-inequality], we have
$\V{x+tv}\ge\V x+\fc f{tv}$,
which simplifies to $\fc g{t,v}\ge\fc fv$.
Maximize over $f\in\fc Jx$ and taking infimum over $t\in\p{0,+\infty}$ on both sides to get
$$\fc g{t,v}\ge\max_{f\in\fc Jx}\fc fv.$$

Now we will explicitly construct a linear functional $f_0\in X^*$ such that
$\fc g{0^+,v}=\fc{f_0}v$ and later show that $f_0\in\fc Jx$.
To construct it, we will use the Hahn--Banach dominated extension theorem,
for which we need to construct a sublinear functional as the dominating functional.
For that we use $\fc g{0^+,\cdot}$.

First, we prove that $\fc g{0^+,\cdot}$ is sublinear.
The positive homogeneity, i.e., $\forall \alp>0:\fc g{0^+,\alp w}=\alp\fc g{0^+,w}$,
is obvious from the definition.
The triangle inequality, i.e., $\forall w,w'\in X:\fc g{0^+,w+w'}\le\fc g{0^+,w}+\fc g{0^+,w'}$,
is obvious from the triangle inequality of the norm.

Then, define a linear functional $h:\bR v\to\bR$ defined as $\fc h{\alp v}\ceq\alp\fc g{0^+,v}$.
We can check that $\forall\alp\in\bR:\fc h{\alp v}\le\fc g{0^+,\alp v}$
so that $h$ is dominated by $\fc g{0^+,\cdot}$ on $\bR v$.
The check is trivial for $\alp\ge0$.
For $\alp<0$, noticing that $0=\fc g{0^+,0}\le\fc g{0^+,v}+\fc g{0^+,-v}$, we have
$$\fc h{\alp v}=\alp\fc g{0^+,v}\le-\alp\fc g{0^+,-v}=\fc g{0^+,\alp v}.$$

We can thus apply the
[Hahn--Banach dominated extension theorem](https://en.wikipedia.org/wiki/Hahn%E2%80%93Banach_theorem#Hahn%E2%80%93Banach_theorem)
to extend $h$ to a linear functional $f_0\in X^*$ such that
$\fc{f_0}v=\fc hv=\fc g{0^+,v}$
and that $f_0$ is dominated by $\fc g{0^+,\cdot}$ on all of $X$.

Now we need to show that $f_0\in\fc Jx$.
For any $y\in X$, we have
$$\fc{f_0}{y-x}\le\fc g{0^+,y-x}\le\fc g{1,y-x}=\V y-\V x,$$ {#eq:global-subgradient-inequality}
where the first inequality is because $f_0$ is dominated by $\fc g{0^+,\cdot}$
and the second inequality is because $\fc g{\cdot,y-x}$ is monotonically non-decreasing.

Substitute $y$ with $0$ in Equation [@eq:global-subgradient-inequality] to get
$\fc{f_0}x\ge\V x$.
Substitute $y$ with $2x$ in Equation [@eq:global-subgradient-inequality] to get
$\fc{f_0}x\le\V x$.
We then have $\fc{f_0}x=\V x$.

Substitute $y$ with $x+y$ in Equation [@eq:global-subgradient-inequality] to get
$\fc{f_0}y\le\V{x+y}-\V x\le\V y$.
Substitute $y$ with $x-y$ in Equation [@eq:global-subgradient-inequality] to get
$-\fc{f_0}y\le\V{x-y}-\V x\le\V y$.
We then have $\v{\fc{f_0}y}\le\V y$, which means $\V{f_0}\le1$.

With $\fc{f_0}x=\V x$ and $\V{f_0}\le1$, we have $f_0\in\fc Jx$.
{% qed %}

</details>

<p class="no-indent">
**Theorem {#thm:share-subgradient-to-not-strictly-convex}.**
Let $X$ be a normed space.
If there exists two distinct points $u,v\in X\setminus\B0$ such that $\fc Ju\cap\fc Jv\ne\varnothing$,
then $X$ is not strictly convex.
</p>

<details><summary>Proof</summary>
<p>
Let $f\in\fc Ju\cap\fc Jv$.
Define $\hat u\ceq u/\V u$ and $\hat v\ceq v/\V v$.
Then, $\fc f{\hat u}=\fc f{\hat v}=1$.
Because $\V f\le 1$, we have
$$\V{\hat u+\hat v}\ge\V f\fc f{\hat u+\hat v}\ge\fc f{\hat u+\hat v}=2.$$
On the other hand, by the triangle inequality, we have
$$\V{\hat u+\hat v}\le\V{\hat u}+\V{\hat v}=2.$$
Squeezing by the two inequalities, we have $\V{\hat u+\hat v}=2$.
This means $X$ is not strictly convex.
{% qed %}
</p>
</details>

<p class="no-indent">
**Theorem {#thm:voronoi-cell-closure}.**
Let $X$ be a strictly convex space and $y\in X\setminus\B0$.
Then, $\overline{D_y}=\bar D_y$, where $\overline{D_y}$ is the closure of $D_y$.
</p>

<details><summary>Proof</summary>

Because $D_y\subseteq\bar D_y$ and $\bar D_y$ is closed, we have $\overline{D_y}\subseteq\bar D_y$.
Suppose for contradiction that there exists $u\in\bar D_y\setminus\overline{D_y}$.

Note that
$$\bar D_y\setminus\overline{D_y}\subseteq\bar D_y\setminus D_y=\set{a\in X}{\V{y-a}=\V a},$$
so $\V{y-u}=\V u$.
Because $u\notin\overline{D_y}$, there exists $\dlt>0$ such that $\fc B{u,\dlt}\cap D_y=\varnothing$.
In other words,
$$\forall a\in\fc B{u,\dlt}:\V{y-a}\ge\V a.$$
For any $v\in X\setminus\B0$ and $t\in\p{-\dlt/\V v,\dlt/\V v}$, we have
$$\V{u+tv-y}\ge\V{u+tv}.$$
Take the right derivatives of both sides w.r.t. $t$ at $t=0$.
Theorem [@thm:subdifferential-directional-derivative] guarantees that the derivatives exist:
$$\max_{f\in\fc J{u-y}}\fc fv=\partial_v\V{u-y}\ge\partial_v\V u=\max_{f\in\fc Ju}\fc fv.$$
Because $\fc Ju$ is weak\*-compact and convex by Theorem [@thm:subdifferential-properties],
we have $\fc Ju\subseteq\fc J{u-y}$; otherwise the Hahn--Banach separation theorem breaks the inequality above.

<details><summary>Why $\fc Ju\subseteq\fc J{u-y}$</summary>
<p>
Suppose for contradiction that there exists $f_0\in\fc Ju\setminus\fc J{u-y}$.
Because $\fc J{u-y}$ is weak\*-compact and convex, by the Hahn--Banach separation theorem,
there exists $v\in X$ (the set of weak\*-continuous linear functionals on $X^*$) such that
$$\max_{f\in\fc J{u-y}}\fc fv<\fc{f_0}v\le\max_{f\in\fc Ju}\fc fv.$$
This is a contradiction.
</p>
</details>

We then have $\fc Ju\cap\fc J{u-y}\ne\varnothing$.
By Theorem [@thm:share-subgradient-to-not-strictly-convex],
$X$ is not strictly convex, a contradiction.
{% qed %}

</details>

<p class="no-indent">
**Definition {#thm:birkhoff-james-orthogonality}**
([Birkhoff, 1935](https://doi.org/10.1215/S0012-7094-35-00115-6))**.**
Let $X$ be a normed space, and let $u,v\in X$.
We say $u$ is Birkhoff--James orthogonal to $v$, denoted as $u\perp_\mrm{BJ}v$, if
$$\forall t\in\bR:\V{u+tv}\ge\V u.$$
</p>

<p class="no-indent">
**Theorem {#thm:bj-orthogonal-existence}.**
Let $X$ be a normed space such that $\dim X\ge2$.
For any $v\in X\setminus\B0$, there always exists $u\in X\setminus\B0$ such that $u\perp_\mrm{BJ}v$.
Such $u$ always satisfies that $u,v$ are linearly independent.
Specially, when $X$ is a strictly convex plane, $u$ is unique up to a scalar multiple.
</p>

<details><summary>Proof</summary>

First prove the existence.
Choose $u'\in X$ such that $u',v$ are linearly independent.
Then, $\fc ft\ceq\V{u'+tv}$ is a continuous function of $\bR\to\bR$.
By the triangle inequality, we have
$\fc ft\ge\v t\V v-\V{u'}$, so $\fc ft\to+\infty$ as $t\to\pm\infty$.
Such a continuous function must have a global minimum at some $t_0\in\bR$.
Define $u\ceq u'+t_0v$, which must be nonzero as $u',v$ are linearly independent.
Then, for any $t\in\bR$,
$$\V{u+tv}=\V{u'+\p{t+t_0}v}\ge\V{u'+t_0v}=\V u,$$
so $u\perp_\mrm{BJ}v$.

Then prove that $u\perp_\mrm{BJ}v$ and $u,v\ne0$ imply that $u,v$ are linearly independent.
Suppose for contradiction that $u,v$ are linearly dependent,
i.e., $u=t_0v$ for some $t_0\in\bR$.
Then, by definition of the Birkhoff--James orthogonality, for any $t\in\bR$,
$$\v{t_0+t}\V v=\V{u+tv}\ge\V u=\v{t_0}\V v.$$
Divide both sides by $\V v$ to get $\v{t_0+t}\ge\v{t_0}$ for any $t\in\bR$, which is false.
By contradiction, $u,v$ are linearly independent.

Finally, prove the uniqueness in a strictly convex plane.
Suppose that $u\perp_\mrm{BJ}v$ and $u'\perp_\mrm{BJ}v$ and that $u,u',v\ne0$.
Because $u,v$ are linearly independent and the space is a plane,
they form a coordinate system.
Then, we can express $u'=ru+sv$ for some $r,s\in\bR$.
We must have $r\ne0$ because otherwise $u'$ and $v$ are linearly dependent.
By $u'\perp_\mrm{BJ}v$, we have $\V{ru+sv+tv}\ge\V{ru+sv}$ for any $t\in\bR$.
Divide both sides by $\v r$ and substitute $t\ceq-s$ to get
$$\V u\ge\V{u+\fr srv}.$$ {#eq:bj-unique-1}
On the other hand, by $u\perp_\mrm{BJ}v$, we have $\V{u+tv}\ge\V u$ for any $t\in\bR$.
Substitute $t\ceq s/r$ to get
$$\V{u+\fr srv}\ge\V u.$$ {#eq:bj-unique-2}
Combining Equations [@eq:bj-unique-1] and [@eq:bj-unique-2], we have
$$\V{u+\fr srv}=\V u.$$
Suppose by contradiction that $s\ne0$.
Then,
$$x\ceq\fr u{\V u},\qquad x'\ceq\fr{u+\fr srv}{\V u}$$
are two distinct points on the unit sphere.
Because the space is strictly convex, $\V{x+x'}<2$.
On the other hand,
$$\V{x+x'}=\fr2{\V u}\V{u+\fr s{2r}v}\ge\fr2{\V u}\V u=2,$$
where the inequality is by $u\perp_\mrm{BJ}v$.
This is a contradiction, so we must have $s=0$.
Therefore, $u'=ru$ for some $r\in\bR$, which proves the uniqueness of $u$ up to a scalar multiple.
{% qed %}

</details>
</details>

## Inner product spaces

<details><summary>Lemmas</summary>
<p class="no-indent">
**Lemma {#thm:kakutani}**
([Kakutani, 1939](https://doi.org/10.4099/jjm1924.16.0_93), Theorem 4)**.**
Let $W$ be a 3-dimensional normed space.
If every 2-dimensional vector subspace of $W^*$ is the range of a linear projection of norm $1$,
then $W$ is an inner product space.
</p>

<p class="no-indent">
**Lemma {#thm:hilbert-projection}.**
Let $X$ be a Hilbert space, $C\subseteq X$ be nonempty, closed, and convex, and $x\in X$.
Then, there exists $p\in C$ such that $\forall a\in C:\a{a-p,p-x}\ge0$.
</p>

<details><summary>Proof</summary>
<p>
By the [Hilbert projection theorem](https://en.wikipedia.org/wiki/Hilbert_projection_theorem),
there exists $p\in C$ such that
$$\forall c\in C:\V{x-p}\le\V{x-c}.$$ {#eq:hilbert-projection}
Because $C$ is convex, $\forall a\in C,t\in\b{0,1}:\p{1-t}p+ta\in C$.
Substitute $c\ceq\p{1-t}p+ta$ into Equation [@eq:hilbert-projection] and square both sides to get
$$\forall t\in\b{0,1}:\V{x-\p{1-t}p-ta}^2\ge\V{x-p}^2.$$
Subtract $\V{x-p}^2$ from both sides and divide both sides by $2t$ (assuming $t\ne0$) to get
$$\forall t\in\left(0,1\right]:\a{x-p,p-a}+\fr t2\V{p-a}^2\ge0.$$
Take infimum over $t$ on both sides, and we have $\a{x-p,p-a}\ge0$.
{% qed %}
</p>
</details>

<p class="no-indent">
**Lemma {#thm:continuous-subgradient-to-frechet-differentiable}**
([Diestel, 1975](https://doi.org/10.1007/BFb0082079), Chapter 2, Section 2, Theorem 1)**.**
Let $X$ be a normed space, $S_X$ be the unit sphere of $X$, and $S_{X^*}$ be the unit sphere of $X^*$.
Then, $\V\cdot$ is [Fr&eacute;chet differentiable](https://en.wikipedia.org/wiki/Fr%C3%A9chet_derivative)
at $x_0\in S_X$
iff there exists a map $j:S_X\to S_{X^*}$ continuous at $x_0$ such that $\forall x\in S_X:\fc jx\in\fc Jx$.
</p>
</details>

<p class="no-indent">
**Theorem {#thm:inner-product-to-bar-p1a}.**
An inner product space satisfies $\bar P_1^\mrm a$.
</p>

<details><summary>Proof</summary>

Let $X$ be an inner product space.
Suppose for contradiction that $X$ does not satisfy $\bar P_1^\mrm a$.
By Theorem [@thm:voronoi-cell-equivalence], there exists $y\in X\setminus\B0$
such that $0\in\opn{\overline{conv}}\bar D_y$.
Therefore, there exists a sequence of finite sets $\B{S^{\p n}}$ such that
$S^{\p n}\subseteq\bar D_y$ for any $n$ and that $\sum_{a\in S^{\p n}}\lmd^{\p n}_aa\to0$,
where, for any $n$, $\lmd^{\p n}_a\ge0$ for any $a\in S^{\p n}$, and $\sum_a\lmd^{\p n}_a=1$.

By Definition [@thm:voronoi-cell], we have $\V{a-y}\le\V a$ for any $a\in S^{\p n}$.
Square both sides and simplify, and we get $\a{a,y}\ge\V y^2/2$.
Therefore,
$$\a{\sum_{a\in S^{\p n}}\lmd^{\p n}_aa,y}
=\sum_{a\in S^{\p n}}\lmd^{\p n}_a\a{a,y}
\ge\sum_{a\in S^{\p n}}\lmd^{\p n}_a\fr{\V y^2}2=\fr{\V y^2}2>0.$$
On the other hand, because the inner product is continuous,
$$\a{\sum_{a\in S^{\p n}}\lmd^{\p n}_aa,y}\to\a{0,y}=0,$$
which is a contradiction.
{% qed %}

</details>

<p class="no-indent">
**Theorem {#thm:not-inner-product-to-not-p1f}.**
If a normed space $X$ with $\dim X\ge3$ is not an inner product space,
then it does not satisfy $P_1^\mrm f$.
</p>

<details><summary>Proof</summary>

Suppose for contradiction that $X$ satisfies $P_1^\mrm f$.
Pick a non-inner-product 3-dimensional subspace $W\subseteq X$.

<details><summary>Why $W$ exists</summary>
<p>
The Jordan--von Neumann theorem states that a normed space is an inner product space
if the norm satisfies the parallelogram law.
Therefore, because $X$ is not an inner product space,
there exist $u,v\in X$ failing the parallelogram law.
Pick $w\in X\setminus\opn{span}\B{u,v}$.
Then, $W\ceq\opn{span}\B{u,v,w}$ is a 3-dimensional subspace of $X$ that is not an inner product space.
</p>
</details>

For any $y\in W\setminus\B0$, consider $C_y\ceq\opc{conv}{D_y\cap W}$.
Since $D_y\cap W$ is open in $W$, $C_y$ is open in $W$.
By $P_1^\mrm f$ and Theorem [@thm:voronoi-cell-equivalence], $0\notin\opn{conv}D_y$,
so $0\notin C_y\subseteq\opn{conv}D_y$.
By the
[Hahn--Banach separation theorem](https://en.wikipedia.org/wiki/Hahn%E2%80%93Banach_theorem#Geometric_Hahn%E2%80%93Banach_(the_Hahn%E2%80%93Banach_separation_theorems)),
there exists a continuous linear functional $f_y\in W^*\setminus\B0$ such that
$\forall a\in C_y:\fc{f_y}a>0$.
Since $y\in D_y\cap W\subseteq C_y$, we have $\fc{f_y}y>0$.
Define
$$\fc{Q_y}z\ceq z-\fr{\fc{f_y}z}{\fc{f_y}y}y.$$
Then, $Q_y:W\to W$ is a linear projection from $W$ onto $\opn{ker}f_y$ with $\V{Q_y}=1$.

<details><summary>Why $Q_y$ is a projection onto $\opn{ker}f_y$</summary>

First, $\fc{Q_y}z\in\opn{ker}f_y$ for any $z\in W$ because
$$\fc{f_y}{\fc{Q_y}z}=\fc{f_y}z-\fr{\fc{f_y}z}{\fc{f_y}y}\fc{f_y}y=0.$$

Then, $Q_y$ is a projection because
$$\fc{Q_y}{\fc{Q_y}z}
=z-\fr{\fc{f_y}z}{\fc{f_y}y}y
-\fr{\fc{f_y}z}{\fc{f_y}y}\p{y-\fr{\fc{f_y}y}{\fc{f_y}y}y}
=\fc{Q_y}z.$$

Finally, $Q_y$ maps onto every point in $\opn{ker}f_y$ because
for any $z\in\opn{ker}f_y$, we have $\fc{Q_y}z=z$.

</details>

<details><summary>Why $\V{Q_y}=1$</summary>

Generally, any nonzero bounded linear projection has norm at least $1$ by submultiplicativity,
so we just need to show $\V{Q_y}\le1$.

For any $a\in\opn{ker}f_y$, we have $a\notin D_y$, which means $\V{a-y}\ge\V a$.
Similarly, for any $a\in\opn{ker}f_y$ and $t\in\bR\setminus\B0$, we also have $a/t\notin D_y$,
which means $\V{a/t-y}\ge\V{a/t}$, or equivalently $\V{a-ty}\ge\V a$.
This inequality obviously also holds for $t=0$.

Because $y\notin\opn{ker}f_y$, we have $W=\opn{ker}f_y\oplus\bR y$.
Therefore, for any $z\in W$, there exist unique $a\in\opn{ker}f_y$ and $t\in\bR$ such that $z=a-ty$.
Then, we have
$$\V{\fc{Q_y}z}=\V{\fc{Q_y}{a-ty}}=\V{a}\le\V{a-ty}=\V z.$$
This shows $\V{Q_y}\le1$.

</details>

Then, the adjoint $Q_y^*:W^*\to W^*$ is a linear projection from $W^*$ onto
$\p{\opn{ker}Q_y}^\perp$, and $\V{Q_y^*}=1$.
Noticing that $\opn{ker}Q_y=\bR y$, we have that $Q_y^*$ is onto
$\opn{ker}y=\set{g\in W^*}{\fc gy=0}$.

In general, any hyperplane in $W^*$ can be expressed as $\opn{ker}y$ for some $y\in W\setminus\B0$.
Therefore, by Lemma [@thm:kakutani], $W^*$ is an inner product space,
so $W$ is an inner product space.
This contradicts with the choice that $W$ is not an inner product space.

Therefore, $X$ does not satisfy $P_1^\mrm f$.
{% qed %}

</details>

<p class="no-indent">
**Theorem {#thm:hilbert-to-p2a}.**
A Hilbert space satisfies $P_2^\mrm a$.
</p>

<details><summary>Proof</summary>
<p>
Let $X$ be a Hilbert space.
Let $S\subseteq X$ and $x\notin C\ceq\opn{\overline{conv}}S$.
By Lemma [@thm:hilbert-projection],
there exists $p\in C$ such that $\forall a\in C:\a{a-p,p-x}\ge0$.
Consider
$$\V{a-x}^2=\V{a-p}^2+2\a{a-p,p-x}+\V{p-x}^2\ge\V{a-p}^2+\V{x-p}^2.$$
Subtract $\V{x-p}^2$ from both sides to get
$$\V{a-p}^2\le\V{a-x}^2-\V{x-p}^2<\V{a-x}^2.$$
Therefore, $p\in\fc I{S,x}$, so $\fc I{S,x}\ne\varnothing$, proving $P_2^\mrm a$.
{% qed %}
</p>
</details>

<p class="no-indent">
**Theorem {#thm:not-hilbert-to-not-bar-p2a}.**
An inner product space that is not a Hilbert space does not satisfy $\bar P_2^\mrm a$.
</p>

<details><summary>Proof</summary>

Let $X$ be an inner product space that is not a Hilbert space.
Let $\hat X$ be the completion of $X$, which is a Hilbert space, and choose $z\in\hat X\setminus X$.
Let $S\ceq\set{a\in X}{\a{a,z}=1}$, which is a nonempty closed affine hyperplane in $X$.

<details><summary>Why $S$ is nonempty and closed</summary>

Suppose for contradiction that $S$ is empty.
Then, $z\perp X$.
Because $X$ is dense in $\hat X$, we have $z\perp \hat X$, which implies $z=0$.
This contradicts with $z\notin X$.
Therefore, $S$ is nonempty.

To see that $S$ is closed, notice that $\a{\cdot,z}$
is a bounded linear functional on $\hat X$,
so it is a bounded linear functional on $X$.

</details>

Obviously, $0\notin S=\opn{\overline{conv}}S$.
Now suppose for contradiction that $y\in\fc{\bar I}{S,0}$, which means $\forall a\in S:\V{a-y}^2\le\V a^2$.
Expanding the square gives $\a{a,y}\ge\V y^2/2$.
Therefore, the linear functional $\a{\cdot,y}$ is bounded below on the affine hyperplane $S$,
so $\a{\cdot,y}$ is constant on $S$,
so $\a{\cdot,y}$ is zero on the linear hyperplane $\opn{ker}\a{\cdot,z}$ parallel to $S$.
This means $\opn{ker}\a{\cdot,y}=\opn{ker}\a{\cdot,z}$, so $y$ is parallel to $z$.
However, $z\notin X$ while $y\in X$, so this is impossible for $y\ne0$, a contradiction.
Therefore, $\fc{\bar I}{S,0}\setminus\B0=\varnothing$.

Therefore, we find a counterexample to $\bar P_2^\mrm a$.
{% qed %}

</details>

<p class="no-indent">
**Theorem {#thm:inner-product-to-p2b}.**
An inner product space satisfies $P_2^\mrm b$.
</p>

<details><summary>Proof</summary>

Let $X$ be an inner product space and $x\in X$.
Let $S\subseteq X$ be bounded and $x\notin\opn{\overline{conv}}S$.
Because $S$ is bounded, $S-x$ is bounded,
so there exists $M>0$ such that $\forall a\in S:\V{a-x}\le M$.

Denote $\hat X$ the completion of $X$, which is a Hilbert space.
Then, $x\notin C\ceq\opn{\overline{conv}}_{\hat X}S$, either.
By Lemma [@thm:hilbert-projection], there exists $p\in C$
such that $\forall a\in C:\a{a-p,p-x}\ge0$.
Add both sides by $\dlt\ceq\a{p-x,p-x}>0$ to get
$\a{a-x,p-x}\ge\dlt$.

Now, choose $v\in X$ close enough to $p-x$ such that
$$\V{v-\p{p-x}}<\opc{min}{\fr\dlt{2M},\V{p-x}},$$
which is always possible because $X$ is dense in $\hat X$.
Then, for any $a\in S$, we have
$$\a{a-x,v}=\a{a-x,p-x}+\a{a-x,v-p+x}\ge\dlt-\V{a-x}\V{v-p+x}>\dlt/2.$$

By the triangle inequality,
$$\V v\ge\V{p-x}-\V{v-\p{p-x}}>0.$$
We can then choose $0<t<\dlt/\V v^2$ to get
$$\V{a-\p{x+tv}}^2=\V{a-x}^2-t\V v^2\p{\fr{2\a{a-x,v}}{\V v^2}-t}<\V{a-x}^2.$$
Therefore, $x+tv\in\fc I{S,x}$, so $\fc I{S,x}\ne\varnothing$, proving $P_2^\mrm b$.
{% qed %}

</details>

<p class="no-indent">
**Theorem {#thm:p2f-to-inner-product}.**
Let $X$ be a normed space with $\dim X\ge3$.
If $X$ satisfies $P_2^\mrm f$, then $X$ is an inner product space.
</p>

<details><summary>Proof</summary>

Denote $S_X$ the unit sphere of $X$ and $S_{X^*}$ the unit sphere of $X^*$.
From Equation [@eq:subdifferential-scaling], we can see that $\fc J{-x}=-\fc Jx$.
Therefore, we can choose $\fc jx\in\fc Jx$ for every $x\in S_X$ such that $\fc j{-x}=-\fc jx$.
This defines an odd map $\fc j\cdot:S_X\to S_{X^*}$.

<details><summary>Why $\fc jx\in S_{X^*}$</summary>
<p>
By Definition [@thm:subdifferential], for $x\ne0$, we have $\V{\fc jx}\le1$.
On the other hand, $\V{\fc jx}\ge\v{\fc{\fc jx}x}/\V x=1$.
Therefore, $\V{\fc jx}=1$, so $\fc jx\in S_{X^*}$.
</p>
</details>

We claim
$$0\notin\opn{conv}S\Rightarrow0\notin\opn{conv}\fc jS$$ {#eq:preserve-hemisphere}
for finite $S\subseteq S_X$.
Suppose for contradiction that $0\notin\opn{conv}S$ and $0\in\opn{conv}\fc jS$.
Then, there exist $\B{\lmd_a}$ such that $\sum_{a\in S}\lmd_a\fc ja=0$,
that $\sum_{a\in S}\lmd_a=1$, and that $\lmd_a\ge0$ for any $a\in S$.
By $\bar P_2^\mrm f$, there exists $y\in\fc{\bar I}{S,0}\setminus\B0$ such that
$$\forall a\in S:\V{y-a}\le\V a.$$
By Equation [@eq:subdifferential-inequality],
$$\V{y-a}\ge\V{-a}+\fc{\fc j{-a}}y=\V a-\fc{\fc ja}y.$$
We then have
$$\fc{\fc ja}y\ge\V a-\V{y-a}\ge0.$$
Because $\sum_a\lmd_a\fc ja=0$, we must have $\lmd_a>0\Rightarrow\fc{\fc ja}y=0$.
Thus,
$$\lmd_a>0\Rightarrow\V{y-a}=\V a=1=\fc{\fc ja}a=-\fc{\fc ja}{y-a}.$$
Therefore, $\lmd_a>0\Rightarrow-\fc ja\in\fc J{-a}\cap\fc J{y-a}$.
By Theorem [@thm:share-subgradient-to-not-strictly-convex],
$X$ is not strictly convex, a contradiction.
Therefore, Equation [@eq:preserve-hemisphere] is true.

With that, we can also prove that $j$ is injective.
Suppose that $\fc jx=\fc jy$ for some $x,y\in S_X$.
Take $S\ceq\B{x,-y}$, then $0\in\opn{conv}\fc jS$ because
$$\fr12\fc jx+\fr12\fc j{-y}=\fr12\fc jy-\fr12\fc jy=0.$$
By the contrapositive of Equation [@eq:preserve-hemisphere], we have $0\in\opn{conv}S$.
The only case it is true is when $x=y$.
We have thus proven that $j$ is injective.

Equation [@eq:preserve-hemisphere] and fact that $j$ is injective
mean that a great circle on $S_X$ is mapped to a great circle on $S_{X^*}$ under $j$.

<details><summary>Why $j$ maps great circles to great circles</summary>

For $S\subseteq S_X$, when $0\notin\opn{conv}S$,
$S$ is contained in a hemisphere in $S_X$.
The property $0\notin\opn{conv}S\Rightarrow0\notin\opn{conv}\fc jS$
means that $j$ maps a closed hemisphere $H\subseteq S_X$ to a closed hemisphere $H^*\subseteq S_{X^*}$.
Because $j$ is also odd, it maps the opposite hemisphere $-H$ to the opposite hemisphere $-H^*$.

Because $j$ is injective, for any $A,B\subseteq S_X$,
we have $\fc j{A\cap B}=\fc jA\cap\fc jB$.
Therefore, $j$ maps the equator $H\cap-H$ to the equator $H^*\cap-H^*$.
Because a great circle is the intersection of $\dim X-2$ equators,
$j$ maps a great circle to a great circle.

</details>

Consider the projective spaces $\mrm PX\ceq\set{\bR x}{x\in S_X}$
and $\mrm PX^*\ceq\set{\bR f}{f\in S_{X^*}}$.
Then, $j$ induces a map $\mrm PX\to\mrm PX^*$, which is also denoted as $j$,
by $\fc j{\bR x}\ceq\bR\fc jx$.
It is well-defined because $j$ is odd.
This map is a collineation, i.e., it maps a line on $\mrm PX$
(the image of a line in $X$ under $\bR\cdot$,
which is also the image of a great circle in $S_X$ under $\bR\cdot$)
to a line on $\mrm PX^*$.

By the
[fundamental theorem of projective geometry](https://en.wikipedia.org/wiki/Homography#Fundamental_theorem_of_projective_geometry),
every collineation between real projective spaces of at least $2$ dimensions is a homography,
i.e., it is induced by a linear isomorphism between the underlying vector spaces.
In this case, we have $\dim\mrm PX=\dim X-1\ge2$ and a collineation $j:\mrm PX\to\mrm PX^*$,
so there exists a linear isomorphism $T:X\to X^*$ such that
$\forall x\in S_X:\bR\fc jx=\bR\fc Tx$.
There then exists $\lmd:S_X\to\bR\setminus\B0$ such that
$$\forall x\in X\setminus\B0:\fc Tx=\V x\fc\lmd{\fr x{\V x}}\fc j{\fr x{\V x}}.$$ {#eq:linear-isomorphism}
If $T$ induces $j$, then $-T$ induces $j$ as well, so $\lmd$ is only defined up to a sign.
We can fix the sign by choosing $\lmd$ to be positive on some point in $S_X$.
Now consider a function $j':X\setminus\B0\to X^*\setminus\B0$ defined as
$$\fc{j'}x\ceq\fr{\fc Tx}{\V{\fc Tx}}=\sgn\fc\lmd{\fr x{\V x}}\fc j{\fr x{\V x}}.$$
It is continuous because $T$ is continuous.
Then, for any $x\in S_X$, we have $\fc{\fc{j'}x}x=\sgn\fc\lmd x$.
The continuity of $j'$ then dictates the continuity of $\sgn\fc\lmd x$ on $S_X$,
which dictates that $\lmd$ is positive on all of $S_X$.
With that, we now have $\fc{j'}x=\fc j{x/\V x}$ for any $x\in X\setminus\B0$.
One can then know that $\fc{j'}x\in\fc Jx$ by Equation [@eq:subdifferential-scaling].
By Lemma [@thm:continuous-subgradient-to-frechet-differentiable],
$\V\cdot$ is Fr&eacute;chet differentiable on $X\setminus\B0$.

When a function is Fr&eacute;chet differentiable,
its Fr&eacute;chet derivative must match the directional derivatives.
This forces $X$ to be smooth, i.e.,
for any $x\in X\setminus\B0$, $\fc{j'}x$ is the only element in $\fc Jx$.
By Equation [@eq:subdifferential-directional-derivative],
and because the Fr&eacute;chet derivative agrees with the directional derivative if the former exists,
we have $\d\V\cdot=j'$.

Define $\fc Fx\ceq\V x^2/2$.
Applying the chain rule, we get its Fr&eacute;chet derivative
$$\d\fc Fx=\V x\d\V x=\V x\fc{j'}x=\fr{\V x}{\V{\fc Tx}}\fc Tx
=\fr{2\fc Fx}{\fc{\fc Tx}x}\fc Tx.$$

<details><summary>Why $\fc{\fc Tx}x=\V x\V{\fc Tx}$</summary>
<p>
Denote $\hat x\ceq x/\V x$.
By Equation [@eq:linear-isomorphism], we have
$$\fr{\fc{\fc Tx}x}{\V{\fc Tx}}
=\fr{\V x\fc\lmd{\hat x}\fc{\fc j{\hat x}}x}{\V x\v{\fc\lmd{\hat x}}\V{\fc j{\hat x}}}.$$
By Definition [@thm:subdifferential], we have
$\fc{\fc j{\hat x}}x=\V x\fc{\fc j{\hat x}}{\hat x}=\V x$
and $\V{\fc j{\hat x}}=1$.
The factors involving $\lmd$ cancel because $\lmd$ is positive.
We then have $\fc{\fc Tx}x/\V{\fc Tx}=\V x$.
</p>
</details>

<p class="no-indent">
Divide both sides by $2\fc Fx$ to get $\d\ln\fc Fx/2=\fc Tx/\fc{\fc Tx}x\eqc\fc\omg x$.
Therefore, the 1-form $\omg$ is exact on $X\setminus\B0$, so it is closed, i.e.,
$$0=\fc{\fc{\d\fc\omg x}u}v
=\fr{\fc{\fc Tu}v}{\fc{\fc Tx}x}-\fr{\fc{\fc Tx}u+\fc{\fc Tu}x}{\fc{\fc Tx}x^2}\fc{\fc Tx}v
-u\leftrightarrow v,$$ {#eq:d-omg}
where $u\leftrightarrow v$ means the same thing as the previous terms but with $u$ and $v$ swapped.
</p>

<details><summary>Calculation of $\d\fc\omg x$</summary>
<p>
First calculate $\nabla\fc{\fc Tx}x$, where $\nabla$ denotes the Fr&eacute;chet derivative.
Make some small perturbation $x\to x+h$.
Then, we have
$$\fc{\fc T{x+h}}{x+h}=\fc{\fc Tx}x+\fc{\fc Th}x+\fc{\fc Tx}h+\order{h^2}.$$
Therefore, $\nabla\fc{\fc Tx}x=\fc{\fc T\cdot}x+\fc{\fc Tx}\cdot$.
Then, by the quotient rule, we have
$$\nabla\fc\omg x=\fr{\nabla\fc Tx}{\fc{\fc Tx}x}-\fr{\nabla\fc{\fc Tx}x}{\fc{\fc Tx}x^2}\fc Tx.$$
Note that $\nabla\fc Tx=T$.
Then, antisymmetrizing it gives the result in Equation [@eq:d-omg].
</p>
</details>

Split $T$ into a symmetric part $T_\mrm s$ and an antisymmetric part $T_\mrm a$, i.e.,
$$\fc{\fc{T_\mrm s}x}y\ceq\fr12\p{\fc{\fc Tx}y+\fc{\fc Ty}x},\qquad
\fc{\fc{T_\mrm a}x}y\ceq\fr12\p{\fc{\fc Tx}y-\fc{\fc Ty}x}.$$
Substituting this in Equation [@eq:d-omg] and multiplying both sides by $\fc{\fc{T_\mrm s}x}x^2/2$ gives
$$\fc{\fc{T_\mrm a}u}v\fc{\fc{T_\mrm s}x}x
-\fc{\fc{T_\mrm s}u}x\p{\fc{\fc{T_\mrm s}x}v+\fc{\fc{T_\mrm a}x}v}
+\fc{\fc{T_\mrm s}v}x\p{\fc{\fc{T_\mrm s}x}u+\fc{\fc{T_\mrm a}x}u}=0.$$
Since $\dim X\ge3$, we can choose a nonzero $x$ that is $T_\mrm s$-orthogonal to both $u$ and $v$,
i.e., $\fc{\fc{T_\mrm s}x}u=\fc{\fc{T_\mrm s}x}v=0$.
Then, the above equation reduces to $\fc{\fc{T_\mrm a}u}v\fc{\fc{T_\mrm s}x}x=0$.
Because $\fc{\fc{T_\mrm s}x}x=\V x\V{\fc Tx}>0$, we have $\fc{\fc{T_\mrm a}u}v=0$.
This makes $T=T_\mrm s$ symmetric, i.e., $\fc{\fc Tx}y=\fc{\fc Ty}x$ for any $x,y\in X$.

With the symmetry, we can see that $\fc\omg x=\d\ln\fc{\fc Tx}x/2$.
Therefore, we can integrate $\d\ln\fc Fx=\d\ln\fc{\fc Tx}x$ to get
$$\fc Fx=\fr12\lmd_0\fc{\fc Tx}x,$$
where $\lmd_0/2$ is an integration constant.
Comparing this with Equation [@eq:linear-isomorphism], we can see that
$\lmd$ is a constant function $x\mapsto\lmd_0$, and therefore $\lmd_0$ is positive.
This means that the norm is induced by the bilinear form $\lmd_0\fc{\fc T\cdot}\cdot$, so $X$ is an inner product space.
{% qed %}

</details>

<p class="no-indent">
**Theorem {#thm:finite-dimension-not-inner-product-to-not-bar-p2f}.**
Let $X$ be a normed space with $3\le\dim X<\infty$.
If $X$ is not an inner product space, then $X$ does not satisfy $\bar P_2^\mrm f$.
</p>

<details><summary>Proof</summary>

</details>

<p class="no-indent">
**Theorem {#thm:bar-p2a-to-inner-product}.**
Let $X$ be a normed space with $\dim X\ge3$.
If $X$ satisfies $\bar P_2^\mrm a$, then $X$ is an inner product space.
</p>

<details><summary>Proof</summary>

</details>

## Planes

<p class="no-indent">
**Definition {#thm:asymptotically-balanced}.**
A normed space $X$ is said to be <dfn>asymptotically balanced</dfn> at $y\in X$
if there exists a nonzero $u\perp_\mrm{BJ}y$ such that $\fc dt\ceq\V{u+ty}-\V u$ satisfies
$\fc dt=\order{\fc d{-t}}$ as $t\to0$.
Moreover, $X$ is said to be <dfn>asymptotically balanced</dfn> if it is asymptotically balanced at every $y\in X$.
</p>

<details><summary>Definitions and lemmas</summary>

<p class="no-indent">
**Definition {#thm:bj-coordinates}.**
Let $X$ be a normed plane, and let $u,y\in X\setminus\B0$ such that $u\perp_\mrm{BJ}y$.
Then, $\B{u,y}$ is a basis of $X$, forming a coordinate system to express every vector in $X$
as $ru+sy$ for some $r,s\in\bR$.
The number $r$ is called the <dfn>bisector coordinate</dfn>,
and the number $s$ is called the <dfn>descent coordinate</dfn>.
In this context, $u$ is called the <dfn>bisector direction</dfn>,
and $y$ is called the <dfn>descent direction</dfn>.
In a context where a bisector coordinate system is already set up,
we denote the coordinate projection of the bisector coordinate as $\pi_r$
and the coordinate projection of the descent coordinate as $\pi_s$, i.e.,
$\pi_r\p{ru+sy}\ceq r$ and $\pi_s\p{ru+sy}\ceq s$.
</p>

<p class="no-indent">
**Definition {#thm:bisector-function}.**
Let $X$ be a normed space, and let $u,y\in X$ such that $u\perp_\mrm{BJ}y$.
Define the <dfn>bisector function</dfn> $\beta_{u,y}:\bR\to\overline\bR$ as
$$\fc{\beta_{u,y}}r\ceq\sup\set{s\in\bR}{\V{ru+sy}\le\V{ru+\p{s-1}y}}.$$
When a bisector coordinate system with basis $\B{u,y}$ is already set up in the context,
we abbreviate $\beta_{u,y}$ as $\beta$.
</p>

<p class="no-indent">
**Definition {#thm:positively-bisectable}.**
A normed space $X$ is said to be <dfn>positively bisectable</dfn> at $y\in X$
if there exists nonzero $u\perp_\mrm{BJ}y$ such that
$$\inf_{r\in\bR}\fc{\beta_{u,y}}r>0.$$
Moreover, $X$ is said to be <dfn>positively bisectable</dfn>
if it is positively bisectable at every $y\in X$.
</p>

<p class="no-indent">
**Lemma {#thm:bisector-function-nonnegative}.**
The bisector function $\beta_{u,y}$ is nonnegative.
Furthermore, if $y$ is nonzero and $u$ is the only nonzero vector in $\opn{span}\B{u,y}$ such that $u\perp_\mrm{BJ}y$
up to scalar multiples, then $\forall r\in\bR:\fc{\beta_{u,y}}r\in\p{0,1}$.
</p>

<details><summary>Proof</summary>

Let $X$ be a normed space, and let $u,y\in X$ such that $u\perp_\mrm{BJ}y$.
If $u=0$ or $y=0$, the result is trivial.
We assume $u,y\ne0$ from here and use a bisector coordinate system with basis $\B{u,y}$ in their spanned plane.

By the triangle inequality, for any $r\in\bR$, the function $s\mapsto\V{ru+sy}$ is convex.
Difference on a fixed interval of a convex function is monotonic, so
$$\fc{g_r}s\ceq\V{ru+sy}-\V{ru+\p{s-1}y}$$
is monotonically non-decreasing in $s$.
By Definition [@thm:birkhoff-james-orthogonality], we can easily see that $\fc{g_r}0\le0$.
Therefore, $g_r$ is nonpositive on $\left(-\infty,0\right]$.

By Definition [@thm:bisector-function], we have $\fc\beta r=\sup G_r$, where
$$G_r\ceq\set{s\in\bR}{\fc{g_r}s\le0}.$$
By the previous paragraph, we have $\left(-\infty,0\right]\subseteq G_r$,
so $\sup G_r\ge\sup\left(-\infty,0\right]=0$.
Therefore, $\fc\beta r\ge0$.

Now, if $u$ is the only nonzero vector such that $u\perp_\mrm{BJ}y$ up to scalar multiples,
we prove that $\forall r\in\bR:\fc{\beta_{u,y}}r\in\p{0,1}$.
We have the strict inequalities $\V{ru}>\V{ru+y}$ and $\V{ru}>\V{ru-y}$
because otherwise $ru+y$ or $ru-y$ would be Birkhoff--James orthogonal to $y$.
We can then easily see that $\fc{g_r}0<0$ and $\fc{g_r}1>0$.
Because $g_r$ is continuous and non-decreasing, we then have $\left(-\infty,0\right]\subset G_r\subset\p{-\infty,1}$.
Therefore, $\fc\beta r\in\p{0,1}$.
{% qed %}

</details>

<p class="no-indent">
**Lemma {#thm:bisector-function-symmetry}.**
The bisector function $\beta_{u,y}$ satisfies
$$\forall r\in\bR:\fc{\beta_{u,y}}r+\fc{\beta_{u,y}}{-r}\ge1.$$ {#eq:bisector-function-symmetry}
Furthermore, if $\opn{span}\B{u,y}$ is a strictly convex plane,
then
$$\forall r\in\bR:\fc{\beta_{u,y}}r+\fc{\beta_{u,y}}{-r}=1.$$ {#eq:bisector-function-symmetry-equality}
</p>

<details><summary>Proof</summary>

Follow the proof of Lemma [@thm:bisector-function-nonnegative].
We have
$$\fc{g_{-r}}s=\V{-ru+sy}-\V{-ru+\p{s-1}y}=-\fc{g_r}{1-s}.$$
Then,
$$G_{-r}=\set{s\in\bR}{\fc{g_r}{1-s}\ge0}=1-\set{s\in\bR}{\fc{g_r}s\ge0}.$$
Therefore,
$$1-\sup G_{-r}=\inf\set{s\in\bR}{\fc{g_r}s\ge0}\le\sup\set{s\in\bR}{\fc{g_r}s\le0}=\sup G_r,$$
so $\fc\beta r+\fc\beta{-r}\ge1$.

When $\opn{span}\B{u,y}$ is a strictly convex plane, $g_r$ is a strictly convex function,
so there is a unique solution to $\fc{g_r}s=0$ in the interval $s\in\p{0,1}$, and the solution is $\fc\beta r$.
Therefore, $1-G_{-r}=\left[\fc\beta{-r},+\infty\right)$.
This forces $\fc\beta r+\fc\beta{-r}=1$.
{% qed %}

</details>

<p class="no-indent">
**Lemma {#thm:voronoi-cell-descent-coordinate}.**
In a normed plane with a bisector coordinate system with basis $\B{u,y}$,
the Voronoi cell $D_y=\set{ru+sy}{s>\fc\beta r}$.
</p>

<details><summary>Proof</summary>

Choose $u\in X\setminus\B0$ such that $u\perp_\mrm{BJ}y$.
Let $\B{u,y}$ be the basis of the bisector coordinate system.
By the triangle inequality, for any $r\in\bR$, the function $s\mapsto\V{ru+sy}$ is convex.
Difference on a fixed interval of a convex function is monotonic, so
$$\fc{g_r}s\ceq\V{ru+sy}-\V{ru+\p{s-1}y}$$
is monotonically non-decreasing in $s$.
By Definition [@thm:bisector-function], we have $\fc\beta r=\sup\set{s\in\bR}{\fc{g_r}s\le0}$.
Therefore, $\fc{g_r}s>0\Leftrightarrow s>\fc\beta r$.

Now, for any $a\in X$, we can express it as $a=ru+sy$ in the bisector coordinate system.
Substitute it in the definition of $g_r$, and we have $\fc{g_r}s=\V a-\V{a-y}$.
By Definition [@thm:voronoi-cell], we have $a\in D_y\Leftrightarrow\V a>\V{a-y}$.
Therefore,
$$a\in D_y\Leftrightarrow\V a-\V{a-y}>0\Leftrightarrow\fc{g_r}s>0\Leftrightarrow s>\fc\beta r.$$
This means $D_y=\set{ru+sy}{s>\fc\beta r}$.
{% qed %}

</details>

<p class="no-indent">
**Lemma {#thm:bisector-positive-near-zero}.**
The bisector function is positive in a neighborhood of $0$.
</p>

<details><summary>Proof</summary>

Let $X$ be a normed space, and let $u,y\in X$ such that $u\perp_\mrm{BJ}y$.
If $u=0$ or $y=0$, the result is trivial.
We assume $u,y\ne0$ from here and use a bisector coordinate system with basis $\B{u,y}$ in their spanned plane.

By Definition [@thm:bisector-function], we have $s>\fc\beta r\Rightarrow\V{ru+sy}>\V{ru+\p{s-1}y}$.
By the triangle inequality, we have
$$\V{ru+sy}\le\V{ru}+\V{sy},\qquad
\V{ru+\p{s-1}y}\ge\V{\p{s-1}y}-\V{ru}.$$
Therefore, $s>\fc\beta r\Rightarrow\V{ru}+\V{sy}>\V{\p{s-1}y}-\V{ru}$.
Solving this inequality for $s$ gives
(taking into account that $\fc\beta r\ge0$ by Lemma [@thm:bisector-function-nonnegative])
$$s>\fc\beta r\Rightarrow s>\opc{max}{0,\fr12-\fr{\V u}{\V y}\v r}.$$

<details><summary>Solving $\V{ru}+\V{sy}>\V{\p{s-1}y}-\V{ru}$ for $s$</summary>
<p>
Rearrange the inequality to get
$$\v{s-1}-\v s<\fr{2\V u}{\V v}\v r\eqc\fc hr.$$
The left-hand side is
$$\v{s-1}-\v s=\begin{dcases}
1,&s\in\left(-\infty,0\right],\\
1-2s,&s\in\p{0,1},\\
-1,&s\in\left[1,+\infty\right).
\end{dcases}$$
We do not need to consider the case $s\in\left(-\infty,0\right]$ because $s>\fc\beta r\ge0$.
Because $\fc hr\ge0$, the inequality is always satisfied when $s\in\left[1,+\infty\right)$.
The only nontrivial case is when $s\in\p{0,1}$, where the inequality becomes $s>\p{1-\fc hr}/2$.
Therefore, the full solution to the inequality is
$$s\in\p{\p{\fr{1-\fc hr}2,+\infty}\cap\p{0,1}\cup\left[1,+\infty\right)}\setminus\left(-\infty,0\right]
=\p{\opc{max}{0,\fr{1-\fc hr}2},+\infty}.$$
</p>
</details>

This implication relation then translates to the inequality
$$\fc\beta r\ge\opc{max}{0,\fr12-\fr{\V u}{\V v}\v r}.$$
Noting that the right-hand side is positive when $r$ is in a neighborhood of $0$,
we get that $\fc\beta r$ is positive when $r$ is in a neighborhood of $0$.
{% qed %}

</details>

<p class="no-indent">
**Lemma {#thm:not-left-unique-to-asymptotically-balanced}.**
Let $X$ be a normed space and $y\in X$.
If there exists two linearly independent vectors $u_1,u_2\in X$ such that
$u_1,u_2\perp_\mrm{BJ}y$ and that $u_1,u_2,y$ are linearly dependent,
then $X$ is asymptotically balanced at $y$.
</p>

<details><summary>Proof</summary>

The case when $y=0$ is trivial, and we assume $y\ne0$ from here.

Because $u_1,u_2,y$ are linearly dependent, we can express $u_2=r'u_1+s'y$ for some $r',s'\in\bR$.
We know $u_2,y$ are linearly independent by Theorem [@thm:bj-orthogonal-existence],
so $r'\ne0$.
Because $u_1,u_2$ are linearly independent, we have $s'\ne0$.
Now define
$$u_-\ceq\begin{dcases}
u_1,&s'/r'>0,\\
u_2/r',&s'/r'<0,
\end{dcases}\qquad
u_+\ceq\begin{dcases}
u_2/r',&s'/r'>0,\\
u_1,&s'/r'<0,
\end{dcases}\qquad
t_0\ceq\v{\fr{s'}{r'}}.$$
We then have $u_+=u_-+t_0y$ and $t_0>0$.
Obviously, we have $u_-,u_+\perp_\mrm{BJ}y$, and all of them are nonzero.

Notice that $u_+\perp_\mrm{BJ}y$ forces $t\mapsto\V{u_++ty}$ to be non-increasing on $\left(-\infty,0\right]$,
which is equivalent to $t\mapsto\V{u_-+ty}$ being non-increasing on $\left(-\infty,t_0\right]$.
On the other hand, $u_-\perp_\mrm{BJ}y$ forces $t\mapsto\V{u_-+ty}$ to be non-decreasing on $\left[0,+\infty\right)$.
Simultaneously satisfying both monotonicity conditions forces $t\mapsto\V{u_-+ty}$ to be constant on $\b{0,t_0}$.
Define
$$u\ceq\fr12\p{u_-+u_+}=u_-+\fr{t_0}2y,$$
and we then have
$$\V{u_-}=\V{u_-+\fr{t_0}2y}=\V u.$$
Therefore,
$$\forall t\in\bR:\V{u+ty}=\V{u_-+\p{t+\fr{t_0}2}y}\ge\V{u_-}=\V u,$$
which means that $u\perp_\mrm{BJ}y$.

Define $\fc dt\ceq\V{u+ty}-\V u$.
Then, $\fc dt=0$ whenever $\v t\le t_0/2$.
This satisfies the condition $\fc dt=\order{\fc d{-t}}$ as $t\to0$.
Therefore, $X$ is asymptotically balanced at $y$.
{% qed %}

</details>

<p class="no-indent">
**Lemma {#thm:asymptotically-balanced-to-positively-bisectable}.**
A normed space $X$ is positively bisectable at $y\in X$
if $X$ is asymptotically balanced at $y$.
</p>

<details><summary>Proof</summary>

The case where $y=0$ is trivial, and we assume $y\ne0$ from here.

Suppose $X$ is asymptotically balanced at $y\in X$.
By Definition [@thm:asymptotically-balanced], there exists a nonzero $u\perp_\mrm{BJ}y$ and $M_0,\dlt_0>0$
such that $\fc dt\ceq\V{u+ty}-\V u$ satisfies $\forall t\in\b{-\dlt_0,\dlt_0}:\fc dt\le M_0\fc d{-t}$.

Consider two cases: either there exists $t'\in\bR\setminus\B0$ such that $\fc d{t'}=0$
or it does not exist.
For the case where it exists, define $T\ceq\set{t\in\bR}{\fc dt=0}$.
Then we have $\B{0,t'}\subseteq T$, which means $T$ is not a singleton.
Because $d$ is continuous, $T$ is closed.
Because $d$ is convex, $T$ is also convex, so $T=\b{t_-,t_+}$ for some $t_-\le t_+$.

Because $T$ is not a singleton, $t_-<t_+$, which means that at least one of $t_-<0$ and $t_+>0$ must be true.
When $t_-<0$, to satisfy $\fc dt\le M_0\fc d{-t}$ at $t=\opc{min}{\dlt_0,-t_-}$, we must have $t_+>0$.
Similarly, when $t_+>0$, we must have $t_-<0$.
Therefore, $t_-<0<t_+$.

Define $u_\pm\ceq u+t_\pm y$.
Obviously $u_\pm$ are nonzero and linearly independent.
Then, $\fc d{t_\pm}=0$ means $\V{u_\pm}=\V u$, so for any $t\in\bR$, we have
$$\V{u_\pm+ty}=\V{u+\p{t_\pm+t}y}\ge Vu=\V{u_\pm},$$
which means $u_\pm\perp_\mrm{BJ}y$,
and we can then talk about their respective bisector functions.
By Definition [@thm:bisector-function], we have
$$\begin{align*}
	\fc{\beta_{u_\pm,y}}r
	&=\sup\set{s\in\bR}{\V{r\p{u+t_\pm y}+sy}\le\V{r\p{u+t_\pm y}+\p{s-1}y}}\\
	&=\sup\set{s-rt}{\V{ru+sy}\le\V{ru+\p{s-1}y}}\\
	&=\fc{\beta_{u,y}}r-rt_\pm.
\end{align*}$$
By Lemma [@thm:bisector-function-nonnegative], we have $\fc{\beta_{u_\pm,y}}r\ge0$, so
$$\fc{\beta_{u,y}}r=\fc{\beta_{u_\pm,y}}r+rt_\pm\ge rt_\pm.$$
By Lemma [@thm:bisector-positive-near-zero], there exists $\dlt,\veps>0$ such that
$\fc{\beta_{u,y}}r\ge\veps$ whenever $\v r<\dlt$.
Combining all three inequalities on $\fc{\beta_{u,y}}r$ gives
$$\fc{\beta_{u,y}}r\ge\opc{min}{\veps,t_+\dlt,-t_-\dlt}>0.$$

<details><summary>Why $\fc{\beta_{u,y}}r\ge\opc{min}{\veps,t_+\dlt,-t_-\dlt}$</summary>
<p>
First, when $r\ge\dlt$, we have
$$\fc{\beta_{u,y}}r\ge rt_+\ge t_+\dlt.$$
Second, when $r\le-\dlt$, we have
$$\fc{\beta_{u,y}}r\ge rt_-\ge -t_-\dlt.$$
Third, when $\v r<\dlt$, we have $\fc{\beta_{u,y}}r\ge\veps$.
Combining all three cases gives the result.
</p>
</details>

<p class="no-indent">
Taking the infimum over $r\in\bR$, we then see that $X$ is positively bisectable at $y$
by Definition [@thm:positively-bisectable].
</p>

Now consider the second case, where $\fc dt>0$ for all $t\in\bR\setminus\B0$.
The triangle inequality gives
$$\v t\V y-2\V u\le\fc dt\le\v t\V y.$$
Therefore, $\v t\ge4\V u/\V y\Rightarrow\fc dt\le2\fc d{-t}$.

<details><summary>Why $\fc dt\le2\fc d{-t}$</summary>
<p>
When $\v t\ge4\V u/\V y$, we have
$$\fr12\v t\V y\le\v t\V y-2\V u\le\fc dt\le\v t\V y\le2\fc d{-t},$$
where the last inequality reuses $\v t\V y/2\le\fc dt$ with $t$ replaced with $-t$.
</p>
</details>

Define
$$M\ceq\opc{max}{M_0,2,\fr{\max\set{\fc dt}{\dlt_0\le\v t\le4\V u/\V y}}{\min\set{\fc d{-t}}{\dlt_0\le\v t\le4\V u/\V y}}}.$$
We then have $\forall t\in\bR:\fc dt\le M\fc d{-t}$.

Suppose for contradiction that there exists a sequence $\B{r_n}$ such that $\fc\beta{r_n}\to0$.
Because of Lemma [@thm:bisector-positive-near-zero], $r_n$ cannot converge to $0$,
so we can take a subsequence whose elements are all nonzero,
so without loss of generality, we assume that $r_n\ne0$ for all $n$.
Define $s_n\ceq\fc\beta{r_n}+1/n$.
Because $s_n>\fc\beta{r_n}$, by Definition [@thm:bisector-function], we have
$$\V{r_nu+s_ny}>\V{r_nu+\p{s_n-1}y}.$$
Therefore,
$$M\fc d{-\fr{s_n}{r_n}}\ge\fc d{\fr{s_n}{r_n}}
=\V{u+\fr{s_n}{r_n}y}>\V{u+\fr{s_n-1}{r_n}y}
=\fc d{\fr{s_n-1}{r_n}}.$$ {#eq:asymptotically-balanced-to-positively-bisectable-inequality}
Because $s_n\to0$, there exists $N$ such that
$\forall n\ge N:s_n\le1/\p{M+1}$.
When $n\ge N$, we have
$$0<\fr{s_n}{1-s_n}\le\fr1M\le\fr12<1,$$
so we can use $s_n/\p{1-s_n}$ as a convex combination weight.
Because $d$ is a convex function, we have
$$\fc d{-\fr{s_n}{r_n}}
\le\fr{1-2s_n}{1-s_n}\fc d0+\fr{s_n}{1-s_n}\fc d{\fr{1-s_n}{s_n}\fr{-s_n}{r_n}}
=\fr{s_n}{1-s_n}\fc d{\fr{s_n-1}{r_n}}.$$
Chain this inequality after Equation [@eq:asymptotically-balanced-to-positively-bisectable-inequality] to get
$$M\fc d{-\fr{s_n}{r_n}}>\fc d{\fr{s_n-1}{r_n}}\ge\fr{1-s_n}{s_n}\fc d{-\fr{s_n}{r_n}}.$$
Dividing both sides by $\fc d{-s_n/r_n}$ gives $M>\p{1-s_n}/s_n$,
which contradicts with $s_n\le1/\p{M+1}$.

Therefore, $\fc\beta r$ cannot converge to $0$, and we have $\inf_{r\in\bR}\fc\beta r>0$.
This means $X$ is positively bisectable at $y$ by Definition [@thm:positively-bisectable].
{% qed %}

</details>

<p class="no-indent">
**Lemma {#thm:not-asymptotically-balanced-to-not-positively-bisectable}.**
A normed space $X$ is not positively bisectable at $y\in X$
if $X$ is not asymptotically balanced at $y$.
</p>

<details><summary>Proof</summary>

Suppose that $X$ is not asymptotically balanced at $y\in X$.
By Lemma [@thm:not-left-unique-to-asymptotically-balanced],
for any nonzero $u\perp_\mrm{BJ}y$, it is the only vector in $\opn{span}\B{u,y}$
such that $u\perp_\mrm{BJ}y$ up to scalar multiples.
Therefore, $\forall t\in\bR\setminus\B0:\fc dt>0$.
Because $d$ is a convex function,
it is strictly monotonically increasing on $\b{0,+\infty}$
and strictly monotonically decreasing on $\b{-\infty,0}$.

By Definition [@thm:asymptotically-balanced], there exists a sequence $\B{t_n}$
such that $\fc d{-t_n}/\fc d{t_n}\to+\infty$.
For large enough $n$, we have $\fc d{-t_n}/\fc d{t_n}>1$,
so without loss of generality, we can assume that $\fc d{-t_n}>\fc d{t_n}$ for all $n$.

Let $t'_n$ be the solution of $\fc d{t'_n}=\fc d{-t_n}$ in the region $t'_n\sgn t_n>0$.
A unique solution for $t'_n$ must exist because $d$ is continuous and strictly monotonic in this region
and $\fc d0=0$ and $\fc d\infty=+\infty$.
We then have $\fc d{t'_n}/\fc d{t_n}\to+\infty$.

By the monotonicity of $d$, we have $\v{t'_n}>\v{t_n}$ because $\fc d{t'_n}>\fc d{t_n}$.
By the convexity of $d$, we have
$$\p{1-\fr{t_n}{t'_n}}\fc d0+\fr{t_n}{t'_n}\fc d{t'_n}\ge\fc d{\fr{t_n}{t'_n}t'_n},$$
which simplifies to $t'_n/t_n\ge\fc d{t'_n}/\fc d{t_n}$.
Therefore, $t'_n/t_n\to+\infty$.

Define
$$r_n\ceq-\fr1{\fr{n+1}nt_n+t'_n},\qquad
s_n\ceq\fr{\fr{n+1}nt_n}{\fr{n+1}nt_n+t'_n}.$$
Then, we have
$$-\fr{n+1}nt_n=\fr{s_n}{r_n},\qquad
t'_n=\fr{s_n-1}{r_n}.$$
By
$$\fc d{-\fr{n+1}nt_n}>\fc d{-t_n}=\fc d{t'_n},$$
we have
$$\V{u+\fr{s_n}{r_n}y}>\V{u+\fr{s_n-1}{r_n}y}.$$
By Definition [@thm:bisector-function], we have $s_n>\fc\beta{r_n}$.
However, we have $s_n\to0$, which forces $\fc\beta{r_n}\to0$.
Therefore, $\inf_{r\in\bR}\fc\beta r=0$,
which means $X$ is not positively bisectable at $y$ by Definition [@thm:positively-bisectable].
{% qed %}

</details>

<p class="no-indent">
**Lemma {#thm:choose-descent-from-positive-bisectable}.**
Let $X$ be a strictly convex positively bisectable normed plane and $u\in X$.
Then there exists $v\in X\setminus\B0$ such that $u\perp_\mrm{BJ}v$ and $\inf_{r\in\bR}\fc{\beta_{u,v}}r>0$.
</p>

<details><summary>Proof</summary>

The case w here $u=0$ is trivial.
Consider $u\ne0$ from here on.

By Theorem [@thm:subdifferential-properties], there exists $f\in\fc Ju$.
Pick $v\in\opn{ker}f\setminus\B0$.
Then, by Theorem [@thm:subdifferential-directional-derivative], we have
$$\forall t\in\bR:\V{u+tv}-\V u\ge t\fc fv=0,$$
which means $u\perp_\mrm{BJ}v$.

Because $X$ is strictly convex, by Theorem [@thm:bj-orthogonal-existence],
$u$ is the unique vector in $X$ such that $u\perp_\mrm{BJ}v$ up to scalar multiples.
Because $X$ is positively bisectable, $u$ must satisfy $\inf_{r\in\bR}\fc{\beta_{u,v}}r>0$.
{% qed %}

</details>
</details>

<p class="no-indent">
**Theorem {#thm:2d-to-p1b}.**
A normed plane satisfies $P_1^\mrm b$.
</p>

<details><summary>Proof</summary>

Let $X$ be a normed plane and $S\subseteq X$ be a bounded set such that $0\in\opn{\overline{conv}}S$.
Suppose for contradiction that $y\in\fc I{S,0}$.
By Definition [@thm:voronoi-cell], we have $S\subseteq D_y$.

Because $S$ is bounded in a finite-dimensional space, we have $\opn{\overline{conv}}S=\opn{conv}\overline S$,
where $\overline S$ is the closure of $S$.
Therefore, $0\in\opn{conv}\overline S$.
By [Carath&eacute;odory's theorem](https://en.wikipedia.org/wiki/Carath%C3%A9odory's_theorem_(convex_hull)),
there exists at most $\dim X+1=3$ points $a_i\in\overline S$ such that
$0$ is a convex combination of $a_i$, i.e.,
there exists $\lmd_i\ge0$ such that $\sum_i\lmd_i=1$ and $\sum_i\lmd_ia_i=0$.
We can further dictate that $\lmd_i>0$ because we can simply discard any $a_i$ with $\lmd_i=0$.

<details><summary>Why $\opn{\overline{conv}}S=\opn{conv}\overline S$</summary>

The closure $\overline S$ is a closed bounded set in a finite-dimensional space, so it is compact
by the [Heine--Borel theorem](https://en.wikipedia.org/wiki/Heine%E2%80%93Borel_theorem).
Because $\opn{conv}\overline S$ is the image of a compact set $\Dlt_2\times\overline S^3$
(where $\Dlt_2$ is the 2-dimensional unit simplex embedded in $\bR^3$)
under the continuous map $\p{\B{\lmd_i},\B{a_i}}\mapsto\sum_i\lmd_ia_i$,
$\opn{conv}\overline S$ is also compact, so it is closed.

Now, taking the convex hull preserves set inclusion,
and we have $S\subseteq\overline S$, so $\opn{conv}S\subseteq\opn{conv}\overline S$.
Because $\opn{conv}\overline S$ is closed,
it must contain the closure of $\opn{conv}S$,
so we have $\opn{\overline{conv}}S\subseteq\opn{conv}\overline S$.

On the other hand, taking the closure preserves set inclusion,
and we have $S\subseteq\opn{conv}S$, so $\overline S\subseteq\opn{\overline{conv}}S$.
Because $\opn{\overline{conv}}S$ is convex,
it must contain the convex hull of $\overline S$,
so we have $\opn{conv}\overline S\subseteq\opn{\overline{conv}}S$.

We then have $\opn{\overline{conv}}S=\opn{conv}\overline S$.

</details>

Set up a bisector coordinate system with $y$ as the descent direction.
Denote the bisector direction as $u$.
We can always choose $u$ so that $\forall t\in\p{0,+\infty}:\V{u+ty}>\V u$.

<details><summary>Why we can choose $u$ so that $\forall t\in\p{0,+\infty}:\V{u+ty}>\V u$</summary>
<p>
Let $u'\in X\setminus\B0$ such that $u'\perp_\mrm{BJ}y$.
By Definition [@thm:birkhoff-james-orthogonality], we have $\forall t\in\bR:\V{u'+ty}\ge\V{u'}$.
Define $T\ceq\set{t\in\bR}{\V{u'+ty}=\V{u'}}$.
Because $t\mapsto\V{u'+ty}$ is continuous, $T$ is closed.
Define $u\ceq u'+y\max T$.
We can easily see that $u\perp_\mrm{BJ}y$ and $\forall t\in\p{0,+\infty}:\V{u+ty}>\V u$.
</p>
</details>

Because $S\subseteq D_y$, we have
$\overline S\subseteq\overline{D_y}$, where $\overline{D_y}$ is the closure of $D_y$.
By Lemma [@thm:bisector-function-nonnegative] and Lemma [@thm:voronoi-cell-descent-coordinate],
we have
$$D_y=\set{ru+sy}{s>\fc\beta r}\subseteq H\ceq\set{ru+sy}{s>0}.$$
Take the closure to get
$$\overline{D_y}\subseteq\overline H=\set{ru+sy}{s\ge0}.$$
Therefore, all $a_i$ has nonnegative $s$-coordinates, i.e., $\fc{\pi_s}{a_i}\ge0$ for all $i$.
On the other hand, acting $\pi_s$ on the convex combination $\sum_i\lmd_ia_i=0$ gives
$\sum_i\lmd_i\fc{\pi_s}{a_i}=0$.
Because $\lmd_i>0$ for all $i$, we must have $\fc{\pi_s}{a_i}=0$ for all $i$.
We then have $a_i=\fc{\pi_r}{a_i}u$ for all $i$.

Consider two cases.
For the first case, all $a_i$ are the same point.
Because their convex combination is $0$, we then have $a_i=0$ for all $i$.
We then have $0\in\overline S\subseteq\overline{D_y}\subseteq\bar D_y$,
which means $\V{y-0}\le\V0$, so $y=0$.
However, $\fc I{S,0}$ cannot contain $0$ by definition, so this is a contradiction.

For the second case, at least two $a_i$ are different points.
Because $\sum_i\lmd_i\fc{\pi_r}{a_i}=0$,
there must exist $i$ with $\fc{\pi_r}{a_i}<0$ and another $i$ with $\fc{\pi_r}{a_i}>0$.
Without loss of generality, suppose that $\fc{\pi_r}{a_1}<0$.
Then, because $a_1\in\overline{D_y}\subseteq\bar D_y$, we have $\V{a_1-y}\le\V{a_1}$.
On the other hand, since $\forall t\in\p{0,+\infty}:\V{u+ty}>\V u$, we have
$$\V{a_1-y}=\v{\fc{\pi_r}{a_1}}\V{u-\fr1{\fc{\pi_r}{a_1}}y}>\v{\fc{\pi_r}{a_1}}\V u=\V{a_1}.$$
This gives a contradiction.

Either way, we have a contradiction, so $\fc I{S,0}=\varnothing$.
{% qed %}

</details>

<p class="no-indent">
**Theorem {#thm:strictly-convex-2d-to-bar-p1b}.**
A strictly convex plane satisfies $\bar P_1^\mrm b$.
</p>

<details><summary>Proof</summary>

Let $X$ be a strictly convex plane and $S\subseteq X$ be a bounded set such that $0\in\opn{\overline{conv}}S$.
Suppose for contradiction that $y\in\fc{\bar I}{S,0}\setminus\B0$.
By Definition [@thm:voronoi-cell], we have $S\subseteq\bar D_y$.
Because $\bar D_y$ is already a closed set, we have $\overline S\subseteq\bar D_y$,
where $\overline S$ is the closure of $S$.

Set up a bisector coordinate system with $y$ as the descent direction.
Denote the bisector direction as $u$.
By Lemma [@thm:bisector-function-nonnegative] and Lemma [@thm:voronoi-cell-descent-coordinate],
we have
$$D_y=\set{ru+sy}{s>\fc\beta r}\subseteq H\ceq\set{ru+sy}{s>0}.$$
Take the closure to get
$$\overline{D_y}\subseteq\overline H=\set{ru+sy}{s\ge0}.$$
By Theorem [@thm:voronoi-cell-closure], we have $\bar D_y=\overline{D_y}$, so we have
$\overline S\subseteq\bar D_y=\overline{D_y}\subseteq\overline H$.

All the rest of the proof is almost the same as the proof of Theorem [@thm:2d-to-p1b].
However I will repeat it here for completeness.

Because $S$ is bounded in a finite-dimensional space, we have $\opn{\overline{conv}}S=\opn{conv}\overline S$.
Therefore, $0\in\opn{conv}\overline S$.
By [Carath&eacute;odory's theorem](https://en.wikipedia.org/wiki/Carath%C3%A9odory's_theorem_(convex_hull)),
there exists at most $\dim X+1=3$ points $a_i\in\overline S$ such that
$0$ is a convex combination of $a_i$, i.e.,
there exists $\lmd_i\ge0$ such that $\sum_i\lmd_i=1$ and $\sum_i\lmd_ia_i=0$.
We can further dictate that $\lmd_i>0$ because we can simply discard any $a_i$ with $\lmd_i=0$.

Because $a_i\in\overline S\subseteq\overline H$,
all $a_i$ has nonnegative $s$-coordinates, i.e., $\fc{\pi_s}{a_i}\ge0$ for all $i$.
On the other hand, acting $\pi_s$ on the convex combination $\sum_i\lmd_ia_i=0$ gives
$\sum_i\lmd_i\fc{\pi_s}{a_i}=0$.
Because $\lmd_i>0$ for all $i$, we must have $\fc{\pi_s}{a_i}=0$ for all $i$.
We then have $a_i=\fc{\pi_r}{a_i}u$ for all $i$.

Consider two cases.
For the first case, all $a_i$ are the same point.
Because their convex combination is $0$, we then have $a_i=0$ for all $i$.
We then have $0\in\overline S\subseteq\bar D_y$,
which means $\V{y-0}\le\V0$, so $y=0$,
contradicting with $y\in\fc{\bar I}{S,0}\setminus\B0$.

For the second case, at least two $a_i$ are different points.
Because $\sum_i\lmd_i\fc{\pi_r}{a_i}=0$,
there must exist $i$ with $\fc{\pi_r}{a_i}<0$ and another $i$ with $\fc{\pi_r}{a_i}>0$.
Without loss of generality, suppose that $\fc{\pi_r}{a_1}<0$ and $\fc{\pi_r}{a_2}>0$.
Then, because $a_1,a_2\in\bar D_y$, we have
$\V{a_1-y}\le\V{a_1}$ and $\V{a_2-y}\le\V{a_2}$.
Adding them together gives
$$\V{a_1-y}+\V{a_2-y}\le\V{a_1}+\V{a_2}=\p{\v{\fc{\pi_r}{a_1}}+\v{\fc{\pi_r}{a_2}}}\V u
=\V{a_1-a_2}.$$
By the triangle inequality,
$$\V{a_1-y}+\V{a_2-y}\ge\V{a_1-a_2}.$$
Therefore, we have $\V{a_1-y}+\V{a_2-y}=\V{a_1-a_2}$,
which means $y$ is also on $\bR u$ since $X$ is strictly convex,
but this is impossible because we dictate $u,y$ to be linearly independent
in the definition of the bisector coordinate system, so this is a contradiction.

Either way, we have a contradiction, so $\fc{\bar I}{S,0}=\B0$.
{% qed %}

</details>

<p class="no-indent">
**Theorem {#thm:asymptotically-balanced-to-p1a}.**
An asymptotically balanced normed plane satisfies $P_1^\mrm a$.
</p>

<details><summary>Proof</summary>

Let $X$ be an asymptotically balanced normed plane.
By Theorem [@thm:voronoi-cell-equivalence], to prove that $X$ satisfies $P_1^\mrm a$,
it is equivalent to prove that $0\notin\opn{\overline{conv}}D_y$ for any $y\in X$,
where $D_y$ is the Voronoi cell of $y$.
The case where $y=0$ is trivial, and we assume $y\ne0$ from here.

By Lemma [@thm:asymptotically-balanced-to-positively-bisectable], $X$ is positively bisectable.
This means we can choose a nonzero $u\perp_\mrm{BJ}y$ such that $\inf_{r\in\bR}\fc{\beta_{u,y}}r\eqc\veps>0$.

Set up a bisector coordinate system with basis $\B{u,y}$.
Then, $D_y=\set{ru+sy}{s>\fc\beta r}$ by Lemma [@thm:voronoi-cell-descent-coordinate].
By the $\veps$ bound, we have $D_y\subseteq\set{ru+sy}{s>\veps}$,
so $\opn{\overline{conv}}D_y\subseteq\set{ru+sy}{s\ge\veps}$.
We then obviously have $0\notin\opn{\overline{conv}}D_y$.
{% qed %}

</details>

<p class="no-indent">
**Theorem {#thm:strictly-convex-asymptotically-balanced-to-bar-p1a}.**
A strictly convex asymptotically balanced plane satisfies $\bar P_1^\mrm a$.
</p>

<details><summary>Proof</summary>

Let $X$ be a strictly convex asymptotically balanced plane.
By Theorem [@thm:voronoi-cell-equivalence], to prove that $X$ satisfies $\bar P_1^\mrm a$,
it is equivalent to prove that $0\notin\opn{\overline{conv}}\bar D_y$ for any $y\in X\setminus\B0$,
where $\bar D_y$ is the closed Voronoi cell of $y$.

By Lemma [@thm:asymptotically-balanced-to-positively-bisectable], $X$ is positively bisectable.
This means we can choose a nonzero $u\perp_\mrm{BJ}y$ such that $\inf_{r\in\bR}\fc{\beta_{u,y}}r\eqc\veps>0$.

Set up a bisector coordinate system with basis $\B{u,y}$.
Then, $D_y=\set{ru+sy}{s>\fc\beta r}$ by Lemma [@thm:voronoi-cell-descent-coordinate].
By the $\veps$ bound, we have $D_y\subseteq\set{ru+sy}{s>\veps}$.
Take the closure to get $\overline{D_y}\subseteq\set{ru+sy}{s\ge\veps}$.
By Theorem [@thm:voronoi-cell-closure], we have $\bar D_y=\overline{D_y}$,
so $\bar D_y\subseteq\set{ru+sy}{s\ge\veps}$.
We then obviously have $0\notin\opn{\overline{conv}}\bar D_y$.
{% qed %}

</details>

<p class="no-indent">
**Theorem {#thm:not-asymptotically-balanced-to-not-p1a}.**
A normed plane that is not asymptotically balanced does not satisfy $P_1^\mrm a$.
</p>

<details><summary>Proof</summary>

Let $X$ be an asymptotically balanced normed plane.
By Theorem [@thm:voronoi-cell-equivalence], to prove that $X$ satisfies $P_1^\mrm a$,
it is equivalent to prove that there exists $y\in X$ such that $0\in\opn{\overline{conv}}D_y$.

By Lemma [@thm:not-asymptotically-balanced-to-not-positively-bisectable],
$X$ is not positively bisectable.
This means that there exists $y\in X$ and a nonzero $u\perp_\mrm{BJ}y$ such that
$\inf_{r\in\bR}\fc{\beta_{u,y}}r=0$.
Since $y=0$ trivially cannot satisfy this condition, we assume $y\ne0$ from here.
Set up a bisector coordinate system with basis $\B{u,y}$.

By Lemma [@thm:not-left-unique-to-asymptotically-balanced],
$u$ is the only vector in $X$ such that $u\perp_\mrm{BJ}y$ up to scalar multiples.
Therefore, by Lemma [@thm:bisector-function-nonnegative], we have $\fc\beta r\in\p{0,1}$ for all $r\in\bR$.

The zero infimum of $\beta$ means there exists a sequence $\B{r_n}$
such that $\fc\beta{r_n}\to0$.
Define
$$b_n\ceq r_nu+\p{\fc\beta{r_n}+\fr1n}y,\qquad
b'_n\ceq-nr_nu+y.$$
Because $D_y=\set{ru+sy}{s>\fc\beta r}$ by Lemma [@thm:voronoi-cell-descent-coordinate],
we have $b_n,b_n'\in D_y$.
Then, the convex combination
$$a_n\ceq\fr{nb_n+b'_n}{n+1}=\fr{n\fc\beta{r_n}+2}{n+1}y\in\opn{conv}D_y.$$
The limit of $\B{a_n}$ is then in $\opn{\overline{conv}}D_y$, so $0\in\opn{\overline{conv}}D_y$.
{% qed %}

</details>

<p class="no-indent">
**Theorem {#thm:2d-strictly-convex-to-p2a}.**
A strictly convex plane satisfies $P_2^\mrm a$.
</p>

<details><summary>Proof</summary>

Let $X$ be a strictly convex plane.
We need to prove that for any $S\subseteq X$ and $x\in X$ such that $x\notin\opn{\overline{conv}}S$,
we have $\fc I{S,x}\ne\varnothing$.

Define $C\ceq\opn{\overline{conv}}S-x$, and we have $0\notin C$.
Because $C$ is a closed convex set, by the
[Hahn--Banach separation theorem](https://en.wikipedia.org/wiki/Hahn%E2%80%93Banach_theorem#Geometric_Hahn%E2%80%93Banach_(the_Hahn%E2%80%93Banach_separation_theorems)),
there exists $f'\in X^*$ and $\dlt\in\p{0,+\infty}$ such that
$\forall a\in C:\fc{f'}a\ge\dlt$.
Define $f\ceq f'/\dlt$, and we have $\forall a\in C:\fc fa\ge1$.

Pick any $u\in\opn{ker}f\setminus\B0$.
By Theorem [@thm:subdifferential-properties], there exists $g\in\fc Ju$.
Pick any $v'\in\opn{ker}g\setminus\B0$.
Then, by Theorem [@thm:subdifferential-directional-derivative], we have
$\forall t\in\bR:\V{u+tv'}-\V u\ge t\fc g{v'}=0$.
Therefore, $u\perp_\mrm{BJ}v'$.
By Theorem [@thm:bj-orthogonal-existence], $u,v'$ are linearly independent, so $v'\notin\opn{ker}f$.
Define $v\ceq v'/\fc f{v'}$.

Set up a bisector coordinate system with basis $\B{u,v}$.
We have $\fc fu=0$ and $\fc fv=1$, so $f=\pi_s$.
Then, $\forall a\in C:\fc fa\ge1$ is equivalent to $\forall ru+sv\in C:s\ge1$.
By Lemma [@thm:bisector-function-nonnegative], we have $\fc\beta r<1$ for all $r\in\bR$.
By Lemma [@thm:voronoi-cell-descent-coordinate], we have $D_v=\set{ru+sv}{s>\fc\beta r}$.
Therefore,
$$S-x\subseteq C\subseteq\set{ru+sv}{s\ge1}\subseteq D_v.$$
By Definition [@thm:voronoi-cell], we can easily see $x+v\in\fc I{S,x}$.
{% qed %}

</details>

<p class="no-indent">
**Theorem {#thm:2d-to-bar-p2a}.**
A normed plane satisfies $\bar P_2^\mrm a$.
</p>

<details><summary>Proof</summary>

Let $X$ be a normed plane.
We need to prove that for any $S\subseteq X$ and $x\in X$ such that $x\notin\opn{\overline{conv}}S$,
we have $\fc{\bar I}{S,x}\setminus\B x\ne\varnothing$.

Define $C\ceq\opn{\overline{conv}}S-x$, and we have $0\notin C$.
Because $C$ is a closed convex set, by the
[Hahn--Banach separation theorem](https://en.wikipedia.org/wiki/Hahn%E2%80%93Banach_theorem#Geometric_Hahn%E2%80%93Banach_(the_Hahn%E2%80%93Banach_separation_theorems)),
there exists $f'\in X^*$ and $\dlt\in\p{0,+\infty}$ such that
$\forall a\in C:\fc{f'}a\ge\dlt$.
Define $f\ceq f'/\dlt$, and we have $\forall a\in C:\fc fa\ge1$.

Pick any $u\in\opn{ker}f\setminus\{0\}$.
By Theorem [@thm:bj-orthogonal-existence], there exists $v'\in X\setminus\B0$ such that $u\perp_\mrm{BJ}v'$.
Because $u,v'$ are linearly independent, $v'\notin\opn{ker}f$, so $\fc f{v'}\ne0$.
Define $v\ceq v'/\fc f{v'}$.
Because Birkhoff--James orthogonality is invariant under scalar multiplication,
we still have $u\perp_\mrm{BJ}v$.
Also, we have $\fc fv=1$.

Set up a bisector coordinate system with basis $\B{u,v}$.
Any $a\in C$ can be expressed as $a=ru+sv$ for some $r,s\in\bR$.
Then, $\fc fa\ge1$ can be expressed as $\forall ru+sv\in C:s\ge1$.
Because $u\perp_\mrm{BJ}v$, we have $\V{ru+sv}\ge\V{ru}$ for all $r,s\in\bR$.
Therefore, $s\mapsto\V{ru+sv}$ achieves its global minimum at $s=0$.
Because it is a convex function, it is monotonically non-decreasing on $\left[0,+\infty\right)$.
Then, for any $a\in C$,
$$\V{a-v}=\V{ru+\p{s-1}v}\le\V{ru+sv}=\V a.$$
We can then see that $x+v\in\fc{\bar I}{S,x}$.
This proves $\bar P_2^\mrm a$.
{% qed %}

</details>

## Summary

The following table lists the required theorems for completely characterizing the normed spaces
that satisfy each of the properties $P_{1,2}^{\mrm f,b,a}$ and $\bar P_{1,2}^{\mrm f,b,a}$.
This makes sure that any space matching the characterization satisfies the property
and that any space not matching the characterization does not satisfy the property.

| Property | Sufficiency | Necessity |
|-|-|-|
| $P_1^\mrm f$ | [@thm:inner-product-to-bar-p1a], [@thm:2d-to-p1b] | [@thm:not-inner-product-to-not-p1f] |
| $P_1^\mrm b$ | [@thm:inner-product-to-bar-p1a], [@thm:2d-to-p1b] | [@thm:not-inner-product-to-not-p1f] |
| $P_1^\mrm a$ | [@thm:inner-product-to-bar-p1a], [@thm:asymptotically-balanced-to-p1a] | [@thm:not-inner-product-to-not-p1f], [@thm:not-asymptotically-balanced-to-not-p1a] |
| $P_2^\mrm f$ | [@thm:inner-product-to-p2b], [@thm:2d-strictly-convex-to-p2a] | [@thm:not-strictly-convex-to-not-p2f], [@thm:p2f-to-inner-product] |
| $P_2^\mrm b$ | [@thm:inner-product-to-p2b], [@thm:2d-strictly-convex-to-p2a] | [@thm:not-strictly-convex-to-not-p2f], [@thm:p2f-to-inner-product] |
| $P_2^\mrm a$ | [@thm:hilbert-to-p2a], [@thm:2d-strictly-convex-to-p2a] | [@thm:not-strictly-convex-to-not-p2f], [@thm:not-hilbert-to-not-bar-p2a], [@thm:p2f-to-inner-product] |
| $\bar P_1^\mrm f$ | [@thm:inner-product-to-bar-p1a], [@thm:strictly-convex-2d-to-bar-p1b] | [@thm:not-strictly-convex-to-not-bar-p1f], [@thm:not-inner-product-to-not-p1f] |
| $\bar P_1^\mrm b$ | [@thm:inner-product-to-bar-p1a], [@thm:strictly-convex-2d-to-bar-p1b] | [@thm:not-strictly-convex-to-not-bar-p1f], [@thm:not-inner-product-to-not-p1f] |
| $\bar P_1^\mrm a$ | [@thm:inner-product-to-bar-p1a], [@thm:strictly-convex-asymptotically-balanced-to-bar-p1a] | [@thm:not-strictly-convex-to-not-bar-p1f], [@thm:not-inner-product-to-not-p1f], [@thm:not-asymptotically-balanced-to-not-p1a] |
| $\bar P_2^\mrm f$ | [@thm:inner-product-to-p2b], [@thm:2d-to-bar-p2a] | [@thm:finite-dimension-not-inner-product-to-not-bar-p2f] |
| $\bar P_2^\mrm b$ | [@thm:inner-product-to-p2b], [@thm:2d-to-bar-p2a] | [@thm:finite-dimension-not-inner-product-to-not-bar-p2f] |
| $\bar P_2^\mrm a$ | [@thm:hilbert-to-p2a], [@thm:2d-to-bar-p2a] | [@thm:not-hilbert-to-not-bar-p2a], [@thm:bar-p2a-to-inner-product] |

## Open problem

What are the exact characterizations of infinite-dimensional normed spaces
satisfying $\bar P_2^\mrm f$ and $\bar P_2^\mrm b$?

What is certain is that their characterizations must be different.
This is because $c_0$ (real sequences converging to $0$) with the supremum norm
satisfies $\bar P_2^\mrm b$ but not $\bar P_2^\mrm f$.
