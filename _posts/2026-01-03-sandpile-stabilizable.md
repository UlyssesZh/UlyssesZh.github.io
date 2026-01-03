---
title: Determining the stabilizability of the abelian sandpile model
date: 2026-01-03 14:56:49 -0800
categories:
- math
tags:
- graph theory
- linear programming
- long paper
layout: post
excerpt: 'The abelian sandpile model is a cellular automaton
where each cell is a sandpile that can topple to put grains on neighboring cells
when having enough grains. It is stable if none of the sandpiles can topple.
A natural question to ask is whether it can become stable eventually.
In this article, I will show that one can determine the stabilizibility usiung integer linear programming
for the abelian sandpile model on an arbitrary finite graph.'
---

## Introduction

Suppose that we have $n$ sandpiles denoted as a set $V$.
Each sandpile $x\in V$ has a <dfn>toppling threshold</dfn> $\fc\tht x\in\bR_{>0}$,
and each ordered pair of sandpiles $x,x'\in V$ has a <dfn>toppling transfer amount</dfn> $\fc\alp{x,x'}\in\bR_{\ge0}$.
The tuple $\p{V,\tht,\alp}$ is called an <dfn>abelian sandpile model</dfn>.

A <dfn>configuration</dfn> $\eta:x\to\bR$ is to assign an amount of sand $\fc\eta x$ to each sandpile $x\in V$,
and it is <dfn>legal</dfn> if $\fc\eta x\ge0$ for all $x\in V$ (or conveniently denoted as $\eta\ge0$).
For any configuration $\eta$, any $y\in V$ can <dfn>topple</dfn>,
which is a transition to a new configuration $\eta'$ defined as
$$\fc{\eta'}x\ceq\fc\eta x-\fc\tht y\dlt_{xy}+\fc\alp{y,x}.$$
The toppling is <dfn>legal</dfn> if $\fc\eta y\ge\fc\tht y$,
in which case we call $y$ an <dfn>unstable</dfn> site of the configuration $\eta$.
Notice that a legal configuration undergoing a legal toppling must become a legal configuration.
A sequence of topplings where each toppling uses the resultant configuration of the previous toppling as the initial configuration
is called a <dfn>toppling procedure</dfn>.

In its historically original form
([Dhar, 1990](https://doi.org/10.1103/PhysRevLett.64.1613)),
$V$ is the lattice sites on a 2D rectangular grid,
and $\fc\tht x=4$ for all $x\in V$,
and $\fc\alp{x,x'}$ is $1$ if $x$ and $x'$ are nearest neighbors or $0$ otherwise.
It is then generalized to an arbitrary directed multigraph
([Holroyd et al., 2008](https://doi.org/10.1007/978-3-7643-8786-0_17)),
where $V$ is its vertices,
and $\fc\tht x$ is the out-degree of vertex $x$,
and $\fc\alp{x,x'}$ is the number of edges from $x$ to $x'$.

A configuration where none of the sandpiles can legally topple
is called a <dfn>stable</dfn> configuration.
In other words, configuration $\eta$ is stable if $\fc\eta x<\fc\tht x$ for all $x\in V$,
or denoted as $\eta<\tht$ in abbreviation.
A toppling procedure that makes a configuration stable is called a <dfn>stabilizing</dfn> toppling procedure
that stabilizes the configuration.
A legal configuration is <dfn>stabilizable</dfn> if it has a finite legal stabilizing toppling procedure.
Otherwise, the configuration is <dfn>exploding</dfn>.
A natural question to ask then is how to determine whether a configuration is stabilizable or exploding.

## Abelian property

One important fact to notice is that the abelian sandpile model has the so-called <dfn>abelian property</dfn>:
if a configuration is stabilizable, then every legal toppling procedure of it is finite,
and the stabilizing legal toppling procedure is unique up to the order of topplings.
In other words, if we define the <dfn>toppling counting function</dfn> $u:V\to\bN$
such that $\fc ux$ is the number of times that $x\in V$ topples throughout the toppling procedure,
then every legal stabilizing toppling procedure of a stabilizable configuration has the same toppling counting function,
which is called the <dfn>odometer</dfn> of the configuration.
We will leave the proof of the abelian property to a later part in this section.

In order to better describe the model, we can define a function $\Dlt:V\times V\to\bR$
(the notation comes from the notation of the Laplacian operator in vector analysis
due to its direct analogy in the case of the abelian sandpile model on a grid,
in which case it is called a Laplacian matrix in the language of graph theory) as follows:
$$\fc\Dlt{x,y}=\fc\tht x\dlt_{xy}-\fc\alp{x,y}.$$
It encodes information from both $\tht$ and $\alp$
and provides everything we need to know to find the resultant configuration
given any initial configuration and the toppling counting function.
Explicitly, configuration $\eta$ undergoing a toppling procedure with the toppling counting function $u$ becomes
$$\fc{\eta'}x=\fc\eta x-\sum_y\fc\Dlt{x,y}\fc uy.$$
For abbreviation, we denote $x\mapsto\sum_y\fc\Dlt{x,y}\fc uy$ as $\Dlt u$
so that $\fc{\Dlt u}x=\sum_y\fc\Dlt{x,y}\fc uy$.
Therefore, the resultant configuration of a toppling procedure can be denoted as $\eta'=\eta-\Dlt u$.
This notation is natural if we think of $\Dlt$ as an $n$-dimensional matrix and
think of $\eta$ and $u$ as $n$-dimensional column vectors.
This equation tells us that the resultant configuration of two toppling procedures
is the same as long as they have the same toppling counting function.

A toppling procedure can then be expressed as a sequence of toppling counting functions
where the $t$th toppling counting function $u_t$ is that of the toppling procedure derived
by truncating the full toppling procedure up to the first $t$ topplings.
If the $t$th toppling happens at site $y$, then
$$\fc{u_t}x-\fc{u_{t-1}}x=\dlt_{xy}.$$
We stipulate that $u_0$ is the zero function.
From now on, we call a sequence $\B{u_t}_{t=0}^T$ (where $T$ is either a natural number or infinity)
as a toppling procedure as long as the following conditions are satisfied:
$u_0=0$,
and for all $0\le t<T$, there exists $y\in V$ such that $\fc{u_{t+1}}x=\fc{u_t}x+\dlt_{xy}$.
It is obvious to see that $\sum_x\fc{u_t}x=t$ for all $t$.
Therefore, the length $T$ of a toppling procedure is the same as the sum $\sum_x\fc ux$,
where $u\ceq u_T$ is the final toppling counting function of the toppling procedure.
The definition of the legality of a toppling procedure is also naturally extended to this formulation.

Because the resultant configuration of a toppling procedure is independent of the order of the topplings,
for two different sites $y$ and $y'$,
toppling $y$ and then $y'$ is equivalent to toppling $y'$ and then $y$.
Both toppling procedures have the same toppling counting function $\dlt_{xy}+\dlt_{xy'}$.
If both sites are unstable sites of the initial configuration,
then both toppling procedures are legal.
To see this, suppose that $y$ and $y'$ are two different unstable sites of the configuration $\eta$.
Then, the configuration $\eta'$ after $y$ topples is given by
$\fc{\eta'}x=\fc\eta x-\fc\tht y\dlt_{xy}+\fc\alp{y,x}$.
Its value at $y'$ is $\fc{\eta'}{y'}=\fc\eta{y'}+\fc\alp{y,y'}$
(notice that $\dlt_{yy'}=0$ because $y\ne y'$).
The first term is at least $\fc\tht{y'}$ because $y'$ is an unstable site of $\eta$.
The second term is nonnegative by definition.
We then have $\fc{\eta'}{y'}\ge\fc\tht{y'}$,
which means that $y'$ is also an unstable site of $\eta'$,
so toppling $y$ and then $y'$ is legal.
By the same logic, toppling $y'$ and then $y$ is legal.

Now, we proceed to prove the abelian property: a stabilizable configuration has a unique odometer.
To prove this, it is sufficient to prove that,
if a configuration is stabilizable,
then you can always construct a legal stabilizing toppling procedure by choosing an arbitrary
unstable site to topple at each step until the configuration becomes stable,
which is guaranteed to happen in finite steps,
and the resultant toppling counting function is independent of the choices of unstable sites to topple at each step.

We prove this by induction on the length of an arbitrary legal stabilizing toppling procedure.
We will prove case by case for length being $0$ and $1$ as base cases,
and then prove the inductive step for length being $T+1$ assuming the case for length being $T\ge1$.

The base case with zero length is trivial.
For the base case with length $1$, suppose that the configuration $\eta$ has a legal stabilizing toppling procedure of length $1$.
We need to prove that any choice of unstable site to topple leads to a stable configuration,
and the odometer is uniquely determined.
Becasue the constraint on the length of the toppling procedure,
we need to prove that the unstable site $y$ in the initial configuration that topples in the legal stabilizing toppling procedure
is the only unstable site in the initial configuration
(so that the odometer can only be $\fc ux=\dlt_{xy}$).
This is obvious because we have already proven that, if there is another unstable site $y'$,
then $y'$ is also an unstable site of the configuration after $y$ topples,
which contradicts the assumption that toppling $y$ is stabilizing.

Then proceed with the inductive part of the proof.
Suppose that, for any configuration with a legal stabilizing toppling procedure of length $T\ge1$,
arbitrarily choosing an unstable site to topple at each step will always stabilize after exactly $T$ steps,
and the toppling counting function of the resultant toppling procedure is unique.
Then, we need to prove the same thing for length $T+1$.
Suppose that configuration $\eta$ has a legal stabilizing toppling procedure of length $T+1$
and that its toppling counting function is $u$.
Denote $y$ as the first toppling site in this toppling procedure.
Then, the configuration $\eta'$ after the first toppling is given by $\fc{\eta'}x=\fc\eta x-\fc\tht y\dlt_{xy}+\fc\alp{y,x}$,
and it has a legal stabilizing toppling procedure of length $T$
whose toppling counting function is $\fc{u'}x=\fc ux-\dlt_{xy}$.
By the induction assumption, $\eta'$ stabilizes after $T$ arbitrary legal topplings,
and the toppling counting function must be $u'$.
Now, arbitrarily choose an unstable site $y'$ of $\eta$.
If $y'=y$, then toppling $y'$ gives $\eta'$, which stabilizes after $T$ arbitrary legal topplings.
If $y'\ne y$, then the fact that $y'$ is an unstable site of $\eta$ implies that $y'$ is an unstable site of $\eta'$,
so we can construct a legal stabilizing toppling procedure of $\eta'$ such that the first toppling site is $y'$.
We then get a legal stabilizing toppling procedure of $\eta$
whose toppling counting function is $u$ such that the first two toppling sites are $y$ and $y'$.
Because both $y$ and $y'$ are unstable sites of $\eta$,
we can simply swap the first two toppling sites to get a toppling procedure of $\eta$ such that the first two toppling sites are $y'$ and $y$.
This means that toppling $y'$ makes $\eta$ become a configuration with a legal stabilizing toppling procedure
of length $T$ with toppling counting function $\fc ux-\dlt_{xy'}$.
By the induction assumption, $\eta$ stabilizes after $y'$ topples followed by another $T$ arbitrary topplings.
Because $y'$ itself is an arbitrary choice of an unstable site,
$\eta$ stabilizes after $T+1$ arbitrary topplings,
and the toppling counting function is $u$.
This finishes the induction step of the proof.

## Least action principle

Another property of the abelian sandpile model is the <dfn>least action principle</dfn> [^least-action]:
assuming that $u$ is the odometer of a stabilizable configuration $\eta$,
then for any $u':V\to\bN$ such that $\eta-\Dlt u'<\tht$, we have $u'\ge u$.

[^least-action]:
I was puzzled by why people made the theorem have the same name as the more famous principle
in the field of classical mechanics also known as Hamilton's principle.
Apparently, people who coined the name are also phycists, who must have known Hamilton's principle,
so I think there must be a relation between those two seemingly unrelated propositions,
but I cannot devise such a relation.

Here I present a proof inspired by
[Fey et al. (2009)](https://doi.org/10.1007/s10955-009-9899-6).
Construct a legal toppling procedure starting from the configuration $\eta$ as follows.
At each step where $\fc{u_{t+1}}x=\fc{u_t}x+\dlt_{xy}$, the toppling site $y$ satisfies
$\fc\eta y-\fc{\Dlt u_t}y\ge\fc\tht y$
and $\fc{u_t}y<\fc{u'}y$.
When there are multiple sites satisfying the conditions, arbitrarily choose one.
Continue until none of the sites satisfy the conditions,
which always happen after finite steps because any toppling procedure of a stabilizable configuration is finite.
This is a legal toppling procedure whose toppling counting function never exceeds $u'$.
Suppose that the length of the toppling procedure is $T$.
We then prove by contradiction that this toppling procedure is stabilizing.
Suppose that the final configuration $\eta'=\eta-\Dlt u_T$ of this toppling procedure has an unstable site $y$.
Because the final configuration is unstable, the only reason that the toppling procedure stops is that $\fc{u_T}y=\fc{u'}y$.
Define $u''\ceq u'-u_T$, so $\fc{u''}y=0$ and $u''\ge0$.
We have
$$\begin{align*}
\fc\eta y-\fc{\Dlt u'}y
&=\fc{\eta'}y-\fc{\Dlt u''}y\\
&=\fc{\eta'}y-\fc\tht y\fc{u''}y+\sum_x\fc\alp{y,x}\fc{u''}x\\
&\ge\fc{\eta'}y\ge\fc\tht y,
\end{align*}$$
which contradicts the assumption that $y$ is an unstable site of $\eta'$.

What the least action principle tells us is that,
the odemeter $u$ of a stabilizable configuration $\eta$
is the unique minimum natural number solution
to the system of linear inequalities $\eta-\Dlt u<\tht$.
The toppling procedure defined above also provides a constructive way
to find the odometer once we have any natural number solution to the system of linear inequalities.

Notice that we cannot relax $u'$ to be a more general real-valued function.
If so, in the proof above, the condition $\fc{u''}y=0$ becomes $\fc{u''}y<1$.
In fact, we can easily find counterexamples where,
there exists a real-valued solution $u'$ to the system of linear inequalities,
but the configuration is exploding.
This is sad news because it means that determining the stabilizability of a configuration
cannot be done by linear programming.

A corollary of the least action principle is that,
if $\eta-\Dlt u<\tht$ has a natural number solution,
then there exists a unique minimum solution,
whose value at each site is the minimum among all natural number solutions at that site.

A related property is that,
if $u=u_1$ and $u=u_2$ both satisfies $\eta-\Dlt u<\tht$,
then $u=\opc{min}{u_1,u_2}$ also satisfies $\eta-\Dlt u<\tht$,
where $\fc{\opc{min}{u_1,u_2}}x\ceq\opc{min}{\fc{u_1}x,\fc{u_2}x}$
denotes the pointwise minimum.
This property also applies to general real-valued solutions
instead of just natural number solutions.
To prove this, assuming $\fc{u_1}x\le\fc{u_2}x$ without loss of generality,
notice that
$$\begin{align*}
\fc{\Dlt\opc{min}{u_1,u_2}}x
&=\fc\tht x\fc{u_1}x-\sum_y\fc\alp{x,y}\opc{min}{\fc{u_1}y,\fc{u_2}y}\\
&\ge\fc\tht x\fc{u_1}x-\sum_y\fc\alp{x,y}\fc{u_1}y\\
&=\fc{\Dlt u_1}x.
\end{align*}$$
By this property, under the binary operator $\opc{min}{\cdot,\cdot}$,
the set
$$P\ceq\set{u:V\to\bR}{\eta-\Dlt u<\tht,u\ge0}$$
forms an idempotent commutative semigroup if not empty.
Its closure
$$\overline P\ceq\set{u:V\to\bR}{\eta-\Dlt u\le\tht,u\ge0}$$
is an idempotent commutative monoid if not empty,
whose identity element is the unique minimum element of $\overline P$,
which obviously exists.
The set
$$P_\bN\ceq\set{u:V\to\bN}{\eta-\Dlt u<\tht}$$
is a subsemigroup of $P$ and also a monoid if not empty.
However, notice that the identity element of $P_\bN$ is always different from that of $\overline P$.

## Integer linear programming

As we have seen, determining the stabilizability of a configuration $\eta$
is equivalent to determining whether there exists a natural number solution
to the system of linear inequalities $\eta-\Dlt u<\tht$.
Such problems are called <dfn>integer linear programming (ILP)</dfn> problems.

The most general form of an ILP problem is, given a matrix $A$ and vectors $b$ and $c$,
to find natural number vector $x$ that minimizes $c^\mrm Tx$ subject to the constraint $Ax\le b$.
There is also the feasibility version of ILP problems,
which only asks whether there exists a natural number vector $x$ satisfying the constraint $Ax\le b$
without the objective of optimizing some objective.

Now come back to the problem of determining the stabilizability of a configuration $\eta$.
From a computational point of view,
because we cannot really store arbitrary real numbers in a computer,
we are only going to consider the case where $\eta$ and $\Dlt$ are both rational-valued functions.
Then, without loss of generality, when $V$ is finite, we can multiply both functions
by a common multiple of denominators to make them both integer-valued functions [^generality-integer].
The problem of determining the stabilizability of a configuration then becomes a special case of the
feasibility version of ILP problems,
which is to determine whether there exists a natural number solution to $\Dlt u\ge\psi$,
where $\psi\ceq\eta-\tht+1$.
It is only a special case because $\Dlt$ by the definition of the abelian sandpile model
can only be a Z-matrix,
which is defined as a square matrix whose off-diagonal entries are all nonpositive.
Because of this restriction, it may not be as hard as the general ILP problems,
which are known to be NP-complete.
However, because I neither have found any reference discussing the complexity of Z-matrix ILP problems
nor have devised any polynomial-time algorithm to solve them or reduced any known NP-complete problems to them [^reduce-np-complete],
I do not know whether the Z-matrix ILP problems are NP-complete or not.

[^generality-integer]:
This "without loss of generality" is actually not very obvious.
Mathematically speaking, we can always reduce the rational-valued case
to the integer-valued case.
However, computationally speaking, we need to prove that the input size of the reduced problem
is bounded by a polynomial of the input size of the original problem.
Fortunately, it is easy to prove for this case if the input size of a rational number $p/q$
is defined as $1+\ceil{\fc{\log_2}{\v p+1}}+\ceil{\fc{\log_2}{\v q+1}}$.

[^reduce-np-complete]:
The main difficulty in reducing other computation problems to Z-matrix ILP problems
is that Z-matrix ILP problems are "monotonic" in the sense that
two solutions $u_1$ and $u_2$ imply that their componentwise minimum is also a solution.
If we want to encode the answer to a computation problem into a solution to a Z-matrix ILP problem,
the original problem must also have this monotonicity property.

We can design this algorithm
inspired by [Hochbaum et al. (1994)](https://doi.org/10.1137/S0097539793251876)
to solve the Z-matrix ILP problem.
To find a natural number solution to $\Dlt u\ge\psi$ for some given Z-matrix $\Dlt$
and vector $\psi$,
first solve the linear programming relaxation of the problem
to find a real-valued minimum solution $u^*$
or exit and report nonexistence of solutions if $u^*$ does not exist,
and then iteratively calculate a sequence $\B{u^{\p k}}$ starting from $u^{\p0}\ceq\ceil{u^*}$
(where $\ceil{\cdot}$ is the componentwise ceiling function)
by this procedure:
for each row $x$ of $\Dlt$, if the inequality
$\sum_y\fc\Dlt{x,y}\fc{u^{\p k}}y\ge\fc\psi x$ is violated,
then exit and report nonexistence of solutions if $\fc\Dlt{x,x}\le0$, or update
$$\begin{align*}
\fc{u^{\p{k+1}}}x&\ceq\ceil{\fr1{\fc\Dlt{x,x}}\p{\fc\psi x-\sum_{y\ne x}\fc\Dlt{x,y}\fc{u^{\p k}}y}},\\
\fc{u^{\p{k+1}}}{y\ne x}&\ceq\fc{u^{\p k}}y
\end{align*}$$
and start the next iteration;
repeat the iteration until either all inequalities are satisfied (solution found)
or any component of $u^{\p k}$ exceed a predetermined upper bound $B$.

Before we address this dubious upper bound $B$, let us first prove that
this algorithm finds the minimum solution if a solution exists and is within the bound $B$.
There are three ways in which the program ends:
exceeding the bound, satisfying all inequalities, or having $\fc\Dlt{x,x}\le0$ for an unsatisfied inequality.

For the case when the program ends due to exceeding the bound,
we need to prove that no solution exists within the bound.
It is equivalent to proving that, if a solution $u_T\le B$ exists within the bound,
then $u^{\p k}$ can never exceed the bound.
Sufficiently, I will prove by induction that $u^{\p k}\le u_T$ for all $k$.
The base case $k=0$ is obvious because $u^*$ as the minimum real solution
must satisfy $u^*\le u_T$.
For the inductive step, suppose that $u^{\p k}\le u_T$ for some $k\ge0$.
Then, if row $x$ of the inequalities is violated
(in other words, $\sum_y\fc\Dlt{x,y}\fc{u^{\p k}}y\le\fc\psi x$), we have
$$\begin{align*}
\fc{u^{\p{k+1}}}x&=\ceil{\fr1{\fc\Dlt{x,x}}\p{\fc\psi x-\sum_{y\ne x}\fc\Dlt{x,y}\fc{u^{\p k}}y}}\\
&\le\ceil{\fr1{\fc\Dlt{x,x}}\p{\fc\psi x-\sum_{y\ne x}\fc\Dlt{x,y}\fc{u_T}y}}\\
&\le\ceil{\fc{u_T}x}=\fc{u_T}x,
\end{align*}$$
where the first inequality is due to the induction assumption and the Z-matrix property
and the second inequality is due to the assumption that $u_T$ is a solution of $\Dlt u\ge\psi$.

For the case when the program ends due to satisfying all inequalities,
we have found a solution.

For the case when the program ends due to having $\fc\Dlt{x,x}\le0$ for an unsatisfied inequality,
I will prove by contradiction that no solution exists in this case.
Suppose that there exists a solution $u_T$, then we have $u^{\p k}\le u_T$.
We then have
$$\fc\psi x>\sum_y\fc\Dlt{x,y}\fc{u^{\p k}}y
\ge\sum_y\fc\Dlt{x,y}\fc{u_T}y
\ge\fc\psi x,$$
where the first inequality is because of the violated inequality,
and the second inequality is because $\fc\Dlt{x,x}\le0$ and the Z-matrix property,
and the third inequality is because $u_T$ is a solution of $\Dlt u\ge\psi$.
This is a contradiction.

Finally, we address the dubious upper bound $B$.
In order for the algorithm to work,
we need to determine a finite upper bound $B$ under which a solution is guaranteed to exist
if any solution exists.
A safe choice is $B=u^*+nD$, where $D$ is maximum of the absolute values of subdeterminants [^subdeterminant] of the matrix $\Dlt$.
I follow
[Cook et al. (1986)](https://doi.org/10.1007/BF01582230)
to give a proof.

[^subdeterminant]:
I was confused by the word "subdeterminant" as I found it in the literature
because I never heard of it when I learned linear algebra.
I then searched it up on Wikipedia and found that it is the title of a Czech Wikipedia article
whose English version is titled "minor".
I then realized that a subdeterminant just means a minor,
which is the determinant of a matrix after removing some rows and/or columns.
I then think the word "subdeterminant" actually makes more sense than "minor"
because the latter is overused for too many concepts.

Suppose that there exists a natural number solution $u_T'$.
Partition elements in $V$ into two disjoint subsets $V_>$ and $V_<$ defined as
$$\begin{align*}
V_>&\ceq\set{x\in V}{\fc{\Dlt u_T'}x\ge\fc{\Dlt u^*}x},\\
V_<&\ceq\set{x\in V}{\fc{\Dlt u_T'}x<\fc{\Dlt u^*}x}.
\end{align*}$$
The set $V_<$ corresponds to the rows of inequalities that are slack.
To see this, notice that for $x\in V_<$, we have $\fc{\Dlt u^*}x>\fc{\Dlt u_T'}x\ge\fc\psi x$.
This motivates us to use complementary slackness to get more information about $\Dlt$.
Notice that, for any $z\in V$,
$u^*$ is an optimal solution to the linear program of minimizing $\fc uz$ subject to $\Dlt u\ge\psi$.
Its dual linear program is to maximize $\sum_x\fc\psi x\fc vx$
subject to the constraint $\sum_x\fc\Dlt{x,y}\fc vx\le\dlt_{yz}$ for all $y\in V$.
By complementary slackness, the optimal solution $v^*$ exists and satisfies $\fc{v^*}y=0$ for all $y\in V_<$.
Therefore, for any $u$ such that $\fc{\Dlt u}x\ge0$ for all $x\in V_>$, we have
$$\begin{align*}
\fc uz=\sum_y\fc uy\dlt_{yz}
&\ge\sum_y\fc uy\sum_{x\in V_>}\fc\Dlt{x,y}\fc{v^*}x\\
&=\sum_{x\in V_>}\fc{v^*}x\fc{\Dlt u}x\ge0.
\end{align*}$$
Because $z$ is arbitrary, this means that $\fc{\Dlt u}x\ge0$ for all $x\in V_>$
implies $u\ge0$.

We can define a polyhedral cone $C\ceq\set{u:V\to\bR}{\Dlt'u\ge0}$, where
$$\fc{\Dlt'}{x,y}\ceq\begin{cases}
\fc\Dlt{x,y},&x\in V_>,\\
-\fc\Dlt{x,y},&x\in V_<.
\end{cases}$$
We then have that $u\in C$ implies $u\ge0$.
We can choose a finite set $G\subseteq C$ that generates $C$
(in other words, $C$ is the nonnegative linear combination of $G$)
such that, for all $g\in G$, $g$ is integral and $0\le g\le D$.
To see that $g\le D$ is always possible, notice that $g$ is in the null space of some submatrix of $\Dlt'$,
which is spanned by vectors whose components are subdeterminants of $\Dlt'$,
which are all bounded by $D$ in absolute value by definition.
By definition of $V_>$ and $V_<$, we obviously have $u_T'-u^*\in C$.
Therefore, by Carath&eacute;odory's theorem,
there exists $d$ (the dimension of $C$) vectors $\B{g_i}$ in $G$
and $d$ nonnegative real numbers $\B{\lmd_i}$
such that $u_T'-u^*=\sum_i\lmd_ig_i$.
Construct
$$u_T\ceq u_T'-\sum_i\floor{\lmd_i}g_i
=u^*+\sum_i\p{\lmd_i-\floor{\lmd_i}}g_i.$$
It is obviously integral and satisfies $u_T\le B$.
We can verify that it is a solution of $\Dlt u\ge\psi$.
For $x\in V_<$, we have
$$\begin{align*}
\fc{\Dlt u_T}x
&=\fc{\Dlt u_T'}x-\sum_i\floor{\lmd_i}\fc{\Dlt g_i}x\\
&=\fc{\Dlt u_T'}x+\sum_i\floor{\lmd_i}\fc{\Dlt'g_i}x\\
&\ge\fc{\Dlt u_T'}x\ge\fc\psi x.
\end{align*}$$
For $x\in V_>$, we have
$$\begin{align*}
\fc{\Dlt u_T}x
&=\fc{\Dlt u^*}x+\sum_i\p{\lmd_i-\floor{\lmd_i}}\fc{\Dlt g_i}x\\
&=\fc{\Dlt u^*}x+\sum_i\p{\lmd_i-\floor{\lmd_i}}\fc{\Dlt'g_i}x\\
&\ge\fc{\Dlt u^*}x\ge\fc\psi x.
\end{align*}$$
We thus have found a solution $u_T\le B$.

Therefore, $B=u^*+nD$ is a valid upper bound.
However, it is often hard to compute $D$ in practice,
so we may use $B=u^*+nD'$ for some $D'\ge D$ that is easier to compute.
Obviously a choice is $D'=n!\V{\Dlt}_\infty^n$,
where $\V{\Dlt}_\infty\ceq\max_{x,y}\v{\fc\Dlt{x,y}}$.

Now that we have proven the correctness of the algorithm,
we can analyze its time complexity.
Because every iteration increases at least one component of $u^{\p k}$ by at least $1$,
the total number of iterations is at most $\V{B-u^*}_1=n^2n!\V{\Dlt}_\infty^n$,
where $\V{\cdot}_1$ is the sum of absolute values of components.
Each iteration takes $\order{n^2}$ time to check all inequalities.
Therefore, the total time complexity is $\order{n^4n!\V{\Dlt}_\infty^n}$.
It is a pseudopolynomial time algorithm for fixed $n$,
but grows superexponentially by $n$ for fixed $\V{\Dlt}_\infty$.

Also, notice that, in each iteration,
we can update any components of $u^{\p k}$ whose corresponding inequalities are violated in parallel
instead of only updating one component at each iteration.
The proof of correctness still holds.

## Guaranteed stabilizability

One interesting question to ask is how to determine whether
an abelian sandpile model guarantees the stabilizability of all legal configurations.
If determining this is easier than solving ILP problems,
then it is even useful for determining the stabilizability of particular configurations.

The answer to this question is that an abelian sandpile model guarantees the stabilizability of all legal configurations
if and only if $\Dlt$ is a nonsingular M-matrix
(an M-matrix is defined as a matrix that can be written in the form $sI-B$,
where $I$ is the identity matrix, $B$ is a nonnegative matrix,
and $s$ is at least as large as the spectral radius of $B$;
it is nonsingular when $s$ is strictly larger than the spectral radius of $B$),
which is also equivalent to saying that there exists $u\ge0$ such that $\Dlt u>0$
([Plemmons, 1977](https://doi.org/10.1016/0024-3795(77)90073-8)).
The necessity of this condition is easy to see because
it is implied by the stabilizibility of any configuration $\eta$ such that $\eta\ge\tht$.
To see the sufficiency, suppose that there exists $u\ge0$ such that $\Dlt u>0$.
Without loss of generality, we can assume that $u$ is rational-valued
because $\Dlt$ as a linear transformation on a finite-dimensional vector space
must be continuous.
We can then further assume that $u$ is integer-valued
by multiplying it by a common multiple of denominators.
Now, for any configuration $\eta$, we can always choose a sufficiently large constant $c$
such that $\Dlt\p{cu}>\eta-\tht$.
By the least action principle, $\eta$ is stabilizable.

In this case, we can define an abelian group called the <dfn>sandpile group</dfn>.
The elements are equivalent classes of configurations,
where two configurations $\eta$ and $\eta'$ are equivalent
if there exists some $u:V\to\bZ$ such that $\eta-\eta'=\Dlt u$.
The group operation $+$ is defined such that $\b{\eta}+\b{\eta'}=\b{\eta+\eta'}$,
where $\b{\cdot}$ denotes the equivalence class represented by a configuration.
Only if all configurations are stabilizable can any equivalence class
be represented by a stable legal configuration.
This group has many interesting properties
([Holroyd et al., 2008](https://doi.org/10.1007/978-3-7643-8786-0_17)),
but they are outside of the scope of this article.

To determine whether a Z-matrix is a nonsingular M-matrix,
we can perform an LU decomposition on $\Dlt$
and check whether all diagonal entries of the two triangular matrices are positive.
If they are, then $\Dlt$ is a nonsingular M-matrix.
For fixed $\V{\Dlt}_\infty$,
this can be done in $\order{n^3}$ time using Gaussian elimination.

## Implementation

Ask LLM to code for you.
