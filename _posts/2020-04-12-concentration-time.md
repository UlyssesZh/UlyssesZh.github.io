---
title: The concentration change of gas in reversible reactions
date: 2020-04-12 10:00:01 +0800
categories:
- chemistry
tags:
- calculus
- chemical reaction
- long paper
layout: post
---

# Introduction

A reversible elementary reaction takes place inside a closed,
highly thermally conductive container of constant volume,
whose reactants are all gases, and the reaction equation is
\begin{equation\*}
    \sum_ka_kX_k\rightleftharpoons\sum_kb_kY_k,
\end{equation\*}
where $X_k$ and $Y_k$ are reactants, and $a_k$ and $b_k$ are
stoichiometries.

Use square brackets to denote concentrations.
Our goal is to find $\left\[X_k\right]$ and $\left\[Y_k\right]$
as functions with respect to time $t$.

# The approach

It is easy to write out the rate equations
\begin{equation}
\begin{split}
    \frac{\mathrm d\left\[X_j\right]}{\mathrm dt}=
        a_j\left(\mu_Y\prod_k\left\[Y_k\right]^{b_k}-
        \mu_X\prod_k\left\[X_k\right]^{a_k}\right),\\\
    \frac{\mathrm d\left\[Y_j\right]}{\mathrm dt}=
        b_j\left(\mu_X\prod_k\left\[X_k\right]^{a_k}-
        \mu_Y\prod_k\left\[Y_k\right]^{b_k}\right),
\end{split}
    \label{rate_equations}
\end{equation}
where $\mu_X$ and $\mu_Y$ are rate constants derived by experimenting.

Apply a substitution
\begin{equation}
\begin{split}
    x_j:=\frac{\left\[X_j\right]}{a_j},\quad
    y_j:=\frac{\left\[Y_j\right]}{b_j},\\\
    \mu_x:=\mu_X\prod_ka_k^{a_k},\quad
    \mu_y:=\mu_Y\prod_kb_k^{b_k}
\end{split}
    \label{substitution}
\end{equation}
to Formula \ref{rate_equations}, and then it becomes
\begin{equation}
\begin{split}
    \frac{\mathrm dx_j}{\mathrm dt}=
    \mu_y\prod_ky_k^{b_k}-\mu_x\prod_kx_k^{a_k},\\\
    \frac{\mathrm dy_j}{\mathrm dt}=
    \mu_x\prod_kx_k^{a_k}-\mu_y\prod_ky_k^{b_k},
\end{split}
    \label{substituted_rate}
\end{equation}
which means the changes of $x_j$ are all equal,
the changes of $y_j$ are all equal,
and the changes of $x_j$ are opposite to the changes of $y_j$.

Denote the changes of $x_j$ are equal to $s$, the initial value of
$x_j$ is $A_j$, the initial value of $y_j$ is $B_j$, which means
\begin{equation}
\begin{split}
    x_j=A_j+s,\\\
    y_j=B_j-s.
\end{split}
    \label{back}
\end{equation}

Substitute Formula \ref{back} into Formula \ref{substituted_rate},
and it can be derived that
\begin{equation\*}
    \frac{\mathrm ds}{\mathrm dt}=F\left(s\right),
\end{equation\*}
by which we can reduce the problem to an integral problem
\begin{equation}
    t=\int_0^s\frac{\mathrm ds}{F\left(s\right)},
    \label{separated}
\end{equation}
where
\begin{equation}
    F\left(s\right):=\mu_y\prod_k\left(B_k-s\right)^{b_k}-
    \mu_x\prod_k\left(A_k+s\right)^{a_k}
    \label{def_F}
\end{equation}
is a polynomial of $n$th degree, where
\begin{equation\*}
    n:=\max\left(\sum_ka_k,\sum_kb_k\right)
\end{equation\*}
is the larger of the orders of the forward and reverse reactions.
The degree of $F$ may be lower if the high-order term is offset,
but only mathematicians believe in such coincidences.

Since Formula \ref{separated} is to integrate a rational function,
it is easy.

After deriving $s$ as a function of $t$, substitute it into
Formula \ref{back} and then Formula \ref{substitution}.
We can derive
\begin{equation}
\begin{split}
    \left\[X_j\right]=a_j\left(A_j+s\right),\\\
    \left\[Y_j\right]=b_j\left(B_j-s\right)
\end{split}
    \label{result}
\end{equation}
as the answer.

# Properties of $F$

As we all know, here exists a state where the system is in
chemical equilibrium.
Denote the value of $s$ in this case as $q$.
It is easy to figure out that $q$ is a zero of $F\left(s\right)$
on the interval
\begin{equation\*}
    I:=\left(-\min_kA_k,\min_kB_k\right),
\end{equation\*}
which is the range of $s$ such that the concentration of all reactants
are positive.

It is obvious that the value of $q$ is unique.
It is because $F$ is monotonic over $I$ and the signs of its value
at ends of interval $I$ are different.

Note that $q$ is a flaw of $\frac1{F\left(s\right)}$ and that
the improper integral $\int_0^q\frac{\mathrm ds}{F\left(s\right)}$
diverges, so we can imagine how $s$ changes with respect to $t$.
$s=0$ when $t=0$, and then $s$ changes monotonically, and finally
$s\rightarrow q$ when $t\rightarrow+\infty$. Thus, the range of $s$
over $t\in\left\[0,+\infty\right)$ is $\left\[0,q\right)$ for $q>0$
or $\left(q,0\right]$ for $q<0$.
$q=0$ is not considered because only mathematicians
believe in such coincidences.

Suppose $F$ has $n$ different complex zeros $r_\alpha$, one of which
is $q$. The possible existence of multiple roots is ignored because
only mathematicians believe in such coincidences.
Decompose the rational function $\frac1{F\left(s\right)}$ into
several partial fractions, and it can be derived that
\begin{equation}
    \frac1{F\left(s\right)}=\sum_\alpha\frac{C_\alpha}{r_\alpha-s},
    \label{partial_fractions}
\end{equation}
where $C_\alpha$ are undetermined coefficients.

Integrate Formula \ref{partial_fractions},
and then it can be derived that
\begin{equation}
    t=-\sum_\alpha C_\alpha\ln\left(1-\frac s{r_\alpha}\right)
    \label{integrated}
\end{equation}
In most cases, Formula \ref{integrated} cannot be solved analytically
and can only be solved numerically.

Note that if the coefficients $C_\alpha$ are in general commensurable,
Formula \ref{integrated} can be reduced into a rational equation.
However, only mathematicians believe in such coincidences.
However, if $n=2$, it can be proved that the equation can be reduced
into a rational one.

# Example

The closed container that is highly thermally conductive is
in a certain temperature environment,
and the water-gas shift reaction
\begin{equation\*}
    \ce{CO +H2O\rightleftharpoons CO2 +H2}
\end{equation\*}
occurs under the catalysis of a certain catalyst,
where the forward rate constant
\begin{equation\*}
    \mu_1=2.07\times10^{-4}\quad\left(\text{SI}\right),
\end{equation\*}
and the reverse rate constant
\begin{equation\*}
    \mu_2=8.29\times10^{-6}\quad\left(\text{SI}\right).
\end{equation\*}
Initial concentrations are
\begin{split}
    \left\[\ce{CO}\right]_0=10.00\quad\left(\text{SI}\right),\\\
    \left\[\ce{H2O}\right]_0=20.00\quad\left(\text{SI}\right),\\\
    \left\[\ce{CO2}\right]_0=30.00\quad\left(\text{SI}\right),\\\
    \left\[\ce{H2}\right]_0=40.00\quad\left(\text{SI}\right).
\end{split}
Find $\left\[\ce{H2O}\right]$ as a function of time.

Formula \ref{def_F} becomes
\begin{equation\*}
    F\left(s\right):=8.29\times10^{-6}\left(30-s\right)\left(40-s\right)
    -2.07\times10^{-4}\left(10+s\right)\left(20+x\right)
    \quad\left(\text{SI}\right).
\end{equation\*}
It is a polynomial of $2$nd degree.
Its two roots are
\begin{split}
    r_1=-28.65\quad\left(\text{SI}\right),\\\
    r_2=-5.53\quad\left(\text{SI}\right).
\end{split}
Decomposing $\frac1{F\left(s\right)}$ into partial fractions,
we can derive that
\begin{split}
    C_1=-217.654\quad\left(\text{SI}\right),\\\
    C_2=217.654\quad\left(\text{SI}\right).
\end{split}
Thus,
\begin{equation\*}
    t=217.654\ln\left(1-\frac s{-28.65}\right)-
    217.654\ln\left(1-\frac s{-5.53}\right)
    \quad\left(\text{SI}\right).
\end{equation\*}
Since $C_1$ and $C_2$ are in general commensurable,
we can solve the equation analytically into
\begin{equation\*}
    s=\frac{5.53\left(1-1.0046^t\right)}{1.0046^t-0.1929}
    \quad\left(\text{SI}\right).
\end{equation\*}
Use Formula \ref{result}, and then we can find the answer
\begin{equation\*}
    \left\[\ce{H2O}\right]=20+
    \frac{5.53\left(1-1.0046^t\right)}{1.0046^t-0.1929}
    \quad\left(\text{SI}\right).
\end{equation\*}
