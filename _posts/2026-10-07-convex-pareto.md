---
title: How Pareto optimizations of distances relate to closed convex hulls
date: 2026-10-07 14:03:46 -0700
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
  then the (weak/strong) Pareto set of them may contain or be contained by the closed convex hull of their ideal points.
  This article attempts to completely classify normed spaces based on whether the property holds
  for all finite sets, all compact sets, all bounded sets, or all sets of ideal points.
  Several characterizations in infinite dimensions remain open.
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
This article studies the four properties:
$$P_\supset:\qquad \opn{\overline{conv}}S\subseteq\fc PS,\qquad
\bar P_\supset:\qquad \opn{\overline{conv}}S\subseteq\fc{\bar P}S,$$
$$P_\subset:\qquad \fc PS\subseteq\opn{\overline{conv}}S,\qquad
\bar P_\subset:\qquad \fc{\bar P}S\subseteq\opn{\overline{conv}}S,$$
where $\opn{\overline{conv}}S$ denotes the
[closed convex hull](https://en.wikipedia.org/wiki/Convex_hull#Closed_and_open_hulls)
of $S$.

Based on the property of $S$, the four properties multiply to sixteen properties:
$P_{\supset,\subset}^\mrm f$ means $P_{\supset,\subset}$ holds for all finite $S\subseteq X$;
$P_{\supset,\subset}^\mrm c$ means $P_{\supset,\subset}$ holds for all compact $S\subseteq X$;
$P_{\supset,\subset}^\mrm b$ means $P_{\supset,\subset}$ holds for all bounded $S\subseteq X$;
$P_{\supset,\subset}^\mrm a$ means $P_{\supset,\subset}$ holds for all $S\subseteq X$;
and similarly for $\bar P_{\supset,\subset}^{\mrm f,\mrm c,\mrm b,\mrm a}$.

We assume $X\ne\B0$ throughout. For $S=\varnothing$, all sixteen properties then hold trivially,
so proofs involving $S$ may assume it is nonempty.
If $X=\B0$ and empty sets of ideal points are allowed, $\bar P_\subset$ fails for $S=\varnothing$.

Some of the properties are stronger than others.
First, all finite sets are compact, and all compact sets are bounded.
Second, we can easily see that $\fc{\bar P}S\subseteq\fc PS$.
Therefore,
$$P_{\supset,\subset}^\mrm a\Rightarrow P_{\supset,\subset}^\mrm b\Rightarrow P_{\supset,\subset}^\mrm c\Rightarrow P_{\supset,\subset}^\mrm f,\qquad
\bar P_{\supset,\subset}^\mrm a\Rightarrow \bar P_{\supset,\subset}^\mrm b\Rightarrow \bar P_{\supset,\subset}^\mrm c\Rightarrow \bar P_{\supset,\subset}^\mrm f,$$
$$\bar P_\supset^{\mrm f,\mrm c,\mrm b,\mrm a}\Rightarrow P_\supset^{\mrm f,\mrm c,\mrm b,\mrm a},\qquad
P_\subset^{\mrm f,\mrm c,\mrm b,\mrm a}\Rightarrow \bar P_\subset^{\mrm f,\mrm c,\mrm b,\mrm a}.$$

The established characterizations and the remaining gaps are summarized in the following table:

| Property | Characterization |
|-|-|
| $P_\supset^{\mrm f,\mrm c,\mrm b}$, $\bar P_\subset^\mrm b$ | inner product space or plane |
| $\bar P_\supset^{\mrm f,\mrm c,\mrm b}$, $P_\subset^\mrm b$ | inner product space or strictly convex plane |
| $P_\supset^\mrm a$ | inner product space or plane with balanced tangent chords |
| $\bar P_\supset^\mrm a$ | inner product space or strictly convex plane with balanced tangent chords |
| $P_\subset^{\mrm f,\mrm c}$ | finite dimensions: inner product space or strictly convex plane; infinite dimensions: open |
| $\bar P_\subset^{\mrm f,\mrm c}$ | finite dimensions: inner product space or plane; infinite dimensions: open |
| $P_\subset^\mrm a$ | Hilbert space or strictly convex plane |
| $\bar P_\subset^\mrm a$ | Hilbert space or plane |

<p class="no-indent">
Here, a plane means a two-dimensional real normed space.
See Definition [@thm:balanced-tangent-chords] for balanced tangent chords.
</p>

If we only consider the characterizations of spaces satisfying both
$P_\supset^{\mrm f,\mrm c,\mrm b,\mrm a}$ and $P_\subset^{\mrm f,\mrm c,\mrm b,\mrm a}$
(or both $\bar P_\supset^{\mrm f,\mrm c,\mrm b,\mrm a}$ and $\bar P_\subset^{\mrm f,\mrm c,\mrm b,\mrm a}$),
then there are no open gaps:

| Property | Characterization |
|-|-|
| $P_\supset^{\mrm f,\mrm c,\mrm b}\land P_\subset^{\mrm f,\mrm c,\mrm b}$, $\bar P_\supset^{\mrm f,\mrm c,\mrm b}\land\bar P_\subset^{\mrm f,\mrm c,\mrm b}$ | inner product space or strictly convex plane |
| $P_\supset^\mrm a\land P_\subset^\mrm a$, $\bar P_\supset^\mrm a\land\bar P_\subset^\mrm a$ | Hilbert space or strictly convex plane with balanced tangent chords |

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
Note the terminological quirk: a strong Pareto optimal has no weak Pareto improvement,
and a weak Pareto optimal has no strong Pareto improvement.
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

---

Questions of the same type were raised and answered by
[Durier (1987)](https://doi.org/10.1007/978-3-642-46618-2_6).
In his paper, he called $\fc{\bar P}S$ the strictly efficient points,
$\fc PS$ the weakly efficient points,
and the economic Pareto set the efficient points.
He also studied another type of optimal points called the properly efficient points.

## Preliminaries

<p class="no-indent">
**Theorem {#thm:not-strictly-convex-to-not-p2f}.**
If a normed space is not [strictly convex](https://en.wikipedia.org/wiki/Strictly_convex_space),
then it does not satisfy $P_\subset^\mrm f$.
</p>

<details><summary>Proof</summary>

Let $X$ be a normed space that is not strictly convex.
Its unit sphere contains a nontrivial line segment,
so there exist distinct unit vectors $u,v\in X$ such that $\V{u+v}=2$.
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

Thus, we have found a counterexample to $P_\subset^\mrm f$.
{% qed %}

</details>

<p class="no-indent">
**Theorem {#thm:not-strictly-convex-to-not-bar-p1f}.**
If a normed space is not strictly convex,
then it does not satisfy $\bar P_\supset^\mrm f$.
</p>

<details><summary>Proof</summary>

Let $X$ be a normed space that is not strictly convex.
Its unit sphere contains a nontrivial line segment,
so there exist distinct unit vectors $u,v\in X$ such that $\V{u+v}=2$.
Set $S\ceq\B{u,-v}$ and $x\ceq\p{u-v}/2$.
Obviously we have $x\in\opn{\overline{conv}}S$.
We have
$$\V{x-u}=\V{\fr{-u-v}2}=1,\qquad
\V{x+v}=\V{\fr{u+v}2}=1.$$

Now set $y\ceq u-v$.
Because $u,v$ are distinct vectors, we have $y\ne x$.
We also have
$$\V{y-u}=\V{-v}=1\le\V{x-u},\qquad
\V{y+v}=\V u=1\le\V{x+v}.$$
Therefore, $y\in\fc{\bar I}{S,x}$.
We have found a counterexample to $\bar P_\supset^\mrm f$.
{% qed %}

</details>

<p class="no-indent">
**Theorem {#thm:strictly-convex-to-equivalence}.**
Let $X$ be a strictly convex space and $S\subseteq X$.
Then, $\fc PS=\fc{\bar P}S$.
</p>

<details><summary>Proof</summary>

We obviously have $\fc{\bar P}S\subseteq\fc PS$,
so it is sufficient to prove $\fc PS\subseteq\fc{\bar P}S$.

Let $x\in X\setminus\fc{\bar P}S$.
Then there exists $y\in\fc{\bar I}{S,x}\setminus\B x$,
which satisfies $\forall a\in S:\V{y-a}\le\V{x-a}$.
Let $y'\ceq\p{x+y}/2$.
For each $a\in S$, $x\ne a$ because otherwise $\V{y-a}\le\V{x-a}=0$ would force $y=x$.
If $\V{y-a}<\V{x-a}$, the triangle inequality gives $\V{y'-a}<\V{x-a}$.
If the two norms are equal, their vectors are distinct, so strict convexity gives
$$\V{y'-a}=\V{\fr12\p{x-a}+\fr12\p{y-a}}
<\fr12\V{x-a}+\fr12\V{y-a}\le\V{x-a}.$$
Therefore, $y'\in\fc I{S,x}$, so $x\notin\fc PS$.
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
We can equivalently rewrite $P_\supset^{\mrm f,\mrm a}$ and $\bar P_\supset^{\mrm f,\mrm a}$ as follows:
$$\begin{align*}
	P_\supset^\mrm f:\qquad&\forall y\in X:0\notin\opn{conv}D_y,\\
	P_\supset^\mrm a:\qquad&\forall y\in X:0\notin\opn{\overline{conv}}D_y,\\
	\bar P_\supset^\mrm f:\qquad&\forall y\in X\setminus\B0:0\notin\opn{conv}\bar D_y,\\
	\bar P_\supset^\mrm a:\qquad&\forall y\in X\setminus\B0:0\notin\opn{\overline{conv}}\bar D_y.\\
\end{align*}$$
</p>

<details><summary>Proof</summary>

By Definition [@thm:voronoi-cell], we have $y\in\fc I{S,x}\Leftrightarrow S\subseteq D_{y,x}$.
Then, $P_\supset$ can be rewritten as
$$P_\supset:\qquad\p{\exists y\in X:S\subseteq D_{y,x}}\Rightarrow x\notin\opn{\overline{conv}}S.$$
Translate $S,x,y$ by $-x$, and rename the translated set $S$.
Since translation preserves finiteness, boundedness, and closed convex hulls, this gives
$$P_\supset:\qquad\p{\exists y\in X:S\subseteq D_y}\Rightarrow 0\notin\opn{\overline{conv}}S.$$
Using some first-order logic, we can rewrite this as
$$P_\supset:\qquad\forall y\in X:\p{S\subseteq D_y\Rightarrow 0\notin\opn{\overline{conv}}S}.$$
Now dictate it to be true for all finite, bounded, or arbitrary $S$, and we get
$$P_\supset^{\mrm f,\mrm b,\mrm a}:\qquad\forall y\in X:
0\notin\bigcup_{\substack{S\subseteq D_y\\\mrm f,\mrm b,\mrm a}}\opn{\overline{conv}}S.$$
By the same argument, we have
$$\bar P_\supset^{\mrm f,\mrm b,\mrm a}:\qquad\forall y\in X\setminus\B0:
0\notin\bigcup_{\substack{S\subseteq\bar D_y\\\mrm f,\mrm b,\mrm a}}\opn{\overline{conv}}S.$$

One of the equivalent definitions of the convex hull is the set of all convex combinations
of finitely many points in the set.
Notice that for finite $S$, $\opn{\overline{conv}}S$ is exactly the set of convex combinations of $S$.
Therefore, we have
$$\bigcup_{\substack{S\subseteq D_y\\\mrm{finite}}}\opn{\overline{conv}}S=\opn{conv}D_y.$$
Thus,
$$P_\supset^\mrm f:\qquad\forall y\in X:0\notin\opn{conv}D_y.$$

When $S$ can be any set such that $S\subseteq D_y$, one case is to have $S=D_y$.
We then have
$$\bigcup_{S\subseteq D_y}\opn{\overline{conv}}S=\opn{\overline{conv}}D_y.$$
Thus,
$$P_\supset^\mrm a:\qquad\forall y\in X:0\notin\opn{\overline{conv}}D_y.$$

By the same arguments, we have
$$\begin{align*}
	\bar P_\supset^\mrm f:\qquad\forall y\in X\setminus\B0:0\notin\opn{conv}\bar D_y,\\
	\bar P_\supset^\mrm a:\qquad\forall y\in X\setminus\B0:0\notin\opn{\overline{conv}}\bar D_y.
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

To prove Equation [@eq:subdifferential-inequality], write
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
$$\forall x\in X,t>0:\partial_v\V x=\max_{f\in\fc Jx}\fc fv
\le\fr{\V{x+tv}-\V x}t.$$ {#eq:subdifferential-directional-derivative}
</p>

<details><summary>Proof</summary>

For fixed $x\in X$, define $g:\p{0,+\infty}\times X\to\bR$ as
$$\fc g{t,w}\ceq\fr{\V{x+tw}-\V x}t.$$
By Definition [@thm:directional-derivative], we have $\partial_v\V x=\fc g{0^+,v}$.

First prove that $\fc g{0^+,w}$ exists.
By the triangle inequality, when $t'>t>0$, we have
$$\begin{align*}
	\fc g{t',w}-\fc g{t,w}
	&=\fr{\V{x+t'w}-\V x}{t'}-\fr{\V{x+tw}-\V x}t\\
	&\ge\fr{\V{x+t'w}-\V x}{t'}-\fr{\V{\fr t{t'}x+tw}+\V{x-\fr t{t'}x}-\V x}t\\
	&=0,
\end{align*}$$
so $\fc g{\cdot,w}$ is a monotonically non-decreasing function on $\p{0,+\infty}$.
Also, we have
$$\fc g{t,w}\ge\fr{\V{x+tw}-\V{x+tw}-\V{-tw}}t=-\V w,$$
so $\fc g{\cdot,w}$ is bounded below.
Therefore, $\fc g{0^+,w}$ exists.

To prove that $\forall t>0:\partial_v\V x\le\p{\V{x+tv}-\V x}/t$,
note that this statement is exactly $\fc g{0^+,v}\le\fc g{t,v}$,
which follows from the monotonicity of $\fc g{\cdot,v}$.

Then prove that $\max\fc fv$ exists.
This follows by maximizing the weak\*-continuous function $f\mapsto\fc fv$ over the nonempty weak\*-compact set $\fc Jx$.

By Equation [@eq:subdifferential-inequality], we have
$\V{x+tv}\ge\V x+\fc f{tv}$,
which simplifies to $\fc g{t,v}\ge\fc fv$.
Maximize over $f\in\fc Jx$ and taking infimum over $t\in\p{0,+\infty}$ on both sides to get
$$\fc g{0^+,v}\ge\max_{f\in\fc Jx}\fc fv.$$

Now we will explicitly construct a linear functional $f_0\in X^*$ such that
$\fc g{0^+,v}=\fc{f_0}v$ and later show that $f_0\in\fc Jx$.
To construct it, we will use the Hahn--Banach dominated extension theorem,
for which we need to construct a sublinear functional as the dominating functional.
For that we use $\fc g{0^+,\cdot}$.

First, we prove that $\fc g{0^+,\cdot}$ is sublinear.
The positive homogeneity, i.e., $\forall \alp>0:\fc g{0^+,\alp w}=\alp\fc g{0^+,w}$,
is obvious from the definition.
For subadditivity, convexity gives
$$\V{x+t\p{w+w'}}\le\fr12\V{x+2tw}+\fr12\V{x+2tw'}.$$
Subtract $\V x$, divide by $t>0$, and take $t\to0^+$ to obtain
$\fc g{0^+,w+w'}\le\fc g{0^+,w}+\fc g{0^+,w'}$.

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
If there exist $u,v\in X\setminus\B0$ such that $u/\V u\ne v/\V v$ and $\fc Ju\cap\fc Jv\ne\varnothing$,
then $X$ is not strictly convex.
</p>

<details><summary>Proof</summary>
<p>
Let $f\in\fc Ju\cap\fc Jv$.
Define $\hat u\ceq u/\V u$ and $\hat v\ceq v/\V v$.
Then, $\fc f{\hat u}=\fc f{\hat v}=1$.
Because $\V f\le 1$, we have
$$\V{\hat u+\hat v}\ge\fc f{\hat u+\hat v}=2.$$
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
Here $u$ and $u-y$ are distinct nonzero vectors of equal norm, so their normalizations are distinct.
By Theorem [@thm:share-subgradient-to-not-strictly-convex],
$X$ is not strictly convex, a contradiction.
{% qed %}

</details>

<p class="no-indent">
**Definition {#thm:birkhoff-james-orthogonality}**
([Birkhoff, 1935](https://doi.org/10.1215/S0012-7094-35-00115-6))**.**
Let $X$ be a normed space, and let $u,y\in X$.
We say $u$ is Birkhoff--James orthogonal to $y$, denoted as $u\perp_\mrm{BJ}y$, if
$$\forall t\in\bR:\V{u+ty}\ge\V u.$$
For a set $H\subseteq X$, one denotes $H\perp_\mrm{BJ}y$ if $\forall u\in H:u\perp_\mrm{BJ}y$.
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
**Lemma {#thm:finite-restricting-set}.**
Let $X$ be a finite-dimensional normed space.
For any nonempty compact convex set $S\subseteq X$,
there exists a finite set $S'\subseteq S$ such that $S'-y\subseteq S\Rightarrow y=0$.
</p>

<details><summary>Proof</summary>

If $S$ is a singleton, take $S'\ceq S$.
Otherwise, let $W\ceq\opc{span}{S-S}$ and choose a basis $B^*$ on $W^*$.
Fix $a_0\in S$ and interpret $\phi$ on $S$ as the affine function $a\mapsto\fc\phi{a-a_0}$.
For each $\phi\in B^*$, choose $p^-_\phi\in S$ that minimizes $\phi$
and choose $p^+_\phi\in S$ that maximizes $\phi$.
Such points must exist because $S$ is compact.

Define $S'\ceq\set{p^-_\phi,p^+_\phi}{\phi\in B^*}$.
Suppose $S'-y\subseteq S$.
Obviously, $y\in W$.
For every $\phi\in B^*$, we have
$$\fc\phi{p^+_\phi-y}\le\fc\phi{p^+_\phi},\qquad
\fc\phi{p^-_\phi-y}\ge\fc\phi{p^-_\phi}.$$
The two inequalities forces $\fc\phi y=0$, so $y=0$.
{% qed %}

</details>
</details>

<p class="no-indent">
**Theorem {#thm:inner-product-to-bar-p1a}.**
An inner product space satisfies $\bar P_\supset^\mrm a$.
</p>

<details><summary>Proof</summary>

Let $X$ be an inner product space.
Suppose for contradiction that $X$ does not satisfy $\bar P_\supset^\mrm a$.
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
then it does not satisfy $P_\supset^\mrm f$.
</p>

<details><summary>Proof</summary>

Suppose for contradiction that $X$ satisfies $P_\supset^\mrm f$.
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
By $P_\supset^\mrm f$ and Theorem [@thm:voronoi-cell-equivalence], $0\notin\opn{conv}D_y$,
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

Therefore, $X$ does not satisfy $P_\supset^\mrm f$.
{% qed %}

</details>

<p class="no-indent">
**Theorem {#thm:hilbert-to-p2a}.**
A Hilbert space satisfies $P_\subset^\mrm a$.
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
Therefore, $p\in\fc I{S,x}$, so $\fc I{S,x}\ne\varnothing$, proving $P_\subset^\mrm a$.
{% qed %}
</p>
</details>

<p class="no-indent">
**Theorem {#thm:not-hilbert-to-not-bar-p2a}.**
An inner product space that is not a Hilbert space does not satisfy $\bar P_\subset^\mrm a$.
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
Now suppose for contradiction that $y\in\fc{\bar I}{S,0}\setminus\B0$, which means $\forall a\in S:\V{a-y}^2\le\V a^2$.
Expanding the square gives $\a{a,y}\ge\V y^2/2$.
Therefore, the linear functional $\a{\cdot,y}$ is bounded below on the affine hyperplane $S$,
so $\a{\cdot,y}$ is constant on $S$,
so $\a{\cdot,y}$ is zero on the linear hyperplane $\opn{ker}\a{\cdot,z}$ parallel to $S$.
This means $\opn{ker}\a{\cdot,y}=\opn{ker}\a{\cdot,z}$, so $y$ is parallel to $z$.
However, $z\notin X$ while $y\in X$, so this is impossible for $y\ne0$, a contradiction.
Therefore, $\fc{\bar I}{S,0}\setminus\B0=\varnothing$.

Therefore, we find a counterexample to $\bar P_\subset^\mrm a$.
{% qed %}

</details>

<p class="no-indent">
**Theorem {#thm:inner-product-to-p2b}.**
An inner product space satisfies $P_\subset^\mrm b$.
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
Therefore, $x+tv\in\fc I{S,x}$, so $\fc I{S,x}\ne\varnothing$, proving $P_\subset^\mrm b$.
{% qed %}

</details>

<p class="no-indent">
**Theorem {#thm:finite-dimension-not-inner-product-to-not-bar-p2f}.**
Let $X$ be a normed space with $3\le\dim X<\infty$.
If $X$ is not an inner product space, then $X$ does not satisfy $\bar P_\subset^\mrm f$.
</p>

<details><summary>Proof</summary>

Because $X$ is not an inner product space, $X^*$ is not an inner product space.
By Theorem [@thm:not-inner-product-to-not-p1f], $X^*$ does not satisfy $P_\supset^\mrm f$.
This means there exists $h\in X^*$ and a finite set $S^*\subseteq D_h$ such that $0\in\opn{conv}S^*$.
There exists $\B{\lmd_f}$ such that $\lmd_f\ge0$ for every $f\in S^*$, that $\sum_{f\in S^*}\lmd_f=1$,
and that $\sum_{f\in S^*}\lmd_ff=0$.
Without loss of generality, we can assume $\lmd_f>0$ for every $f\in S^*$ because
we can always discard such $f$ that $\lmd_f=0$ from $S^*$.

For every $f\in S^*$, define
$$S_f\ceq\set{a\in\fc{\bar B}{0,1}}{\fc fa=\V f},$$
where $\fc{\bar B}{0,1}$ is the closed unit ball in $X$.
We then have
$$\forall a\in S_f:\fc ha=\fc fa+\fc{\p{h-f}}a\ge\V f-\V{h-f}\V a>0,$$ {#eq:finite-dimension-not-inner-product-to-not-bar-p2f-1}
where the last inequality is by $f\in D_h$.

Because $X$ is finite-dimensional, $\fc{\bar B}{0,1}$ is compact, so every $S_f$ is a nonempty compact convex set.
By Lemma [@thm:finite-restricting-set], there exists finite set $S'_f\subseteq S_f$ such that
$S'_f-y\subseteq S_f\Rightarrow y=0$.
Define $S\ceq\bigcup_{f\in S^*}S'_f$.
By Equation [@eq:finite-dimension-not-inner-product-to-not-bar-p2f-1], we then have $\forall a\in S:\fc ha>0$.
Therefore, $0\notin\opn{conv}S$.

Now let $y\in\fc{\bar I}{S,0}$.
We then have $\forall a\in S:\V{a-y}\le\V a=1$.
On the other hand, for $a\in S'_f$,
$$\V{a-y}\ge\fr{\fc f{a-y}}{\V f}=1-\fr{\fc fy}{\V f}.$$
Therefore, $\fc fy\ge0$.
Then, $\sum_f\lmd_ff=0$ forces $\fc fy=0$.
Then, for any $a\in S'_f$, we have $\fc f{a-y}=\V f$ and $\V{a-y}\le1$,
which means $a-y\in S_f$.
We now have $S'_f-y\subseteq S_f$, implying $y=0$.

Therefore, we have $\fc{\bar I}{S,0}=\B0$.
This gives a counterexample to $\bar P_\subset^\mrm f$.
{% qed %}

</details>

<p class="no-indent">
**Theorem {#thm:not-inner-product-to-not-bar-p2b}.**
Let $X$ be a normed space with $\dim X\ge3$.
If $X$ is not an inner product space, then it does not satisfy $\bar P_\subset^\mrm b$.
</p>

<details><summary>Proof</summary>

Because $X$ is not an inner product space, $X^*$ is not an inner product space.
By Theorem [@thm:not-inner-product-to-not-p1f], $X^*$ does not satisfy $P_\supset^\mrm f$.
By Theorem [@thm:voronoi-cell-equivalence], there exists $h\in X^*\setminus\B0$ such that $0\in\opn{conv}D_h$.
There then exists a finite set $S^*\subseteq D_h$ and positive numbers $\B{\lmd_f}$ such that
$\sum_{f\in S^*}\lmd_f=1$ and $\sum_{f\in S^*}\lmd_ff=0$.
We can always choose $S^*$ such that $h\in S^*$.

<details><summary>Why we can make $h\in S^*$</summary>
<p>
Because $\opn{conv}D_h$ is open, it contains a neighborhood of $0$.
Therefore, there exists a small enough $\veps>0$ such that $-\veps h\in\opn{conv}D_h$.
There then exists a finite set $S^{*\prime}\subseteq D_h$ and positive numbers $\B{\lmd'_f}$ such that
$\sum_{f\in S^{*\prime}}\lmd'_f=1$ and $\sum_{f\in S^{*\prime}}\lmd'_ff=-\veps h$.
Therefore,
$$0=\fr\veps{1+\veps}h+\fr1{1+\veps}\p{-\veps h}
=\fr\veps{1+\veps}h+\fr1{1+\veps}\sum_{f\in S^{*\prime}}\lmd'_ff
=\sum_{f\in S^*}\lmd_ff,$$
where
$$S^*\ceq S^{*\prime}\cup\B h,\qquad\lmd_f\ceq\fr1{1+\veps}\begin{dcases}
\veps+\lmd'_f,&f=h\in S^{*\prime},\\
\veps,&f=h\notin S^{*\prime},\\
\lmd'_f,&f\ne h.
\end{dcases}$$
</p>
</details>

For every $f\in S^*$, define $\gma_f\ceq\V f-\V{h-f}>0$,
where the inequality is because $f\in D_h$.
Choose a sequence $\B{a_{f,n}}$ in $S_X$, the unit sphere of $X$,
such that $\lim_{n\to\infty}\fc f{a_{f,n}}=\V f$ and that $\fc f{a_{f,n}}>\V f-\gma_f/2$ for every $n$.
Such a sequence always exists because of the definition of the norm on $X^*$
and the definition of sequence limit.
Then,
$$\fc h{a_{f,n}}=\fc f{a_{f,n}}+\fc{\p{h-f}}{a_{f,n}}
\ge\fc f{a_{f,n}}-\V{h-f}>\fr{\gma_f}2.$$

Define $S_0\ceq\set{a_{f,n}}{f\in S^*,n\in\bN}$.
Because $S_0\subseteq S_X$, it is bounded.
Because $\forall a\in S_0:\fc ha>\min_{f\in S^*}\gma_f/2>0$, we have $0\notin\opn{\overline{conv}}S_0$.

Let $y\in\fc{\bar I}{S_0,0}$.
For any $a_{f,n}\in S_0$, we then have
$$\begin{align*}
\fc fy&=\fc f{a_{f,n}}-\fc f{a_{f,n}-y}\\
&\ge\fc f{a_{f,n}}-\V f\V{a_{f,n}-y}\\
&\ge\fc f{a_{f,n}}-\V f\V{a_{f,n}}\\
&=\fc f{a_{f,n}}-\V f.
\end{align*}$$
Take $n\to\infty$, and we have $\fc fy\ge0$.
Then, $\sum_f\lmd_ff=0$ forces $\fc fy=0$.
Therefore, $y\in W\ceq\bigcap_{f\in S^*}\opn{ker}f$.

Therefore, $\fc{\bar I}{S_0,0}\subseteq W$.
Now consider two cases, $W=\B0$ and $W\ne\B0$.
For the first case, we have $\fc{\bar I}{S_0,0}=\B0$, which is a counterexample to $\bar P_\subset^\mrm b$.

For the case $W\ne\B0$, we pick a fixed $a_0\in S_0\subseteq S_X$ and define
$$S\ceq S_0\cup\p{a_0-3S_W},$$
where $S_W$ is the unit sphere in $W$.
Since $S_W\subseteq W\subseteq\opn{ker}h$, $\fc hS$ has the same positive lower bound as $\fc h{S_0}$,
so $0\notin\opn{\overline{conv}}S$.

Let $y\in\fc{\bar I}{S,0}\subseteq\fc{\bar I}{S_0,0}\subseteq W$.
Suppose for contradiction that $y\ne0$.
Define $\hat y\ceq y/\V y$ and $a\ceq a_0-3\hat y\in S$.
We then have $\V{a-y}\le\V a$.

Pick some subgradient $g\in\fc Ja$.
Then,
$$\begin{align*}
1&=\V{3\hat y}-\V{a_0}-1\\
&\le\V{a_0-3\hat y}-1\\
&=\V a-1=\fc ga-1\\
&=\fc g{a_0}-3\fc g{\hat y}-1\\
&\le\V g\V{a_0}-3\fc g{\hat y}-1\\
&=-3\fc g{\hat y}.
\end{align*}$$
Therefore, $-\fc g{\hat y}\ge1/3$.
Then,
$$\begin{align*}\V{a-y}
&\ge\fr{\fc g{a-y}}{\V g}\ge\fc ga-\fc gy\\
&=\V a-\V y\fc g{\hat y}\\
&\ge\V a+\fr13\V y>\V a.
\end{align*}$$
This contradicts with $\V{a-y}\le\V a$.
Therefore, $y=0$, so $\fc{\bar I}{S,0}=\B0$, which is a counterexample to $\bar P_\subset^\mrm b$.
{% qed %}

</details>

## Planes

<p class="no-indent">
**Definition {#thm:balanced-tangent-chords}.**
A normed space $X$ has <dfn>balanced tangent chords</dfn> at $y\in X$ if there exist
$u\in X\setminus\B0$, $C\ge1$, and $\dlt>0$ such that $u\perp_\mrm{BJ}y$ and
$$\forall t\in\b{-\dlt,\dlt}:\V{u+ty}\le\V{u-Cty}.$$
We say $X$ has balanced tangent chords if this holds at every $y\in X$.
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
We have the strict inequalities $\V{ru}<\V{ru+y}$ and $\V{ru}<\V{ru-y}$
because otherwise $ru+y$ or $ru-y$ would be Birkhoff--James orthogonal to $y$.
We can then easily see that $\fc{g_r}0<0$ and $\fc{g_r}1>0$.
Because $g_r$ is continuous and non-decreasing, we then have $\left(-\infty,0\right]\subset G_r\subset\p{-\infty,1}$.
Therefore, $\fc\beta r\in\p{0,1}$.
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
$$\v{s-1}-\v s<\fr{2\V u}{\V y}\v r\eqc\fc hr.$$
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
$$\fc\beta r\ge\opc{max}{0,\fr12-\fr{\V u}{\V y}\v r}.$$
Noting that the right-hand side is positive when $r$ is in a neighborhood of $0$,
we get that $\fc\beta r$ is positive when $r$ is in a neighborhood of $0$.
{% qed %}

</details>

<p class="no-indent">
**Lemma {#thm:not-left-unique-to-balanced-tangent-chords}.**
Let $X$ be a normed space and $y\in X$.
If there exists two linearly independent vectors $u_1,u_2\in X$ such that
$u_1,u_2\perp_\mrm{BJ}y$ and that $u_1,u_2,y$ are linearly dependent,
then $X$ has balanced tangent chords at $y$.
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
\dlt\ceq\fr12\v{\fr{s'}{r'}}.$$
We then have $u_+=u_-+2\dlt y$ and $\dlt>0$.
Obviously, we have $u_-,u_+\perp_\mrm{BJ}y$, and all of them are nonzero.

Notice that $u_+\perp_\mrm{BJ}y$ forces $t\mapsto\V{u_++ty}$ to be non-increasing on $\left(-\infty,0\right]$,
which is equivalent to $t\mapsto\V{u_-+ty}$ being non-increasing on $\left(-\infty,2\dlt\right]$.
On the other hand, $u_-\perp_\mrm{BJ}y$ forces $t\mapsto\V{u_-+ty}$ to be non-decreasing on $\left[0,+\infty\right)$.
Simultaneously satisfying both monotonicity conditions forces $t\mapsto\V{u_-+ty}$ to be constant on $\b{0,2\dlt}$.
Define
$$u\ceq\fr12\p{u_-+u_+}=u_-+\dlt y,$$
and we then have
$$\V{u_-}=\V{u_-+\dlt y}=\V u.$$
Therefore,
$$\forall t\in\bR:\V{u+ty}=\V{u_-+\p{t+\dlt}y}\ge\V{u_-}=\V u,$$
which means that $u\perp_\mrm{BJ}y$.

We have $\V{u+ty}=\V u$ whenever $\v t\le\dlt$.
Pick $C\ceq1$.
This satisfies the condition $\V{u+ty}\le\V{u-Cty}$ for all $t\in\b{-\dlt,\dlt}$.
Therefore, $X$ has balanced tangent chords at $y$.
{% qed %}

</details>

<p class="no-indent">
**Theorem {#thm:balanced-tangent-chords-equivalence}.**
For a normed space, positive bisectability at $y$
is equivalent to having balanced tangent chords at $y$.
</p>

<details><summary>Proof</summary>

The case $y=0$ is immediate, so assume $y\ne0$.
For a nonzero $u\perp_\mrm{BJ}y$, write $\fc dt\ceq\V{u+ty}-\V u$.
This convex function has its minimum at $0$, so it is non-decreasing along either ray from $0$.

Suppose first that $\fc dt\le\fc d{-Ct}$ for $\v t\le\dlt$.
Increasing $C$ preserves this inequality.
Choose $C\ge1+2\V u/\p{\dlt\V y}$ as well.
For $\v t\ge\dlt$, the triangle inequality gives
$$\fc d{-Ct}\ge C\v t\V y-2\V u\ge\v t\V y\ge\fc dt.$$
Thus $\fc dt\le\fc d{-Ct}$ for every real $t$.
Set $\veps\ceq1/\p{C+1}$.
For $r\ne0$, use $t=\veps/r$ and $-C\veps=\veps-1$ to obtain
$$\V{ru+\veps y}\le\V{ru+\p{\veps-1}y}.$$
Therefore, $\fc{\beta_{u,y}}r\ge\veps$.
Also $\fc{\beta_{u,y}}0=1/2\ge\veps$, proving positive bisectability.

Conversely, choose $0<\veps\le\min\B{1/2,\inf_r\fc{\beta_{u,y}}r}$.
The function
$$s\longmapsto\V{ru+sy}-\V{ru+\p{s-1}y}$$
is continuous and non-decreasing, so its nonpositive set contains $\veps$.
For $t\ne0$, take $r=\veps/t$ to obtain
$$\fc dt\le\fc d{-\fr{1-\veps}\veps t}.$$
The same inequality holds at $t=0$.
This proves balanced tangent chords, with $C=\p{1-\veps}/\veps$.
{% qed %}

</details>
</details>

<p class="no-indent">
**Theorem {#thm:2d-to-p1b}.**
A normed plane satisfies $P_\supset^\mrm b$.
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
A strictly convex plane satisfies $\bar P_\supset^\mrm b$.
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
**Theorem {#thm:balanced-tangent-chords-to-p1a}.**
A normed plane with balanced tangent chords satisfies $P_\supset^\mrm a$.
</p>

<details><summary>Proof</summary>

Let $X$ be a normed plane with balanced tangent chords.
By Theorem [@thm:voronoi-cell-equivalence], to prove that $X$ satisfies $P_\supset^\mrm a$,
it is equivalent to prove that $0\notin\opn{\overline{conv}}D_y$ for any $y\in X$,
where $D_y$ is the Voronoi cell of $y$.
The case where $y=0$ is trivial, and we assume $y\ne0$ from here.

By Theorem [@thm:balanced-tangent-chords-equivalence], $X$ is positively bisectable.
This means we can choose a nonzero $u\perp_\mrm{BJ}y$ such that $\inf_{r\in\bR}\fc{\beta_{u,y}}r\eqc\veps>0$.

Set up a bisector coordinate system with basis $\B{u,y}$.
Then, $D_y=\set{ru+sy}{s>\fc\beta r}$ by Lemma [@thm:voronoi-cell-descent-coordinate].
By the $\veps$ bound, we have $D_y\subseteq\set{ru+sy}{s>\veps}$,
so $\opn{\overline{conv}}D_y\subseteq\set{ru+sy}{s\ge\veps}$.
We then obviously have $0\notin\opn{\overline{conv}}D_y$.
{% qed %}

</details>

<p class="no-indent">
**Theorem {#thm:strictly-convex-balanced-tangent-chords-to-bar-p1a}.**
A strictly convex plane with balanced tangent chords satisfies $\bar P_\supset^\mrm a$.
</p>

<details><summary>Proof</summary>

Let $X$ be a strictly convex plane with balanced tangent chords.
By Theorem [@thm:voronoi-cell-equivalence], to prove that $X$ satisfies $\bar P_\supset^\mrm a$,
it is equivalent to prove that $0\notin\opn{\overline{conv}}\bar D_y$ for any $y\in X\setminus\B0$,
where $\bar D_y$ is the closed Voronoi cell of $y$.

By Theorem [@thm:balanced-tangent-chords-equivalence], $X$ is positively bisectable.
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
**Theorem {#thm:not-balanced-tangent-chords-to-not-p1a}.**
A normed plane without balanced tangent chords does not satisfy $P_\supset^\mrm a$.
</p>

<details><summary>Proof</summary>

Let $X$ be a normed plane without balanced tangent chords.
By Theorem [@thm:voronoi-cell-equivalence], to prove that $X$ does not satisfy $P_\supset^\mrm a$,
it is equivalent to prove that there exists $y\in X$ such that $0\in\opn{\overline{conv}}D_y$.

By Theorem [@thm:balanced-tangent-chords-equivalence],
$X$ is not positively bisectable.
Choose $y\in X$ at which positive bisectability fails.
For every nonzero $u\perp_\mrm{BJ}y$, nonnegativity of the bisector function then gives
$\inf_{r\in\bR}\fc{\beta_{u,y}}r=0$. Fix one such $u$.
Since $y=0$ trivially cannot satisfy this condition, we assume $y\ne0$ from here.
Set up a bisector coordinate system with basis $\B{u,y}$.

By Lemma [@thm:not-left-unique-to-balanced-tangent-chords],
$u$ is the only nonzero vector in $X$ such that $u\perp_\mrm{BJ}y$ up to scalar multiples.
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
A strictly convex plane satisfies $P_\subset^\mrm a$.
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
Then, by Equation [@eq:subdifferential-inequality], we have
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
A normed plane satisfies $\bar P_\subset^\mrm a$.
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

Pick any $u\in\opn{ker}f\setminus\B0$ and $g\in\fc Ju$.
Choose $v'\in\opn{ker}g\setminus\B0$.
The subgradient inequality gives $\V{u+tv'}\ge\V u+t\fc g{v'}=\V u$ for every real $t$,
so $u\perp_\mrm{BJ}v'$.
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
This proves $\bar P_\subset^\mrm a$.
{% qed %}

</details>

## Summary

The following table lists the established sufficiency and necessity results
for the properties $P_{\supset,\subset}^{\mrm f,\mrm c,\mrm b,\mrm a}$ and $\bar P_{\supset,\subset}^{\mrm f,\mrm c,\mrm b,\mrm a}$.

| Property | Sufficiency | Necessity |
|-|-|-|
| $P_\supset^{\mrm f,\mrm c,\mrm b}$ | [@thm:inner-product-to-bar-p1a], [@thm:2d-to-p1b] | [@thm:not-inner-product-to-not-p1f] |
| $P_\supset^\mrm a$ | [@thm:inner-product-to-bar-p1a], [@thm:balanced-tangent-chords-to-p1a] | [@thm:not-inner-product-to-not-p1f], [@thm:not-balanced-tangent-chords-to-not-p1a] |
| $P_\subset^{\mrm f,\mrm c}$ | [@thm:inner-product-to-p2b], [@thm:2d-strictly-convex-to-p2a] | [@thm:not-strictly-convex-to-not-p2f], [@thm:finite-dimension-not-inner-product-to-not-bar-p2f] |
| $P_\subset^\mrm b$ | [@thm:inner-product-to-p2b], [@thm:2d-strictly-convex-to-p2a] | [@thm:not-strictly-convex-to-not-p2f], [@thm:not-inner-product-to-not-bar-p2b] |
| $P_\subset^\mrm a$ | [@thm:hilbert-to-p2a], [@thm:2d-strictly-convex-to-p2a] | [@thm:not-strictly-convex-to-not-p2f], [@thm:not-hilbert-to-not-bar-p2a], [@thm:not-inner-product-to-not-bar-p2b] |
| $\bar P_\supset^{\mrm f,\mrm c,\mrm b}$ | [@thm:inner-product-to-bar-p1a], [@thm:strictly-convex-2d-to-bar-p1b] | [@thm:not-strictly-convex-to-not-bar-p1f], [@thm:not-inner-product-to-not-p1f] |
| $\bar P_\supset^\mrm a$ | [@thm:inner-product-to-bar-p1a], [@thm:strictly-convex-balanced-tangent-chords-to-bar-p1a] | [@thm:not-strictly-convex-to-not-bar-p1f], [@thm:not-inner-product-to-not-p1f], [@thm:not-balanced-tangent-chords-to-not-p1a] |
| $\bar P_\subset^{\mrm f,\mrm c}$ | [@thm:inner-product-to-p2b], [@thm:2d-to-bar-p2a] | [@thm:finite-dimension-not-inner-product-to-not-bar-p2f] |
| $\bar P_\subset^\mrm b$ | [@thm:inner-product-to-p2b], [@thm:2d-to-bar-p2a] | [@thm:not-inner-product-to-not-bar-p2b] |
| $\bar P_\subset^\mrm a$ | [@thm:hilbert-to-p2a], [@thm:2d-to-bar-p2a] | [@thm:not-hilbert-to-not-bar-p2a], [@thm:not-inner-product-to-not-bar-p2b] |

## Open problems

What geometric conditions, stated with a fixed number of point variables rather than
quantifiers over finite or compact subsets, characterize infinite-dimensional normed spaces
satisfying $\bar P_\subset^{\mrm f,\mrm c}$ and $P_\subset^{\mrm f,\mrm c}$?

In fact, we have the strict hierarchy $\bar P_\subset^{\mrm f}\not\Rightarrow\bar P_\subset^{\mrm c}\not\Rightarrow\bar P_\subset^{\mrm b}$.
An example of $\bar P_\subset^{\mrm c}\land\neg\bar P_\subset^{\mrm b}$ is $c_{00}$,
and an example of $\bar P_\subset^{\mrm f}\land\neg\bar P_\subset^{\mrm c}$ is $\ell_\infty^3\oplus_\infty\p{c_{00}+\bR u}$,
where $c_{00}$ is the space of all sequences with finitely many nonzero elements equipped with the $\ell_\infty$ norm,
and $u$ is a particular element in $\ell_\infty$ defined by $\fc un\ceq n/\p{n+1}$.

<details><summary>Why $c_{00}$ satisfies $\bar P_\subset^\mrm c$</summary>

Let $S\subseteq c_{00}$ be a compact set and $x\in c_{00}\setminus S$.

Because $S$ is compact and $x\notin S$, we have $\dlt\ceq\min_{a\in S}\V{x-a}>0$.

Because $S$ is compact, $S\cup\B x$ is also compact,
so all sequences in $S\cup\B x$ converge uniformly to $0$.
There then exists $N\in\bN$ such that, whenever $n\ge N$, we have $\v{\fc an}<\dlt/4$ for all $a\in S$
and $\v{\fc xn}<\dlt/4$.
Therefore, $\v{\fc xn-\fc an}\le\v{\fc xn}+\v{\fc an}<\dlt/2$ for all $a\in S$ and $n\ge N$.

<details><summary>Why a compact set converges uniformly</summary>

Given a compact set $S\subseteq c_{00}$, we will prove that sequences in $S$ converge uniformly to $0$,
which is to prove that for any $\veps\in\p{0,+\infty}$, there exists $N\in\bN$ such that
$$\forall n\in\left[N,+\infty\right)\cap\bN,a\in S:\v{\fc an}<\veps.$$
Given $\veps$, consider the open cover of $S$ given by $\set{\fc B{a,\veps/2}}{a\in S}$.
It must have a finite subcover $\set{\fc B{a,\veps/2}}{a\in S'}$, where $S'\subseteq S$ is a finite set.
This set being a cover means that there exists a mapping $p:S\to S'$ such that
$\forall a\in S:\V{a-\fc pa}<\veps/2$.

For each $a\in S'$, because $\lim_{n\to\infty}\fc an=0$, there exists $N_a\in\bN$ such that
$$\forall n\in\left[N_a,+\infty\right)\cap\bN:\v{\fc an}<\fr\veps2.$$
Define $N\ceq\max_{a\in S'}N_a$.
Whenever $n\ge N$, we have
$$\forall a\in S:\v{\fc an}\le\v{\fc an-\fc{\fc pa}n}+\v{\fc{\fc pa}n}
\le\V{a-\fc pa}+\v{\fc{\fc pa}n}<\fr\veps2+\fr\veps2=\veps.$$
Therefore, sequences in $S$ converge uniformly to $0$.

</details>

Set $y\ceq x+\dlt e_N/2$, where $\fc{e_N}n\ceq\dlt_{N,n}$, where $\dlt_{N,n}$ is the Kronecker delta.
For every $n\ge N$ and $a\in S$, we have
$$\v{\fc yn-\fc an}\le\v{\fc xn-\fc an}+\v{\fr\dlt2\dlt_{N,n}}
<\fr\dlt2+\fr\dlt2=\dlt\le\V{x-a}.$$
For every $n<N$, we have $\v{\fc yn-\fc an}=\v{\fc xn-\fc an}\le\V{x-a}$.
Therefore, we have
$$\V{y-a}=\sup_{n\in\bN}\v{\fc yn-\fc an}\le\V{x-a}.$$
This proves that $y\in\fc{\bar I}{S,x}$, so $x\notin\fc{\bar P}S$.

We then have $\fc{\bar P}S\subseteq S\subseteq\opn{\overline{conv}}S$, so $c_{00}$ satisfies $\bar P_\subset^\mrm c$.

</details>

<details><summary>Why $\ell_\infty^3\oplus_\infty\p{c_{00}+\bR u}$ satisfies $\bar P_\subset^\mrm f$</summary>

Let $X\ceq\ell_\infty^3\oplus_\infty\p{c_{00}+\bR u}$.
Let $S\subseteq X$ be a finite set and $x\in X\setminus S$.
Every $a\in S$ can be expressed as $a=x-\p{q_a,z_a+r_au}$,
where $q_a\in\ell_\infty^3$, $z_a\in c_{00}$, and $r_a\in\bR$.
We have
$$\V{x-a}\ge\V{z_a+r_au}\ge\lim_{n\to\infty}\v{\fc{z_a}n+r_a\fc un}=\v{r_a}.$$
Define
$$N\ceq1+\max\p{\B0\cup\bigcup_{a\in S}\set{n\in\bN}{\fc{z_a}n\ne0}},$$
which is finite because $z_a$ has only finitely many nonzero elements.
If $r_a=0$, then $\v{r_a\fc uN}=0<\V{x-a}$.
If $r_a\ne0$, then $\v{r_a\fc uN}<\v{r_a}\le\V{x-a}$.
Either way, we have
$$\dlt\ceq\min_{a\in S}\p{\V{x-a}-\v{r_a\fc uN}}>0.$$

Define $y\ceq x+\p{0,\dlt e_N}$, where $e_N\in c_{00}$ is defined by $\fc{e_N}n\ceq\dlt_{N,n}$,
where $\dlt_{N,n}$ is the Kronecker delta.
Then, for every $a\in S$, we have $a=y-\p{q_a,z_a+r_au+\dlt e_N}$.
Now, we have
$$\v{\fc{\p{z_a+r_au+\dlt e_N}}N}\le\v{r_a\fc uN}+\dlt\le\V{x-a}.$$
For any $n\in\bN\setminus\B N$, we have
$$\v{\fc{\p{z_a+r_au+\dlt e_N}}n}=\v{\fc{z_a}n+r_a\fc un}\le\V{z_a+r_au}\le\V{x-a}.$$
Therefore,
$$\V{y-a}=\opc{max}{\V{q_a},\V{z_a+r_au+\dlt e_N}}\le\V{x-a}.$$
This proves that $y\in\fc{\bar I}{S,x}$, so $x\notin\fc{\bar P}S$.

Therefore, we have $\fc{\bar P}S\subseteq S\subseteq\opn{\overline{conv}}S$, so $X$ satisfies $\bar P_\subset^\mrm f$.

</details>

<details><summary>Why $\ell_\infty^3\oplus_\infty\p{c_{00}+\bR u}$ does not satisfy $\bar P_\subset^\mrm c$</summary>

Take
$$S_1\ceq\B{\p{1,1,-1},\p{1,-1,1},\p{-1,1,1}}\subseteq\ell_\infty^3.$$
Every point of $S_1$ has norm $1$ and coordinate sum $1$, so $0\notin\opn{\overline{conv}}S_1$.
Each coordinate takes both values $1$ and $-1$ among these points.
Thus the inequalities $\V{y_1-a}\le1$ for every $a\in S_1$ force each coordinate of $y_1$ to be $0$,
and $\fc{\bar I}{S_1,0}=\B0$.

Define $S_2\ceq\set{a_n,-a_n}{n\in\bN\cup\B\infty}$, where $a_n\ceq u+e_n/\p{n+1}$ and $a_\infty\ceq u$,
where $e_n\in c_{00}$ is defined by $\fc{e_n}m\ceq\dlt_{n,m}$, where $\dlt_{n,m}$ is the Kronecker delta.
Obviously $S_2\subseteq c_{00}+\bR u$ is compact because $\lim_{n\to\infty}a_n=a_\infty$.

We now prove that $\fc{\bar I}{S_2,0}=\B0$.
Suppose $y_2\in\fc{\bar I}{S_2,0}$.
Then, for any $n\in\bN$, we have
$$\v{\fc{y_2}n\pm1}=\v{\fc{y_2}n\pm\fc{a_n}n}\le\V{y_2\pm a_n}\le\V{a_n}=1.$$
The two inequalities for $\pm$ force $\fc{y_2}n=0$, so $y_2=0$.
We then have $\fc{\bar I}{S_2,0}=\B0$.

Pick any $q\in S_1$. Construct
$$S\ceq\set{\p{a,0}}{a\in S_1}\cup\set{\p{q,a}}{a\in S_2}.$$
Obviously $S$ is compact because $S_1$ and $S_2$ are compact.
Because $0\notin\opn{\overline{conv}}S_1$, we have $0\notin\opn{\overline{conv}}S$.
The canonical projections onto $\ell_\infty^3$ and $c_{00}+\bR u$ of any element in $\fc{\bar I}{S,0}$
belong to $\fc{\bar I}{S_1,0}$ and $\fc{\bar I}{S_2,0}$, respectively.
Therefore, because $\fc{\bar I}{S_1,0}=\B0$ and $\fc{\bar I}{S_2,0}=\B0$,
we have $\fc{\bar I}{S,0}=\B0$.
This proves that $\ell_\infty^3\oplus_\infty\p{c_{00}+\bR u}$ does not satisfy $\bar P_\subset^\mrm c$.

</details>

We also have the strict hierarchy $P_\subset^\mrm f\not\Rightarrow P_\subset^\mrm c\not\Rightarrow P_\subset^\mrm b$.
Note that this implies
$\bar P_\subset^\mrm f\not\Rightarrow\bar P_\subset^\mrm c\not\Rightarrow\bar P_\subset^\mrm b$
because examples of $P_\subset^\mrm f$ must be strictly convex (by Theorem [@thm:not-strictly-convex-to-not-p2f])
and thus has $\fc{\bar P}S=\fc PS$ (by Theorem [@thm:strictly-convex-to-equivalence]).

An example of $P_\subset^\mrm f\land\neg P_\subset^\mrm c$ is $\bfc\bR t$ (real polynomials) equipped with the $L^p\b{0,1}$ norm
with $p\ceq\sqrt5$.

<details><summary>Why $\bfc\bR t$ with $L^p\b{0,1}$ norm satisfies $P_\subset^\mrm f$</summary>

The following argument works for any irrational $p\in\left[1,+\infty\right)\setminus\bQ$.
For $a\in\bfc\bR t\setminus\B0$, differentiation under the integral gives the unique subgradient $\fc ja\in\fc Ja$:
$$\fc{\fc ja}v=\fr1{\V a^{p-1}}\int_0^1\d t\v{\fc at}^{p-2}\fc at\fc vt.$$

<details><summary>Why it is the unique subgradient</summary>

Suppose $a\in\bfc\bR t\setminus\B0$ and $f\in\fc Ja$.
Suppose
$$\fc fv=\int_0^1\d t\,\fc{\tilde f}t\fc vt,$$
where $\tilde f\in L^{p/\p{p-1}}\b{0,1}$.
Any continuous functional on $L^p\b{0,1}$
(the completion of $\bfc\bR t$ with the $L^p\b{0,1}$ norm) is of this form,
and we have $\V f=\V{\tilde f}$.
By Definition [@thm:subdifferential], we have $\V f\le1$ and $\fc fa=\V a$.

By [H&ouml;lder's inequality](https://en.wikipedia.org/wiki/H%C3%B6lder%27s_inequality), we have
$$\fc fa\le\V{\tilde f}\V a\le\V a.$$
On the other hand, $\fc fa=\V a$, so the inequalities are saturated.
H&ouml;lder's inequality is saturated iff $\v{\fc{\tilde f}t}^{p/\p{p-1}}$
is a scalar multiple of $\v{\fc at}^p$ and $\sgn\fc{\tilde f}t=\sgn\fc at$ (almost everywhere).
The normalization $\V{\tilde f}=1$ determines the normalization.
In the end, we find that $\fc{\tilde f}t=\v{\fc at}^{p-2}\fc at/\V a^{p-1}$.

</details>

Now pick any finite $S\subseteq\bfc\bR t$.
We first show that the functionals $\fc jS$ are linearly independent
whenever the polynomials in $S$ are pairwise nonproportional (implying that none of them is zero).
This is equivalent to showing that the functions $\v{\fc at}^{p-2}\fc at$ for $a\in S$ are linearly independent.

Denote $R\ceq\set{z\in\bC}{\prod_{a\in S}\fc az=0}$ (the set of all complex roots of the polynomials).
Because $S$ is finite and each polynomial has finitely many roots, $R$ is finite.
Therefore, $\p{0,1}\setminus R$ is nonempty and open, and we can find an open interval
$\p{t_0-\dlt,t_0+\dlt}\subseteq\b{0,1}\setminus R$.
For each $a\in S$, define $q_a\ceq a\sgn\fc a{t_0}$,
which is a polynomial that is positive on $\p{t_0-\dlt,t_0+\dlt}$.
We then have $\v{\fc at}^{p-2}\fc at=\sgn\fc a{t_0}\fc{q_a}t^{p-1}$ on $\p{t_0-\dlt,t_0+\dlt}$.
Therefore, the linear independence of $\fc jS$ is equivalent to the linear independence of $\fc{q_a}t^{p-1}$.
Because $p-1\notin\bQ$, when $q_a$ are pairwise nonproportional, they are indeed linearly independent.

<details><summary>Why irrational powers of nonproportional polynomials are linearly independent</summary>

When $R=\varnothing$, then $S$ must be a singleton, and the claim is trivial.
We assume $R\ne\varnothing$ from here.

For $a\in S$ and $z\in R$, define $m_{az}\ceq\opn{ord}_z a$
(the multiplicity of $z$ as a root of $a$, which is also the multiplicity of $z$ as a root of $q_a$).
Two nonproportional polynomials have different multiplicity vectors.
For each $z\in R$, choose $n_z\in\bZ$ such that the integers
$$N_a\ceq\sum_{z\in R}m_{az}n_z$$
are distinct from each other for different $a\in S$.
Such a choice always exists: a simple construction is to choose $n_z$
as powers of an integer $b>\max_{a\in S}\max_{z\in R}m_{az}$,
and then $N_a$ would be the base-$b$ encoding of the multiplicities of roots of $a$,
which is distinct for different $a$ because they are nonproportional.

Now consider the linear combination
$$0=\sum_{a\in S}\lmd_a\fc{q_a}t^{p-1}.$$
Consider a contour starting from $t\in\p{t_0-\dlt,t_0+\dlt}$
and going around each $z\in R$ by exactly $rn_z$ counterclockwise turns, where $r\in\bZ$,
and returning back to $t$.
Analytically continuing $\fc{q_a}t^{p-1}$ along this contour,
we get
$$0=\sum_{a\in S}\lmd_a\alp_a^r\fc{q_a}t^{p-1},$$
where $\alp_a\ceq\e^{2\pi\i\p{p-1}N_a}$.
Because $p-1\notin\bQ$ and all $N_a$ are distinct, all $\alp_a$ are distinct.
Therefore, the [Vandermonde matrix](https://en.wikipedia.org/wiki/Vandermonde_matrix)
$\B{\alp_a^r}_{a\in S,0\le r<\v S}$ is invertible.
Since $\fc{q_a}t\ne0$, we are forced to have $\lmd_a=0$.

</details>

Now let $x\in\fc PS\setminus S$.
We claim $0\in\opn{conv}\fc j{S-x}$.
Otherwise, applying the Hahn--Banach separation theorem to the weak\*-compact convex hull
gives $v\in X$ such that $\fc{\fc j{a-x}}v<0$ for every $a\in S$.
Then we get $x-tv\in\fc I{S,x}$ for sufficiently small $t>0$, contradicting with $x\in\fc PS$.

<details><summary>Why $0\in\opn{conv}\fc j{S-x}$</summary>
<p>
Suppose for contradiction that $0\notin\opn{conv}\fc j{S-x}$.
Because $\opn{conv}\fc j{S-x}$ is a weak\*-compact and convex, by the
[Hahn--Banach separation theorem](https://en.wikipedia.org/wiki/Hahn%E2%80%93Banach_theorem#Geometric_Hahn%E2%80%93Banach_(the_Hahn%E2%80%93Banach_separation_theorems)),
there exists $v\in X$ (the set of weak\*-continuous linear functionals on $X^*$) such that
$$\forall a\in S:\fc{\fc j{a-x}}v<0.$$
By the uniqueness of subgradients we established before,
we know $\fc J{a-x}=\B{\fc j{a-x}}$.
By Theorem [@thm:subdifferential-directional-derivative], we have
$$\partial_v\V{a-x}=\max_{f\in\fc J{a-x}}\fc fv=\fc{\fc j{a-x}}v<0.$$
There then exists $\dlt_a>0$ such that
$$\forall t\in\p{0,\dlt_a}:\fr{\V{a-x+tv}-\V{a-x}}t<\fc{\fc j{a-x}}v+\v{\fc{\fc j{a-x}}v}=0.$$
Pick $t\ceq\min_{a\in S}\dlt_a/2$.
We then have $\V{a-x+tv}<\V{a-x}$ for every $a\in S$.
Therefore, $x-tv\in\fc I{S,x}$, contradicting with $x\in\fc PS$.
</p>
</details>

Thus there are $\lmd_a\ge0$ with $\sum_a\lmd_a=1$ and $\sum_a\lmd_a\fc j{a-x}=0$.
Therefore $\fc j{S-x}$ is linearly dependent, so some of the polynomials in $S-x$ are proportional.
Consider the equivalence classes of $S$ under the relation that $a-x$ and $a'-x$ are proportional,
and denote the equivalence class of $a$ by $\b a$.
We necessarily have $\sum_{a\in\b{a'}}\lmd_a\fc j{a-x}=0$ for any $a'\in S$.

There must exist $a\in S$ such that $\lmd_a>0$.
To balance it, there also must exist $a'\in\b a$ such that $\lmd_{a'}>0$
and that $\fc j{a-x}$ and $\fc j{a'-x}$ are oppositely directed.
Because $a-x$ and $a'-x$ are parallel and because of Equation [@eq:subdifferential-scaling],
$a-x$ and $a'-x$ must be oppositely directed as well.
This means $x\in\opn{conv}\B{a,a'}\subseteq\opn{conv}S$.
Therefore, $\fc PS\subseteq\opn{conv}S=\opn{\overline{conv}}S$.

</details>

<details><summary>Why $\bfc\bR t$ with $L^p\b{0,1}$ norm does not satisfy $P_\subset^\mrm c$</summary>

First, we claim that there exists $\veps\in\p{0,+\infty}$ such that there exists a unique $c\in\p{0,+\infty}$ such that
$$\int_0^{2\pi}\fr{\d\tht}{2\pi}\v{\fc g\tht-c}^{p-2}\p{\fc g\tht-c}=0,$$
where $\fc g\tht\ceq\cos\tht+\veps\cos2\tht$.

<details><summary>Why the claim is true</summary>

This argument works for any $p\in\p{2,+\infty}$.

Define
$$\fc{\tilde g}{\veps,c}\ceq\int_0^{2\pi}\fr{\d\tht}{2\pi}\v{\fc g\tht-c}^{p-2}\p{\fc g\tht-c}.$$
First we evaluate $\fc{\tilde g}{0,0}=0$.

<details><summary>Calculation</summary>
$$\begin{align*}
\fc{\tilde g}{0,0}
&=\int_0^{2\pi}\fr{\d\tht}{2\pi}\v{\cos\tht}^{p-2}\cos\tht\\
&=\int_0^\pi\fr{\d\tht}{2\pi}\v{\cos\tht}^{p-2}\cos\tht+\int_0^\pi\fr{\d\tht}{2\pi}\v{\fc\cos{\pi+\tht}}^{p-2}\fc\cos{\pi+\tht}\\
&=\int_0^\pi\fr{\d\tht}{2\pi}\v{\cos\tht}^{p-2}\cos\tht-\int_0^\pi\fr{\d\tht}{2\pi}\v{\cos\tht}^{p-2}\cos\tht\\
&=0.
\end{align*}$$
</details>

<p class="no-indent">
Then, we find
$$k\ceq\abar{\fr{\d\fc{\tilde g}{\veps,0}}{\d\veps}}{\veps=0}
=\fr{\p{p-1}\p{p-2}}p\int_0^{2\pi}\fr{\d\tht}{2\pi}\v{\cos\tht}^{p-2}>0.$$
</p>

<details><summary>Calculation</summary>

By the [Leibniz integral rule](https://en.wikipedia.org/wiki/Leibniz_integral_rule), we have
$$\fr{\d\fc{\tilde g}{\veps,0}}{\d\veps}
=\int_0^{2\pi}\fr{\d\tht}{2\pi}\fr{\partial}{\partial\veps}\p{\v{\fc g\tht}^{p-1}\sgn\fc g\tht}.$$
Notice that $\partial\fc g\tht/\partial\veps=2\cos^2\tht-1$.
We then have
$$\fr{\d\fc{\tilde g}{\veps,0}}{\d\veps}
=\p{p-1}\int_0^{2\pi}\fr{\d\tht}{2\pi}\v{\fc g\tht}^{p-2}\p{2\cos^2\tht-1}.$$
When $\veps=0$, we have $\fc g\tht=\cos\tht$, so
$$\abar{\fr{\d\fc{\tilde g}{\veps,0}}{\d\veps}}{\veps=0}
=2\p{p-1}\int_0^{2\pi}\fr{\d\tht}{2\pi}\v{\cos\tht}^p-\p{p-1}\int_0^{2\pi}\fr{\d\tht}{2\pi}\v{\cos\tht}^{p-2}.$$

Integrating by parts, we get
$$\begin{align*}
\int_0^{2\pi}\fr{\d\tht}{2\pi}\v{\cos\tht}^p
&=\int_0^{2\pi}\fr{\d\sin\tht}{2\pi}\v{\cos\tht}^{p-1}\sgn\cos\tht\\
&=\abar{\fr{\sin\tht}{2\pi}\v{\cos\tht}^p\sgn\cos\tht}0^{2\pi}
-\int_0^{2\pi}\fr{\sin\tht}{2\pi}\,\d\p{\v{\cos\tht}^{p-1}\sgn\cos\tht}\\
&=\int_0^{2\pi}\fr{\sin\tht}{2\pi}\p{p-1}\v{\cos\tht}^{p-2}\sin\tht\,\d\tht\\
&=\p{p-1}\int_0^{2\pi}\fr{\d\tht}{2\pi}\v{\cos\tht}^{p-2}
-\p{p-1}\int_0^{2\pi}\fr{\d\tht}{2\pi}\v{\cos\tht}^p.
\end{align*}$$
Arranging the terms gives
$$\int_0^{2\pi}\fr{\d\tht}{2\pi}\v{\cos\tht}^p=\fr{p-1}p\int_0^{2\pi}\fr{\d\tht}{2\pi}\v{\cos\tht}^{p-2}.$$

Plugging this into the previous expression gives
$$\abar{\fr{\d\fc{\tilde g}{\veps,0}}{\d\veps}}{\veps=0}
=\p{2\p{p-1}\fr{p-1}p-\p{p-1}}\int_0^{2\pi}\fr{\d\tht}{2\pi}\v{\cos\tht}^{p-2}.$$

</details>

<p class="no-indent">
Therefore, there exists some $\veps\in\p{0,+\infty}$ such that
$$\fr{\fc{\tilde g}{\veps,0}}\veps>k-\fr k2>0.$$
</p>

On the other hand, the integrand of $\fc{\tilde g}{\veps,c}$
is strictly decreasing in $c$ and tends to $-\infty$ as $c\to+\infty$,
so $\fc{\tilde g}{\veps,c}$ tends to $-\infty$ as $c\to+\infty$.
By the intermediate value theorem, there exists a unique $c\in\p{0,+\infty}$ such that $\fc{\tilde g}{\veps,c}=0$.

</details>

For $\tht\in\b{0,2\pi}$, define
$$\fc{a_\tht}t\ceq\p{1+t^2}^2\p{\fc g{2\arctan t-\tht}-c}.$$
It is a polynomial in $t$ of degree at most $4$, so $a_\tht\in\bfc\bR t$.

Define $S\ceq\set{a_\tht}{\tht\in\b{0,2\pi}}$.
Because $a\mapsto a_\tht$ is continuous, $S$ is compact.
On the subspace of polynomials of degree at most $4$, define a continuous linear functional
$\fc f{t\mapsto\sum_{j=0}^4b_jt^j}\ceq3b_0+b_2+3b_4$.
We then have $\fc f{a_\tht}=-8c<0$ for every $\tht$.
Since the subspace is closed, we have $0\notin\opn{\overline{conv}}S$.

<details><summary>Calculation</summary>

By the [tangent half-angle formulas](https://en.wikipedia.org/wiki/Tangent_half-angle_formula)
and the double angle formulas, we have
$$\fc\cos{2\arctan t}=\fr{1-t^2}{1+t^2},\qquad
\fc\sin{2\arctan t}=\fr{2t}{1+t^2},$$
$$\begin{align*}
\fc\cos{4\arctan t}&=2\fc\cos{2\arctan t}^2-1=\fr{1-6t^2+t^4}{\p{1+t^2}^2},\\
\fc\sin{4\arctan t}&=2\fc\cos{2\arctan t}\fc\sin{2\arctan t}=\fr{4t-4t^3}{\p{1+t^2}^2},
\end{align*}$$
$$\begin{align*}
\fc\cos{2\arctan t-\tht}&=\fc\cos{2\arctan t}\cos\tht+\fc\sin{2\arctan t}\sin\tht\\
&=\fr{1-t^2}{1+t^2}\cos\tht+\fr{2t}{1+t^2}\sin\tht,\\
\fc\cos{4\arctan t-2\tht}&=\fc\cos{4\arctan t}\cos2\tht+\fc\sin{4\arctan t}\sin2\tht\\
&=\fr{1-6t^2+t^4}{\p{1+t^2}^2}\cos2\tht+\fr{4t-4t^3}{\p{1+t^2}^2}\sin2\tht.
\end{align*}$$
Substitute everything into the definition of $a_\tht$ to get
$$\begin{align*}
\fc{a_\tht}t&=\p{1+t^2}\p{\p{1-t^2}\cos\tht+\p{2t+2t^3}\sin\tht}\\
&\phantom{={}}{}+\veps\p{\p{1-6t^2+t^4}\cos2\tht+\p{4t-4t^3}\sin2\tht}-c\p{1+t^2}^2.
\end{align*}$$
One may get the coefficients
$$\begin{align*}
b_0&=-c+\cos\tht+\veps\cos2\tht,\\
b_2&=-2c-6\veps\cos2\tht,\\
b_4&=-c-\cos\tht+\veps\cos2\tht.
\end{align*}$$

Alternatively, just use Wolfram!

```wolfram
(1 + t^2)^2 ((Cos[#] + \[Epsilon] Cos[2 #]) &[2 ArcTan[t] - \[Theta]] - c) //
	TrigExpand // CoefficientList[#, t] & // TrigReduce // MatrixForm
```

</details>

Suppose for contradiction that $y\in\fc I{S,0}$.
We then have $\forall\tht\in\b{0,2\pi}:\V{a_\tht}<\V{y-a_\tht}$.
Take the $p$th power of both sides and integrate over $\tht$ to get $\fc F0<\fc Fy$, where
$$\fc Fy\ceq\int_0^{2\pi}\fr{\d\tht}{2\pi}\V{y-a_\tht}^p.$$

After some calculation, one can show that
$$\fc Fy=\int_0^1\d t\p{1+t^2}^{2p}\fc G{\fr{\fc yt}{\p{1+t^2}^2}},$$
where
$$\fc Gs\ceq\int_0^{2\pi}\fr{\d\tht}{2\pi}\v{s-\fc g\tht+c}^p.$$
The function $G$ is convex and continuously differentiable, and the definition of $c$ gives $\fc{G'}0=0$,
so $G$ has its minimum at $0$.
This gives $\fc Fy\ge\fc F0$, contradicting with $\fc F0<\fc Fy$.

<details><summary>Calculation</summary>

Expand the definition of the $p$-norm to get
$$\fc Fy=\int_0^{2\pi}\fr{\d\tht}{2\pi}\int_0^1\d t\v{\fc yt-\p{1+t^2}^2\p{\fc g{2\arctan t-\tht}-c}}^p.$$
Exchange the order of integration to get
$$\fc Fy=\int_0^1\d t\p{1+t^2}^{2p}\int_0^{2\pi}\fr{\d\tht}{2\pi}\v{\fr{\fc yt}{\p{1+t^2}^2}-\fc g{2\arctan t-\tht}+c}^p.$$
Notice that $g$ is an even function and has period $2\pi$,
so we can change $2\arctan t-\tht$ to $\tht$ in the integrand.
This gives
$$\fc Fy=\int_0^1\d t\p{1+t^2}^{2p}\fc G{\fr{\fc yt}{\p{1+t^2}^2}}.$$

In $\fc Gs$, take the derivative using the Leibniz integral rule to get
$$\begin{align*}
\fc{G'}s&=\int_0^{2\pi}\fr{\d\tht}{2\pi}\fr{\partial}{\partial s}\v{s-\fc g\tht+c}^p\\
&=\int_0^{2\pi}\fr{\d\tht}{2\pi}p\v{s-\fc g\tht+c}^{p-1}\fc\sgn{s-\fc g\tht+c}.
\end{align*}$$
Therefore,
$$\fc{G'}0=-p\int_0^{2\pi}\fr{\d\tht}{2\pi}\v{\fc g\tht-c}^{p-1}\fc\sgn{\fc g\tht-c}.$$
By the definition of $c$, we have $\fc{G'}0=0$.

</details>

Therefore, $\fc I{S,0}=\varnothing$, so we have found a counterexample to $P_\subset^\mrm c$.

</details>

An example of $P_\subset^\mrm c\land\neg P_\subset^\mrm b$ is $X$ obtained through
recursively defining a transfinite sequence $\B{X_\alp}$ of strictly convex spaces described as follows.
We start with $X_0\ceq\ell_4^3$.
Then, for any ordinal number $\alp$, define $X_{\alp+1}\ceq\fc\Xi{X_\alp,\le_\alp}$,
where $\le_\alp$ is a well-order on the set of all compact subsets of $X_\alp$ whose closed convex hulls do not include zero,
and the definition of $\Xi$ will be given later.
For any limit ordinal $\lmd$, define $X_\lmd\ceq\bigcup_{\alp<\lmd}X_\alp$.
In the end, define $X\ceq X_{\omg_1}$, where $\omg_1$ is the first uncountable ordinal number.
Then, $X$ sastisfies $P_\subset^\mrm c$ but does not satisfy $P_\subset^\mrm b$.

Now, $\fc\Xi{Y,\le}$, where $Y$ is a normed space and $\le$ is a well-order on the compact subsets of $Y$
whose closed convex hulls do not include zero,
is defined as follows.
First, assign ordinal labels to all compact subsets of $Y$ whose closed convex hull does not include zero
according to the well-order $\le$ and
denote the compact set with ordinal label $\alp<\beta$ by $K_\alp$, where $\beta$ is the order type of $\le$.
Define a transfinite sequence $\B{Y_\alp}_{\alp\le\beta}$ of normed spaces as follows.
We start with $Y_0\ceq Y$.
Then, for any $\alp<\beta$, define $Y_{\alp+1}\ceq Y_\alp\oplus\bR$ equipped with the norm
$$\V{\p{x,t}}\ceq\p{1-\fr\dlt{2\p{4+\dlt}}}\fc N{x,t}+\fr\dlt{2\p{4+\dlt}}\sqrt{\V x^2+t^2},$$
where
$$\dlt\ceq\min_{a,a'\in K_\alp}\p{\V a+\V{a'}-\V{a-a'}},$$
$$\fc N{x,t}\ceq\inf\set{\fc A{x,K',\B{\lmd_a}}}{\lmd_a\in\bR,\text{finite $K'\subseteq K_\alp$},\sum_{a\in K'}\lmd_a=-t},$$
$$\fc A{x,K',\B{\lmd_a}_{a\in K'}}\ceq\V{x-\sum_{a\in K'}\lmd_aa}+\sum_{a\in K'}\v{\lmd_a}\p{\V a-\fr\dlt4}.$$
Identify $\p{x,0}=x$ for any $x\in Y_\alp$ so that $Y_\alp\subseteq Y_{\alp+1}$,
and one can prove that this inclusion is isometric.
For any limit ordinal $\lmd\le\beta$, define $Y_\lmd\ceq\bigcup_{\alp<\lmd}Y_\alp$.
In the end, define $\fc\Xi{Y,\le}\ceq Y_\beta$.

<details><summary>Why $X$ satisfies $P_\subset^\mrm c$</summary>

We can prove that an extension $Y_\alp\subseteq Y_{\alp+1}$ has the following properties,
given that $Y_\alp$ is a strictly convex space:
the norm on $Y_{\alp+1}$ satisfies the axioms of a norm and is strictly convex;
$Y_\alp$ is a closed subspace of $Y_{\alp+1}$;
the inclusion map $x\mapsto\p{x,0}$ is an isometry;
and there exists $v\in Y_{\alp+1}$ such that $\forall a\in K_\alp:\V{a-v}<\V a$.
Based on these properties, using transfinite induction, we can prove the following properties of
$X_\alp\subseteq X_{\alp'}$ for any $\alp<\alp'$:
$X_{\alp'}$ is strictly convex;
$X_\alp$ is a closed subspace of $X_{\alp'}$ with isometric inclusion;
for any compact set $K\subseteq X_\alp$ whose closed convex hull does not include zero,
there exists $v\in X_{\alp'}$ such that $\forall a\in K:\V{a-v}<\V a$.

<details><summary>Why $Y_{\alp+1}$ is a strictly convex space</summary>

It is sufficient to prove that the construction of $N$ is sublinear and nonnegative.
Then, by the strict convexity of the norm on $Y_\alp$ and the strict convexity of $\p{x,t}\mapsto\sqrt{\V x^2+t^2}$,
one can see that the norm on $Y_{\alp+1}$ is strictly convex.

First, by setting $a=a'$ in the definition of $\dlt$, we see $\forall a\in K_\alp:\V a\ge\dlt/2$.
Also, $\dlt$ is positive because $Y_\alp$ is strictly convex.
We then have that $A$ is nonnegative.

The homogeneity and nonnegativity of $N$ is obvious from the homogeneity and nonnegativity of $A$.
The only real work lies in proving $N$ satisfies the triangle inequality.

Let $\p{x_1,t_1}\in Y_{\alp+1}$,
$K'_1\subseteq K_\alp$ be a finite set, and let $\B{\lmd_{1a}}_{a\in K'_1}$ be real numbers such that
$\sum_{a\in K'_1}\lmd_{1a}=-t_1$.
Similarly fix $\p{x_2,t_2}$, $K'_2$, and $\B{\lmd_{2a}}_{a\in K'_2}$.
Define
$$\begin{align*}
\p{x,t}&\ceq\p{x_1+x_2,t_1+t_2},\\
K'&\ceq K'_1\cup K'_2,\\
\lmd_a&\ceq\begin{dcases}\lmd_{1a},&a\in K'_1,\\0,&a\notin K'_1\end{dcases}
+\begin{dcases}\lmd_{2a},&a\in K'_2,\\0,&a\notin K'_2.\end{dcases}
\end{align*}$$
Then, we have $\sum_{a\in K'}\lmd_a=-t$.

We can then expand
$$\begin{align*}
\fc A{x,K',\B{\lmd_a}}
&=\V{x-\sum_{a\in K'}\lmd_aa}+\sum_{a\in K'}\v{\lmd_a}\p{\V a-\fr\dlt4}\\
&\le\V{x_1+x_2-\sum_{a\in K'_1}\lmd_{1a}a-\sum_{a\in K'_2}\lmd_{2a}a}
+\sum_{a\in K'_1}\v{\lmd_{1a}}\p{\V a-\fr\dlt4}
+\sum_{a\in K'_2}\v{\lmd_{2a}}\p{\V a-\fr\dlt4}\\
&\le\V{x_1-\sum_{a\in K'_1}\lmd_{1a}a}+\sum_{a\in K'_1}\v{\lmd_{1a}}\p{\V a-\fr\dlt4}
+\V{x_2-\sum_{a\in K'_2}\lmd_{2a}a}+\sum_{a\in K'_2}\v{\lmd_{2a}}\p{\V a-\fr\dlt4}\\
&=\fc A{x_1,K'_1,\B{\lmd_{1a}}}+\fc A{x_2,K'_2,\B{\lmd_{2a}}}
\end{align*}$$

Note that any choices of $\B{\lmd_{1a}}$ and $\B{\lmd_{2a}}$ can be used to construct such $\B{\lmd_a}$.
Therefore, if you take the infimum, the inequality is preserved.
Therefore, $\fc N{x,t}\le\fc N{x_1,t_1}+\fc N{x_2,t_2}$.

</details>

<details><summary>Why $Y_\alp$ is a closed subspace of $Y_{\alp+1}$</summary>

First, by setting $a=a'$ in the definition of $\dlt$, we see $\forall a\in K_\alp:\V a\ge\dlt/2$.
Also, $\dlt$ is positive because $Y_\alp$ is strictly convex.

Given $\sum_{a\in K'}\lmd_a=-t$, we have
$$\fc A{x,K',\B{\lmd_a}}\ge\sum_{a\in K'}\v{\lmd_a}\p{\V a-\fr\dlt4}
\ge\sum_{a\in K'}\v{\lmd_a}\p{\fr\dlt2-\fr\dlt4}
\ge\v{\sum_{a\in K'}\lmd_a}\fr\dlt4=\v t\fr\dlt4.$$
We then have $\fc N{x,t}\ge\v t\dlt/4$.
Therefore,
$$\V{\p{x,t}}\ge\p{1-\fr\dlt{2\p{4+\dlt}}}\v t\fr\dlt4+\fr\dlt{2\p{4+\dlt}}\v t
=\fr{\dlt\p{12+\dlt}}{8\p{4+\dlt}}\v t.$$
Therefore, any point in $Y_{\alp+1}\setminus Y_\alp$,
i.e., any point with nonzero $t$ coordinate, has its distance to $Y_\alp$ bounded below by a positive number.
It makes $Y_\alp$ closed in $Y_{\alp+1}$.

</details>

<details><summary>Why the inclusion map is isometric</summary>

We need to calculate $\fc N{x,0}$.
Given $\sum_{a\in K'}\lmd_a=0$, we define
$$\Lmd\ceq\sum_{\lmd_a>0}\lmd_a=\sum_{\lmd_a<0}-\lmd_a.$$
If $\Lmd>0$, we have
$$\begin{align*}
\V{\sum_{a\in K'}\lmd_aa}
&=\V{\sum_{\lmd_a>0}\lmd_aa+\sum_{\lmd_{a'}<0}\p{-\lmd_{a'}}\p{-a'}}\\
&=\V{\p{\fr1\Lmd\sum_{\lmd_{a'}<0}-\lmd_{a'}}\sum_{\lmd_a>0}\lmd_aa
+\p{\fr1\Lmd\sum_{\lmd_a>0}\lmd_a}\sum_{\lmd_{a'}<0}\p{-\lmd_{a'}}\p{-a'}}\\
&=\V{\sum_{\substack{\lmd_a>0\\\lmd_{a'}<0}}\fr{\lmd_a\p{-\lmd_{a'}}}\Lmd\p{a-a'}}
\le\sum_{\substack{\lmd_a>0\\\lmd_{a'}<0}}\fr{\lmd_a\p{-\lmd_{a'}}}\Lmd\V{a-a'}\\
&\le\sum_{\substack{\lmd_a>0\\\lmd_{a'}<0}}\fr{\lmd_a\p{-\lmd_{a'}}}\Lmd\p{\V a-\V {a'}-\dlt}\\
&=\p{\fr1\Lmd\sum_{\lmd_{a'}<0}-\lmd_{a'}}\sum_{\lmd_a>0}\lmd_a\p{\V a-\fr\dlt2}
+\p{\fr1\Lmd\sum_{\lmd_a>0}\lmd_a}\sum_{\lmd_{a'}<0}\p{-\lmd_{a'}}\p{\V{a'}-\fr\dlt2}\\
&=\sum_{a\in K'}\v{\lmd_a}\p{\V a-\fr\dlt2}.
\end{align*}$$
The same inequality is true if $\Lmd=0$.

We then have
$$\begin{align*}
\fc A{x,K',\B{\lmd_a}}
&=\V{x-\sum_{a\in K'}\lmd_aa}+\sum_{a\in K'}\v{\lmd_a}\p{\V a-\fr\dlt4}\\
&\ge\V x-\V{\sum_{a\in K'}\lmd_aa}+\sum_{a\in K'}\v{\lmd_a}\p{\V a-\fr\dlt4}\\
&\ge\V x-\sum_{a\in K'}\v{\lmd_a}\p{\V a-\fr\dlt2}+\sum_{a\in K'}\v{\lmd_a}\p{\V a-\fr\dlt4}\\
&=\V x+\sum_{a\in K'}\v{\lmd_a}\fr\dlt4
\ge\V x+\v{\sum_{a\in K'}\lmd_a}\fr\dlt4=\V x.
\end{align*}$$
Therefore, $\fc N{x,0}\ge\V x$.
On the other hand, $\fc N{x,0}\le\fc A{x,\varnothing,\B{}}=\V x$.
Therefore, $\fc N{x,0}=\V x$.

Plug this into the definition of the norm, and we have $\V{\p{x,0}}=\V x$.

</details>

<details><summary>Why $\forall a\in K_\alp:\V{a-v}<\V a$</summary>

We have
$$\fc N{a,-1}\le\fc A{a,\B a,\B1}=\V a-\fr\dlt4.$$

Pick $v\ceq\p{0,-1}$, and we have
$$\begin{align*}
\V{a-v}&=\V{\p{a,-1}}\\
&=\p{1-\fr\dlt{2\p{4+\dlt}}}\fc N{a,-1}+\fr\dlt{2\p{4+\dlt}}\sqrt{\V a^2+1}\\
&\le\p{1-\fr\dlt{2\p{4+\dlt}}}\p{\V a-\fr\dlt4}+\fr\dlt{2\p{4+\dlt}}\p{\V a+1}\\
&=\V a-\fr\dlt8<\V a.
\end{align*}$$

</details>

<details><summary>Transfinite induction</summary>

First, we need to prove a bunch of properties that all spaces in the $\B{Y_\alp}$ transfinite sequence
in the construction of $\Xi$ have.
The successor steps for proving these properties are already done, so we consider the limit steps.
Suppose $\lmd$ is a limit ordinal.

We have that $Y_\lmd=\bigcup_{\alp<\lmd}Y_\alp$ is a strictly convex space.
It is a normed space in the first place because any of its vectors belongs to some $Y_{\alp<\lmd}$,
and it is a normed space.
It is strictly convex because any two of its vectors belong to some $Y_\alp$ and $Y_{\alp'}$ respectively,
so they belong to $Y_{\opc{max}{\alp,\alp'}}$, which is a strictly convex space.

We have that any $Y_{\alp<\lmd}$ is a closed subspace of $Y_\lmd$.
This is because it is a closed subspace of $Y_{\alp+1}$, which in turn is a subspace of $Y_\lmd$.

For any $\alp<\lmd$, there exists $v\in Y_\lmd$ such that $\forall a\in K_\alp:\V{a-v}<\V a$.
This is because such $v$ can be found in $Y_{\alp+1}$, which is a subspace of $Y_\lmd$.

Now we can apply these properties to $\fc\Xi{Y,\le}$ as it is an element in the sequence $\B{Y_\alp}$.
It is a strictly convex space, and it contains $Y$ as a closed subspace,
and for any compact set $K\subseteq Y$ whose
closed convex hull does not include zero, there exists $v\in\fc\Xi{Y,\le}$ such that
$\forall a\in Y:\V{a-v}\le\V a$.

With these properties on $\Xi$, we can do another transfinite induction to get the properties
for all spaces in the $\B{X_\alp}$ transfinite sequence.

</details>

We now show that every compact set $K\subseteq X$ is contained in some $X_\alp$.
A compact metric space is always separable, so $K$ has a countable dense subset
$\B{a_n}_{n<\omg}$.
Because $X=\bigcup_{\alp<\omg_1}X_\alp$, for each $n$, there exists $\alp_n<\omg_1$ such that $a_n\in X_{\alp_n}$.
The supremum $\alp\ceq\sup_n\alp_n$ is still a countable ordinal.
We then have $a_n\in X_\alp$.
Because $X_\alp$ is closed in $X$, we have $K\subseteq X_\alp$.

Now let $S\subseteq X$ be a compact set and $x\notin\opn{\overline{conv}}S$.
Then $K\ceq S-x$ is a compact set whose closed convex hull does not include zero.
It is contained in some $X_\alp$, so there exists some $v\in X_{\alp+1}$ such that
$\forall a\in S:\V{a-x-v}<\V{a-x}$.
This means $x+v\in\fc I{S,x}$.
This proves that $X$ satisfies $P_\subset^\mrm c$.

</details>

## Note on the economic Pareto efficiency

As explained in the [background](#background),
the concept that is more commonly used in economics is neither the strong Pareto efficiency nor the weak Pareto efficiency.
In the context of this article, the set of economic Pareto improvements can be defined as
$$\fc{\tilde I}{S,x}\ceq\bigcup_{a\in S}\p{\fc B{a,\V{x-a}}\cap\fc{\bar I}{S,x}},$$
and the economic Pareto set can be defined as
$$\fc{\tilde P}S\ceq\set{x\in X}{\fc{\tilde I}{S,x}=\varnothing}.$$
Then, we can similarly define the properties $\tilde P_{\supset,\subset}^{\mrm f,\mrm c,\mrm b,\mrm a}$.

Although the economic Pareto efficiency is not the focus of this article,
some of the characterizations of the properties $\tilde P_{\supset,\subset}^{\mrm f,\mrm c,\mrm b,\mrm a}$
can be derived for free given the results we have already established.
First, we obviously have $\fc{\bar P}S\subseteq\fc{\tilde P}S\subseteq\fc PS$ for any $S\subseteq X$.
Second, the proof of Theorem [@thm:not-strictly-convex-to-not-p2f] can be directly ported
to prove that a non-strictly convex space does not satisfy $\tilde P_\subset^\mrm f$.
Third, Theorem [@thm:strictly-convex-to-equivalence] states that a strictly convex space
has $\fc{\bar P}S=\fc{\tilde P}S=\fc PS$.
These observations immediately give the exact characterizations of $\tilde P_\subset^{\mrm f,\mrm c,\mrm b,\mrm a}$ in finite-dimensional spaces,
which are the same as those of $P_\subset^{\mrm f,\mrm c,\mrm b,\mrm a}$.
For infinite-dimensional spaces, only $\tilde P_\subset^\mrm a$ is exactly characterized because only $P_\subset^\mrm a$ is exactly characterized.
The third observation also immediately gives the exact characterizations of $\tilde P_\supset^{\mrm f,\mrm c,\mrm b,\mrm a}$ in non-planar spaces,
which are the same as those of $P_\supset^{\mrm f,\mrm c,\mrm b,\mrm a}$ (or $\bar P_\supset^{\mrm f,\mrm c,\mrm b,\mrm a}$, which are the same).
Only the planar case needs additional work.
