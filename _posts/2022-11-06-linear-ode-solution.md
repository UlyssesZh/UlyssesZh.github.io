---
title: Solving linear homogeneous ODE with constant coefficients
date: 2022-11-06 16:42:48 -0800
categories:
- math
tags:
- calculus
- linear algebra
- combinatorics
- ode
- long paper
- from zhihu
layout: post
excerpt: 'By using power series,
we can prove that the problem of solving linear homogeneous ODE with constant coefficients
can be reduced to the problem of solving a polynomial with those coefficients.
This article illustrates this point in detail,
but it uses a very awful notation...'
---

*This article is translated from a
Chinese [article](https://zhuanlan.zhihu.com/p/60752992) on my Zhihu account.
The original article was posted at 2019-04-06 13:46 +0800.*

*Notice*: Because this article was written very early,
there are many mistakes and inappropriate notations.

---

(I'm going to challenge writing articles without sum symbols!)

In this article, functions all refer to unary functions;
both independent and dependent variables are scalars;
and differentials refer to ordinary differentials.

**Definition 1** (linear differential operator).
Let $L\!\left(\mathrm D,x\right)$ be a differential operator.
If for any two functions $F_1\!\left(x\right),F_2\!\left(x\right)$
and constants $C_1,C_2$, the operator satisfies

$$L\left(C_1F_2+C_2F_2\right)=C_1LF_1+C_2LF_2,$$

then $L$ is a linear differential operator.

**Lemma 1**.
The sufficient and necessary condition for $L$ to be a linear differential operator is that
for any tuple of functions $\vec F\!\left(x\right)$
and any tuple of constants $\vec C$
(the dimensions of the two vectors are the same),
the operator satisfies

$$L\left(\vec C\cdot\vec F\right)=\vec C\cdot L\vec F.$$

*Brief proof.*
Directly letting $\vec C$ and $\vec F$ be 2-dimensional vectors and using Definition 1, the sufficiency can be proved;
by using mathematical induction on the dimension of $\vec C$ and $\vec F$,
the necessity can be proved. {% qed %}

**Definition 2**.
$\overrightarrow{a_n}_{n=0}^m\coloneqq\left(a_0,a_1,\ldots,a_m\right)$.

**Lemma 2**.
Suppose the $\left(m+1\right)$-dimensional vector $\vec a$ is independent to $x$,
and $\left\{f_n\!\left(x\right)\right\}_{n=0}^s$ is a sequence of functions,
then

$$\mathrm D^k\left(\vec a\cdot\overrightarrow{f_n\!\left(x\right)}_{n=0}^s\right)
=\vec a\cdot\overrightarrow{\mathrm D^kf_n\!\left(x\right)}_{n=0}^s.$$

*Brief proof.*
By mathematical induction. {% qed %}

**Lemma 3**.
Suppose $\vec P$ is a tuple of functions w.r.t. $x$,
and the dimension of $\vec P$ is $m+1$,
then the differential operator

$$L\!\left(\mathrm D,x\right)\coloneqq\vec P\cdot\overrightarrow{\mathrm D^k}^m_{k=0}$$

is a linear differential operator.

*Brief proof.*
By Definition 1. {% qed %}

**Corollary of Lemma 3**.
Suppose $\vec p$ is a constant $\left(m+1\right)$-dimensional vector,
then the differential operator

$$L\!\left(\mathrm D\right)\coloneqq\vec p\cdot\overrightarrow{\mathrm D^k}^m_{k=0}$$ {#eq:lin-diff-op-w-const-coef}

is a linear differential operator.

**Lemma 4** (associativity).

$$\overrightarrow{a_kb_k}_{k=0}^m\cdot\overrightarrow{c_k}_{k=0}^m
=\overrightarrow{a_k}_{k=0}^m\cdot\overrightarrow{b_kc_k}_{k=0}^m.$$

Proof is omitted.

**Definition 3** (linear differential operator with constant coefficients).
Linear differential operators with form as Equation [@eq:lin-diff-op-w-const-coef] are called linear differential operators with constant coefficients.

**Definition 4** (linear ODE).
Suppose $L$ is a linear differential operator.
Then the ODE w.r.t. the function $y\!\left(x\right)$

$$Ly=f$$

is called a linear ODE,
where $f\!\left(x\right)$ is a function.

Specially, if $f=0$, the ODE is called a homogeneous linear ODE.
If $L$ is a linear differential operator with constant coefficients,
then the ODE is called a linear ODE with constant coefficients.

**Definition 5** (generating function).
For a sequence $\left\{a_n\right\}_{n=0}^\infty$, the function

$$G\!\left(x\right)\coloneqq\overrightarrow{a_n}_{n=0}^\infty\cdot\overrightarrow{x^n}_{n=0}^\infty$$

is called the (ordinary) generating function (OGF) of the sequence.

*Note.* here we do not introduce vectors with infinite dimensions.
Actually,

$$G\!\left(x\right)\coloneqq\lim_{s\to\infty}\overrightarrow{a_n}_{n=0}^s\cdot\overrightarrow{x^n}_{n=0}^s.$$

**Definition 6** (exponential generating function).
For a sequence $\left\{a_n\right\}_{n=0}^\infty$,
the OGF of the sequence $\left\{\frac{a_n}{n!}\right\}_{n=0}^\infty$
is called the exponential generating function (EGF)
of the sequence $\left\{a_n\right\}_{n=0}^\infty$.
In other words,

$$G\!\left(x\right)\coloneqq\overrightarrow{\frac{a_n}{n!}}_{n=0}^\infty\cdot\overrightarrow{x^n}_{n=0}^\infty.$$

**Lemma 5** (differential of power functions).
Suppose $n,k\in\mathbb N$,
then

$$\mathrm D^k\left(x^n\right)=\frac{n!}{\left(n-k\right)!}x^{n-k}.$$

*Note.* it is stipulated that factorials of negative integers are infinity, so $\mathrm D^k\left(x^n\right)=0$ when $n<k$.

*Brief proof.*
By mathematical induction. {% qed %}

**Lemma 6** (differential of EGF).
If $G\!\left(x\right)$ is the EGF of a sequence $\left\{a_n\right\}_{n=0}^\infty$,
then $\mathrm D^kG$ is the EGF of $\left\{a_{n+k}\right\}_{n=0}^\infty$.

*Proof.*

$$\begin{align*}
\mathrm D^kG&=\mathrm D^k\left(\overrightarrow{\frac{a_n}{n!}}_{n=0}^\infty\cdot\overrightarrow{x^n}_{n=0}^\infty\right)
&\text{(Definition 6)}\\
&=\overrightarrow{\frac{a_n}{n!}}_{n=0}^\infty\cdot\overrightarrow{\mathrm D^k\left(x^n\right)}_{n=0}^\infty&
\text{(Lemma 2)}\\
&=\overrightarrow{\frac{a_n}{n!}}_{n=0}^\infty\cdot\overrightarrow{\frac{n!}{\left(n-k\right)!}x^{n-k}}_{n=0}^\infty&
\text{(Lemma 5)}\\
&=\overrightarrow{\frac{a_n}{\left(n-k\right)!}}_{n=0}^\infty\cdot\overrightarrow{x^{n-k}}_{n=0}^\infty&
\text{(Lemma 4)}\\
&=\overrightarrow{\frac{a_{n+k}}{n!}}_{n=0}^\infty\cdot\overrightarrow{x^n}_{n=0}^\infty.&
\text{(note in Lemma 5)}
\end{align*}$$

Then the result can be proved by Definition 6. {% qed %}

**Corollary to Lemma 6**.

$$\overrightarrow{\mathrm D^k}_{k=0}^m\left(\overrightarrow{\frac{a_n}{n!}}_{n=0}^\infty\cdot\overrightarrow{x^n}_{n=0}^\infty\right)
=\overrightarrow{\overrightarrow{\frac{a_{n+k}}{n!}}_{n=0}^\infty\cdot\overrightarrow{x^n}_{n=0}^\infty}_{k=0}^\infty.$$

**Lemma 7** (associativity).

$$\overrightarrow{\vec a\cdot\overrightarrow{b_{n,k}}_{k=0}^m}_{n=0}^s\cdot\vec c
=\vec a\cdot\overrightarrow{\overrightarrow{b_{n,k}}_{n=0}^s\cdot\vec c}_{k=0}^m.$$

Proof is omitted.

**Definition 7** (zero function).
The function whose value is always zero whatever the value of the independent variable is is called the zero function.

**Lemma 8**.
The sufficient and necessary condition for the OGF/EGF of a sequence $\left\{a_n\right\}_{n=0}^\infty$ to be zero function
is that $a_n=0$ for any $n$.

*Brief proof.*
The sufficiency can be proved by Definition 6 and Definition 7;
the necessity can be proved by Taylor expansion of the zero function. {% qed %}

**Definition 8**.

$$\overrightarrow{\overrightarrow{a_{n,k}}_{n=0}^s}_{k=0}^m\coloneqq
\left(\begin{matrix}
a_{0,0}&a_{0,1}&\cdots&a_{0,m}\\
a_{1,0}&a_{1,1}&\cdots&a_{1,m}\\
\vdots&\vdots&\ddots&\vdots\\
a_{s,0}&a_{s,1}&\cdots&a_{s,m}
\end{matrix}\right).$$

**Lemma 9** (distributivity).

$$\overrightarrow{\vec p\cdot\overrightarrow{a_{n,k}}_{k=0}^m}_{n=0}^s=
\overrightarrow{\overrightarrow{a_{n,k}}_{n=0}^s}_{k=0}^m\vec p.$$

Proof is omitted.

**Definition 9** (sequence equation).
Let $\left\{a_n\right\}_{n=0}^\infty$ be an unknown sequence.
If the function $F\!\left(n\right)$ explicitly depends on terms in the sequence,
then the function

$$F\!\left(n\right)=0$$

is called a sequence equation w.r.t. the sequence $\left\{a_n\right\}_{n=0}^\infty$.
For a sequence, if it satisfies the equation for any $n$,
then it is called a special solution of the sequence equation.
The set of all special solutions of the sequence equation is called the general solution of the equation.

**Definition 10** (linear dependence of sequences).
If for a set of sequences (a sequence of tuples) $\left\{\vec a_n\right\}_{n=0}^\infty$
there exists a tuple of constants $\vec C$ which are not all zero
(the dimensions of $\vec C$ and $\vec a_n$ are the same)
such that

$$\vec C\cdot\vec a_n=0$$

for any $n$,
then the set of sequences are called to be linearly dependent.
They are otherwise called to be linearly independent.

**Lemma 10**.
The sufficient and necessary condition for a set of $m+1$ sequences $\left\{\vec a_n\right\}_{n=0}^\infty$
to be linearly dependent is that

$$\operatorname{det}\overrightarrow{\vec a_{n+k}}_{k=0}^m=0.$$

*Proof.*
First prove the necessity.
There exists a tuple of constants $\vec C$ which are not all zero such that

$$\vec C\cdot\vec a_n=0$$

for any $n$ (Definition 10).

Replace $n$ by $n,n+1,n+1,\ldots,n+m$ respectively, and we have

$$\overrightarrow{\vec C\cdot\vec a_{n+k}}_{k=0}^m=\vec 0.$$

Let the $\left(l+1\right)$th component of $\vec a_n$ be $a_n^{*l}$,
i.e. $\vec a_n=\overrightarrow{a_n^{*l}}_{l=0}^m$.
Then we have

$$\overrightarrow{\vec C\cdot\overrightarrow{a_n^{*l}}_{l=0}^m}_{k=0}^m=\vec 0.$$

By Lemma 9, the LHS actually equals $\overrightarrow{\overrightarrow{a_{n}^{*l}}_{k=0}^m}_{l=0}^m\vec C$.

Define matrix

$$\mathbf A\coloneqq\overrightarrow{\overrightarrow{a_n^{*l}}_{k=0}^m}_{l=0}^m,$$

then $\mathbf A\vec C=\vec 0$, and

$$\operatorname{det}\mathbf A=\operatorname{det}\mathbf A^\mathrm T=\det\overrightarrow{\vec a_{n+k}}_{k=0}^m.$$

Prove by contradiction.
Assume that the value of the determinant is not $0$,
i.e. $\operatorname{det}\mathbf A\ne0$,
then the matrix $\mathbf A$ is invertible.
Multiply the equation $\mathbf A\vec C=\vec 0$ by $\mathbf A^{-1}$ from the left on both sides,
and we have $\vec C=\vec 0$, which contradicts with the fact that $\vec C$ is not all zero.

Therefore, $\det\overrightarrow{\vec a_{n+k}}_{k=0}^m=0$.

(Boohoo! I cannot prove the sufficiency myself.) {% qed %}

**Lemma 11**.
Suppose the sequence equation

$$\vec p\cdot\overrightarrow{a_{n+k}}_{k=0}^m=0$$

(where $\vec p$ is a $\left(m+1\right)$-dimensional constant vector and not all zero)
has a set of $m$ linearly independent special solutions
$\left\{\overrightarrow{a_n^{*l}}_{l=1}^m\right\}$,
then the general solution of the sequence solution is
$\vec C\cdot\overrightarrow{a_n^{*l}}_{l=1}^m$,
where $\vec C$ is a tuple of $m$ constants.

*Proof.*
First prove that $\left\{a_n\right\}$, where

$$a_n\coloneqq\vec C\cdot\overrightarrow{a_n^{*l}}_{l=1}^m,$$

must be a special solution of the original sequence equation.

Substitute it into the LHS of the original sequence equation, and we have

$$\begin{align*}
\vec p\cdot\overrightarrow{\vec C\cdot\overrightarrow{a_{n+k}^{*l}}_{l=1}^m}_{k=0}^m
&=\vec C\cdot\overrightarrow{\vec p\cdot\overrightarrow{a_{n+k}^{*l}}_{k=0}^m}_{l=1}^m&
\text{(Lemma 7)}\\
&=\vec C\cdot\overrightarrow0_{l=1}^m&
\text{(Definition 9)}\\
&=0.
\end{align*}$$

By Definition 9, the sequence $\left\{a_n\right\}$ is a special solution of the original sequence equation.

Then prove that the original sequence equation does not have a special solution $\left\{a_n\right\}$,
such that there does not exist a set of $m$ constants $\vec C$
such that $a_n=\vec C\cdot\overrightarrow{a_n^{*l}}_{l=1}^m$ for any $n$.

Prove by contradiction.
Assume there is such a special solution, denoted as $\left\{a_n^{*0}\right\}$.
Then by Definition 10, the set of sequences (sequence of tuples)
$\overrightarrow{a_n^{*l}}_{l=0}^m$ are linearly independent.
Let matrix

$$\mathbf A\coloneqq\overrightarrow{\overrightarrow{a_n^{*l}}_{l=0}}_{k=0}^m,$$

then according to Lemma 10, $\mathbf A$ is invertible.

Because the set of sequences are all special solutions of the original sequence equation,
by Definition 9,

$$\overrightarrow{\vec p\cdot\overrightarrow{a_{n+k}^{*l}}_{k=0}^m}_{l=0}^m=\vec 0.$$

By Lemma 9, the LHS of the equation is actually $\mathbf A\vec p$.
Therefore,

$$\mathbf A\vec p=\vec 0.$$

Multiply the equation by $\mathbf A^{-1}$ from the left on both sides, we have

$$\vec p=\vec 0,$$

which contradicts with the fact that $\vec p$ is not all zero.

From all the above, we have proved that the general solution of the sequence equation is
$\vec C\cdot\overrightarrow{a_n^{*l}}_{l=1}^m$. {% qed %}

**Definition 11** (polynomial).
Suppose $\vec p$ is a constant vector whose $\left(m+1\right)$th component is not $0$,
then the function

$$F\!\left(x\right)\coloneqq\vec p\cdot\overrightarrow{x^k}_{k=0}^m$$

is called a polynomial of degree $m$ w.r.t. $x$,
and $\vec p$ is called the coefficients of the polynomial.

**Definition 12** (multiplicity).
Suppose $F\!\left(x\right)$ is an $m$-degree polynomial w.r.t. $x$,
and $r$ is a complex number,
then the maximum natural number $w\le m$ such that

$$\overrightarrow{\mathrm D^qF\!\left(r\right)})_{q=0}^{w-1}=\vec 0$$

is called the multiplicity of $r$ in the polynomial.
The complex number with non-zero multiplicity is called a root of the polynomial.

**Lemma 12** (fundamental theorem of algebra).
The sum of multiplicity of roots of a polynomial equals the degree of the polynomial.

Proof is omitted.

**Definition 13** (binomial coefficient).

$$\binom uv\coloneqq\frac{u!}{v!(u-v)!}.$$

**Lemma 13**.

If $r$ is a root with multiplicity $w$ of the polynomial with coefficients $\vec p$,
then for any natural number $q<w$, we have

$$\vec p\cdot\overrightarrow{\frac{k!}{\left(k-q\right)!}r^{k-q}}_{k=0}^m=0.$$

*Brief proof.*
First use Definition 11 and Definition 12,
and then use Lemma 2 and Lemma 5. {% qed %}

**Lemma 14** (Vandermonde's identity).

$$\overrightarrow{\binom u{q-u}}_{u=0}^q\cdot\overrightarrow{\binom ku}_{u=0}^q=\binom{n+k}q.$$

Proof is omitted.

**Lemma 15**.

$$\overrightarrow{\binom qu}_{u=0}^q\cdot
\overrightarrow{\frac{n!}{\left(n-q+u\right)!}\frac{k!}{\left(k-u\right)!}}_{u=0}^q
=\frac{\left(n+k\right)!}{\left(n+k-q\right)!}.$$

*Proof.*

$$\begin{align*}
\overrightarrow{\binom qu}_{u=0}^q\cdot
\overrightarrow{\frac{n!}{\left(n-q+u\right)!}\frac{k!}{\left(k-u\right)!}}_{u=0}^q
&=\overrightarrow{\frac{q!}{u!\left(q-u\right)!}}_{u=0}^q\cdot
\overrightarrow{\frac{n!}{\left(n-q+u\right)!}\frac{k!}{\left(k-u\right)!}}_{u=0}^q&
\text{(Definition 13)}\\
&=q!\overrightarrow{\frac{n!}{\left(q-u\right)!\left(n-q+u\right)!}}_{u=0}^q\cdot
\overrightarrow{\frac{k!}{u!\left(k-u\right)!}}_{u=0}^q&
\text{(Lemma 4)}\\
&=q!\overrightarrow{\binom n{q-u}}_{u=0}^q\cdot
\overrightarrow{\binom ku}_{u=0}^q&
\text{(Definition 13)}\\
&=q!\binom{n+k}q&
\text{(Lemma 14)}\\
&=q!\frac{\left(n+k\right)!}{q!\left(n+k-q\right)!}&
\text{(Definition 13)}\\
&=\frac{\left(n+k\right)!}{\left(n+k-q\right)!}.
\end{align*}$$
{% qed %}

**Lemma 16**.
If $r$ is a root with multiplicity $w$ of the polynomial with coefficients $\vec p$,
then for any natural number $q<w$, the sequence

$$a_n\coloneqq\frac{n!}{\left(n-q\right)!}r^{n-q}$$ {#eq:special-sol-of-seq-eq}

is a special solution of the sequence equation
$\vec p\cdot\overrightarrow{a_{n+k}}_{k=0}^m=\vec 0$.

*Proof.*
Because

$$a_{n+k}=\frac{\left(n+k\right)!}{\left(n+k-q\right)!}r^{n+k-q},$$

we have

$$\begin{align*}
\frac{a_{n+k}}{r^{n+k-q}}&=\frac{\left(n+k\right)!}{\left(n+k-q\right)!}\\
&=\overrightarrow{\binom qu}_{u=0}^q\cdot
\overrightarrow{\frac{n!}{\left(n-q+u\right)!}\frac{k!}{\left(k-u\right)!}}_{u=0}^q&
\text{(Lemma 15)}\\
&=r^{-k}\left(\overrightarrow{\frac{k!}{\left(k-u\right)!}}_{u=0}^q\cdot
\overrightarrow{\binom qu\frac{n!}{\left(n-q+u\right)!}r^u}_{u=0}^q\right),&
\text{(Lemma 4)}
\end{align*}$$

and thus

$$a_{n+k}=r^{n-q}\left(\overrightarrow{\frac{k!}{\left(k-u\right)!}r^{k-u}}_{u=0}^q\cdot
\overrightarrow{\binom qu\frac{n!}{\left(n-q+u\right)!}r^u}_{u=0}^q\right).$$

Because the LHS of the original sequence equation

$$\begin{align*}
\vec p\cdot\overrightarrow{a_{n+k}}_{k=0}^m
&=\vec p\cdot\overrightarrow{r^{n-q}\left(\overrightarrow{\frac{k!}{\left(k-u\right)!}r^{k-u}}_{u=0}^q\cdot
\overrightarrow{\binom qu\frac{n!}{\left(n-q+u\right)!}r^u}_{u=0}^q\right)}_{k=0}^m\\
&=r^{n-q}\overrightarrow{\binom qu\frac{n!}{\left(n-q+u\right)!}r^u}_{u=0}^q\cdot
\overrightarrow{\vec p\cdot\overrightarrow{\frac{k!}{\left(k-u\right)!}r^{k-u}}_{u=0}^q}_{k=0}^m&
\text{(Lemma 7)}\\
&=r^{n-q}\overrightarrow{\frac{n!}{\left(n-q+u\right)!}r^u}_{u=0}^q\cdot
\overrightarrow{0}_{k=0}^m&
\text{(Lemma 13)}\\
&=0,
\end{align*}$$

by Definition 9, $\left\{a_n\right\}$ is a special solution of the sequence equation. {% qed %}

**Lemma 17**.
The sequence

$$a_n\coloneqq\overrightarrow{\overrightarrow{C_{l,q}}_{q=0}^{w_l-1}\cdot
\overrightarrow{\frac{n!}{\left(n-q\right)!}r_l^{n-q}}_{q=0}^{w_l-1}}_{l=1}^o\cdot\vec 1$$

is the general solution to the sequence equation
$\vec p\cdot\overrightarrow{a_{n+k}}_{k=0}^m=0$,
where $\overrightarrow{r_l}_{l=1}^o$ all different roots of the polynomial with coefficients $\vec p$,
and $\overrightarrow{w_l}_{l=1}^o$ are the corresponding multiplicities of the roots,
and $C_{l,q}$ are arbitrary constants.

*Brief proof.*
By Lemma 16, the root $r_l$ brings $w_l$ special solutions.
All the special solutions brought by all the roots can be proved to be linearly independent.
According to Lemma 12, there are $m$ linearly independent special solutions.
According to Lemma 11, the result can be proved. {% qed %}

**Lemma 18**.
The sufficient and necessary condition for the sequence
$\left\{a_n\right\}$ to be a special solution of the sequence equation
$\vec p\cdot\overrightarrow{a_{n+k}}_{k=0}^m=0$ is that
its EGF is a special solution of the ODE

$$\vec p\cdot\overrightarrow{\mathrm D^k}_{k=0}^m y=0.$$

*Proof.*
First prove the sufficiency.
Suppose $y$ is the EGF of $\left\{a_n\right\}$, i.e.

$$y=\overrightarrow{\frac{a_n}{n!}}_{n=0}^{\infty}\cdot\overrightarrow{x^n}_{n=0}^\infty$$

(Definition 6), then the LHS of the original ODE

$$\begin{align*}
L\!\left(\mathrm D\right)y
&=\vec p\cdot\overrightarrow{\mathrm D^k}_{k=0}^m
\left(\overrightarrow{\frac{a_n}{n!}}_{n=0}^{\infty}\cdot\overrightarrow{x^n}_{n=0}^\infty\right)\\
&=\vec p\cdot\overrightarrow{\overrightarrow{\frac{a_{n+k}}{n!}}_{n=0}^\infty\cdot\overrightarrow{x^n}_{n=0}^\infty}_{k=0}^m&
\text{(Lemma 6)}\\
&=\overrightarrow{\vec p\cdot\overrightarrow{\frac{a_{n+k}}{n!}}_{k=0}^m}_{n=0}^\infty\cdot
\overrightarrow{x^n}_{n=0}^\infty&
\text{(Lemma 7)}\\
&=\overrightarrow{\frac{\vec p\cdot\overrightarrow{a_{n+k}}_{k=0}^m}{n!}}_{n=0}^\infty\cdot
\overrightarrow{x^n}_{n=0}^\infty.
\end{align*}$$

Therefore, $L\!\left(\mathrm D\right)y$ is the EGF of the sequence $\left\{\vec p\cdot\overrightarrow{a_{n+k}}_{k=0}^m\right\}_{n=0}^\infty$.
Because it is a zero function,
by Lemma 8, for any $n$,

$$\vec p\cdot\overrightarrow{a_{n+k}}_{k=0}^m=0.$$

All the steps are reversible, so the necessity is also proved. {% qed %}

**Definition 14** (exponential function).
The EGF of the sequence $\left\{1\right\}$ is called the exponential function, i.e.

$$\mathrm e^x\coloneqq\overrightarrow{\frac 1{n!}}_{n=0}^{\infty}\cdot\overrightarrow{x^n}_{n=0}^\infty.$$

**Lemma 19**.
If $y$ is the EGF of the sequence in Equation [@eq:special-sol-of-seq-eq],
then $y=x^q\mathrm e^{rx}$.

*Proof.*

$$\begin{align*}
y&=\overrightarrow{\frac{\frac{n!}{\left(n-q\right)!}}{n!}}_{n=0}^{\infty}\cdot\overrightarrow{x^n}_{n=0}^\infty&
\text{(Definition 6)}\\
&=\overrightarrow{\frac{r^{n-q}}{\left(n-q\right)!}}_{n=0}^{\infty}\cdot\overrightarrow{x^n}_{n=0}^\infty\\
&=\overrightarrow{\frac{r^n}{n!}}_{n=0}^{\infty}\cdot\overrightarrow{x^{n+q}}_{n=0}^\infty&
\text{(note of Lemma 5)}\\
&=x^q\overrightarrow{\frac 1{n!}}_{n=0}^{\infty}\cdot\overrightarrow{\left(rx\right)^n}_{n=0}^\infty&
\text{(Lemma 4)}\\
&=x^q\mathrm e^{rx}.&
\text{(Definition 14)}
\end{align*}$$
{% qed %}

**Corollary of Lemma 18 and 19**.
The function

$$y=\overrightarrow{\overrightarrow{C_{l,q}}_{q=0}^{w_l-1}\cdot\overrightarrow{x^q}{q=0}^{w_l-1}\mathrm e^{r_lx}}_{l=1}^o\cdot\vec 1$$

is the general solution of the ODE

$$\vec p\cdot\overrightarrow{\mathrm D^k}_{k=0}^m y=0,$$

where $\overrightarrow{r_l}_{l=1}^o$ are the different roots of the polynomial with coefficients $\vec p$,
and $\overrightarrow{w_l}_{l=1}^o$ are the corresponding multiplicities of the roots,
and $C_{l,q}$ are arbitrary constants.

Finally, according to all the lemmas above, we now know how to solve the ODE

$$\vec p\cdot\overrightarrow{\mathrm D^k}_{k=0}^m y=0,$$

where the $\left(m+1\right)$th component of $\vec p$ is not zero.
Actually, all we need to do is to solve the polynomial with coefficients $\vec p$,
and use the corollary above,
and then we can get the general solution of the original ODE.

The method is identical to that in *Advanced Mathematics* (notes of translation: this is a popular book in China about calculus),
but the derivation is different.
Although mine is much more complex, but it is very interesting, because it involves much knowledge in algebra.

(I haven't used the summation symbol! I'm so good!

The whole article is using the scalar product of vectors as summation, very entertaining.
Actually, when examining linear problems, vectors are good.
Also, it looks clear if I use the vector notation.)
