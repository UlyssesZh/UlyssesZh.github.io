---
title: 'The core of a voting system is the intersection of Pareto sets'
date: 2023-03-25 23:28:53 -0700
categories:
- economics
tags:
- voting system
- preference relation
- pareto efficiency
layout: post
excerpt: 'There is a very neat relation between the core
(the set of proposals that defeats every proposal)
of a voting system and the Pareto sets of the voters.
Suppose there is a voting system of quota $q$,
then the core is the intersection of all such sets:
the Pareto set of $q$ of the voters.'
---

Voting system is a concept in political science.
Here I give the mathematical definition of a voting system.

A **(binary) voting system** is a tuple $(P,V,q)$, where
$P$ is any set, called the set of **proposals**,
and $V$ is a finite set of preference relations on $P$, called the set of **voters**,
and $q$ is an integer between (inclusive) $0$ and $\left|V\right|$,
called the **quota**.

For each voter $v\in V$ and two proposals $x,y\in P$,
we denote "$v$ prefers $x$ to $y$" by

$$x\succeq_vy.$$

A proposal $x\in P$ is a **defeat** of $y\in P$ if

$$\left|\left\{v\in V\,\middle|\,x\succeq_vy\right\}\right|\geq q,$$

denoted as $x\succsim_{V,q}y$
(despite this notation, $\succsim_{V,q}$ is *not* necessarily a preference relation on $P$
because it is not transitive generally,
which is actually a well-known example of irrationality).

The **core** $\mathcal C(P,V,q)$ of the voting system is the set of such element $x\in P$:
$x$ does not have any defeat other than $x$ itself (non-trivial defeat).

---

Pareto sets are common concepts in economics.
To clarify, I also give the mathematical definition of them here.

Let $P$ be a set and $Q$ be a family of preference relations on $P$.
Then, $x\in P$ is called a (weak) **$Q$-Pareto improvement** of $y\in P$ if $\forall v\in V:x\succeq_vy$,
denoted as $x\succsim_Qy$
(despite the notation, $\succsim_Q$ is *not* necessarily a preference relation on $P$).

The **Pareto set** $\mathcal P(P,Q)$ is the set of all such element $x\in P$:
$x$ does not have any $Q$-Pareto improvement other than $x$ itself
(non-trivial $Q$-Pareto improvement).

---

Here is the main result.
For a voting system $(P,V,q)$,

$$\mathcal C(P,V,q)=\bigcap_{Q\subseteq V,\left|Q\right|=q}\mathcal P(P,Q).$$

*Proof.*
To prove this, we need to show that
$x\in P$ does not have any non-trivial Pareto improvement for any $q$ voters iff
$x$ does not have any non-trivial defeat.

To prove the forward direction, suppose
that $x\in P$ does not have any non-trivial Pareto improvement for any $q$ voters.
Let $y\in P$ such that $y\ne x$, and the goal is to prove that $y$ is not a defeat of $x$.

Let

$$Y:=\left\{v\in V\,\middle|\,y\succeq_vx\right\}.$$

Then, $y$ is a $Y$-Pareto improvement of $x$,
so we have $\left|Y\right|<q$
(because otherwise there is a subset of $Y$ with $q$ voters for which $y$ is a Pareto improvement of $x$).
Therefore, $y$ is not a defeat of $x$.

To prove the backward direction, suppose
that $x\in P$ has a non-trivial $Q$-Pareto improvement, where $Q\subseteq V$ and $\left|Q\right|=q$.
Denote the improvement as $y$. Let

$$Y:=\left\{v\in V\,\middle|\,y\succeq_vx\right\}.$$

because $y$ is a $Q$-Pareto improvement of $x$, we have $Q\subseteq Y$.
Therefore, $\left|Y\right|\geq\left|Q\right|=q$.
Therefore, $y$ is a defeat of $x$.
$\square$

---

Specially, we have

$$\mathcal C\!\left(P,V,\left|V\right|\right)=\mathcal P(P,V).$$

---

Here is an example.
Suppose we have 5 voters, and the set of proposals is $\mathbb R^2$.
Each voter has an ideal point and prefers points nearer to the ideal point.
The 5 ideal points form a convex pentagon.
Then we can find the core easily by the conclusion above:

<!--
\documentclass{standalone}
\usepackage{tikz}

\tikzset{c/.style={every coordinate/.try}}

\begin{document}

\begin{tikzpicture}
	\coordinate (a) at (0,0);
	\coordinate (b) at (0.5,0.5);
	\coordinate (c) at (1,0.3);
	\coordinate (d) at (1,-0.3);
	\coordinate (e) at (0.5,-0.5);
	\coordinate (cap) at (1.5,0);
	\newcommand{\vect}{(a),(b),(c),(d),(e),(a),(b),(c),(d)}
	\foreach \i in {0,...,4} {
		\foreach [count=\j] \coord in \vect {
			\def\k{\number\numexpr\j-\i\relax}
			\coordinate[at=\coord,name=v\k];
		}
		\begin{scope}[every coordinate/.style={shift={(2*\i,0)}}]
			\fill[gray] ([c]v1) -- ([c]v2) -- ([c]v3) -- ([c]v4) -- cycle;
			\draw[thick] ([c]a) -- ([c]b) -- ([c]c) -- ([c]d) -- ([c]e) -- cycle;
			\draw[dashed] ([c]v1) -- ([c]v4);
			\ifnum\i=4
				\node at ([c]cap) {$=$};
			\else
				\node at ([c]cap) {$\cap$};
			\fi
		\end{scope}
	}
	\begin{scope}[every coordinate/.style={shift={(2*5,0)}}]
		\begin{scope}
			\foreach \i in {0,...,4} {
				\foreach [count=\j] \coord in \vect {
					\def\k{\number\numexpr\j-\i\relax}
					\coordinate[at=\coord,name=v\k];
				}
				\clip ([c]v1) -- ([c]v2) -- ([c]v3) -- ([c]v4) -- cycle;
			}
			\fill[gray] ([c]a) -- ([c]b) -- ([c]c) -- ([c]d) -- ([c]e) -- cycle;
		\end{scope}
		\draw[thick] ([c]a) -- ([c]b) -- ([c]c) -- ([c]d) -- ([c]e) -- cycle;
		\draw[dashed] ([c]a) -- ([c]c);
		\draw[dashed] ([c]b) -- ([c]d);
		\draw[dashed] ([c]c) -- ([c]e);
		\draw[dashed] ([c]d) -- ([c]a);
		\draw[dashed] ([c]e) -- ([c]b);
	\end{scope}
\end{tikzpicture}

\end{document}
-->
![The core of the example]({{page.figure}}five_voting_core.svg){.dark-adaptive .center}
