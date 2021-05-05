---
title: Hyperellipsoids in barycentric coordinates
date: 2020-01-25 17:13:57 +08:00
categories:
- math
tags:
- linear algebra
- long paper
layout: post
---

# Some notations

\begin{equation\*}
    S_n:=\left\\{\mathbf a\in\mathbb R^{n}\middle|\sum_ja_j=1\right\\}.
\end{equation\*}
\begin{equation\*}
    \mathbf1:=\left(\begin{matrix}1\\\\\vdots\\\\1\end{matrix}\right).
\end{equation\*}
\begin{equation\*}
    \mathbf v_1:=\left(\begin{matrix}
        \\\\\mathbf v\\\\\\\\1
    \end{matrix}\right).
\end{equation\*}
\begin{equation\*}
    \mathbf M_1:=\left(\begin{matrix}
        \\\\&\mathbf M&\\\\\\\\&\mathbf1^{\mathrm T}
    \end{matrix}\right).
\end{equation\*}

# Introduction to barycentric coordinates

Let $\mathbf v_j$ be the vertices of a simplex in $\mathbb R^{n-1}$,
then any point $\mathbf r\in\mathbb R^{n-1}$
can be expressed by a tuple $\boldsymbol\lambda\in S_n$ such that
$\mathbf r=\sum_j\lambda_j\mathbf v_j$.

If regarding $\mathbf V$ as a $\left(n-1\right)\times n$ matrix
whose $j$th column is $\mathbf v_j$, then we have
$\mathbf r=\mathbf V\boldsymbol\lambda$.

Along with the normalization condition $\sum_j\lambda_j=1$ or
$\mathbf1^{\mathrm T}\boldsymbol\lambda=1$, we have
$\mathbf r_1=\mathbf V_1
\boldsymbol\lambda$,
so
\begin{equation}
    \boldsymbol\lambda=\mathbf V_1^{-1}
    \mathbf r_1.
    \label{as Cartesian}
\end{equation}

Usually, due to the convenience, we select the center of the Cartesian
coordinate system so properly that $\sum_j\mathbf v_j=\mathbf0$ or
\begin{equation}
    \mathbf V\mathbf1=\mathbf0.
    \label{barycenter zero}
\end{equation}

# The research object

We are going to show that the equation
\begin{equation}
    \boldsymbol\lambda^{\mathrm T}\boldsymbol\lambda=1
    \label{research object}
\end{equation}
depicts a hyperellipsoid whose center is $\mathbf0$ and
its tangent hyperplane at $\mathbf v_j$ is parallel to the hyperplane
that passes all $\mathbf v_k$ that $k\ne j$.

# The quadric

We are going to rewrite Formula \ref{research object} in the form of
a quadric of $\mathbf r$.

Substitute Formula \ref{as Cartesian} into \ref{research object}, and
then we can derive that
\begin{equation}
    1=\boldsymbol\lambda^{\mathrm T}\boldsymbol\lambda
    =\left(\mathbf V_1^{-1}
        \mathbf r_1\right)^{\mathrm T}
        \left(\mathbf V_1^{-1}
        \mathbf r_1\right)
    =\mathbf r_1^{\mathrm T}
        \left(\left(\mathbf V_1^{-1}
        \right)^{\mathrm T}\mathbf V_1^{-1}
        \right)\mathbf r_1.
    \label{r quadric}
\end{equation}
Let
\begin{equation}
    \mathbf Q:=\left(\mathbf V_1^{-1}
        \right)^{\mathrm T}\mathbf V_1^{-1}
    =\left(\mathbf V_1
        \mathbf V_1^{\mathrm T}\right)^{-1},
    \label{Q def}
\end{equation}
and substitute Formula \ref{Q def} into \ref{r quadric},
and then we can derive the quadric of $\mathbf r_1$
\begin{equation}
    \mathbf r_1^{\mathrm T}\mathbf Q\mathbf r_1=1.
\end{equation}
Note that besides $\mathbf r$, there is a $1$ in $\mathbf r_1$, so
the quadric is a $2$nd-degree polynomial of $\mathbf r$,
including quadratic terms, linear terms and a constant term.

In order to show that the center of the quadric is a hyperellipsoid
whose center is $\mathbf0$, we need to prove that the coefficients
of the linear terms are all $0$,
and the determinant of the coefficients is positive.

# Proving that the center of the quadric is $\mathbf0$

Note that $\mathbf Q=\left(\mathbf V_1\mathbf V_1^{\mathrm T}\right)^{-1}$,
so
\begin{equation}
    \mathbf Q^{-1}=
    \left(\begin{matrix}
        \\\\&\mathbf V&\\\\\\\\1&\cdots&1
    \end{matrix}\right)
    \left(\begin{matrix}
        &&&1\\\\&\mathbf V^{\mathrm T}&&\vdots\\\\&&&1
    \end{matrix}\right)=
    \left(\begin{matrix}
        \\\\&\mathbf V\mathbf V^{\mathrm T}&&\mathbf V\mathbf1
        \\\\\\\\&\mathbf1^{\mathrm T}\mathbf V^{\mathrm T}&&n
    \end{matrix}\right).
    \label{Q^-1}
\end{equation}
Substitute Formula \ref{barycenter zero} into \ref{Q^-1},
and then we can derive that
\begin{equation\*}
    \mathbf Q=\left(\begin{matrix}
        &&&0\\\\&\mathbf V\mathbf V^{\mathrm T}&&\vdots
        \\\\&&&0\\\\0&\cdots&0&n
    \end{matrix}\right)^{-1}=
    \left(\begin{matrix}
        &&&0\\\\&\mathbf W&&\vdots\\\\&&&0\\\\0&\cdots&0&\frac1n
    \end{matrix}\right),
\end{equation\*}
where $\mathbf W:=\left(\mathbf V\mathbf V^{\mathrm T}\right)^{-1}$,
so
\begin{equation\*}
    \mathbf r_1^{\mathrm T}\mathbf Q\mathbf r_1=
    \mathbf r^{\mathrm T}\mathbf W\mathbf r+\frac1n.
\end{equation\*}
The linear terms are all $0$, so the center of the quadric is $\mathbf0$.

# Proving that the quadric is a hyperellipsoid

We need to show that determinant of the coefficients matrix is positive.

Because $\mathbf Q=
\left(\mathbf V_1^{-1}\right)^{\mathrm T}\mathbf V_1^{-1}$,
we have
\begin{equation\*}
    \left|\mathbf Q\right|=
    \left|\mathbf V_1^{-1}\right|^2>0.
\end{equation\*}

# Proving that the its tangent hyperplane at $\mathbf v_j$ is parallel to $P_j$

Here $P_j$ is defined as the hyperplane that
passes all $\mathbf v_k$ that $k\ne j$.

The equation of the quadric is $F\left(\mathbf r\right)=0$,
where the quadratic function
\begin{equation\*}
    F\left(\mathbf r\right):=\mathbf r^{\mathrm T}\mathbf W\mathbf r
    +\frac1n-1.
\end{equation\*}
According to geometry, the normal vector of the quadric at $\mathbf v_j$
is the gradient of $F$ at $\mathbf v_j$, which is
\begin{equation\*}
    \boldsymbol\nu_j:=
    \left.\frac{\partial F\left(\mathbf r\right)}{\partial\mathbf r}\right|
    _{\mathbf r=\mathbf v_j}=
    2\mathbf W\mathbf v_j.
\end{equation\*}

Now consider the normal vector $\mathbf m_j$ of $P_j$. Assume that
\begin{equation\*}
    P_j:n\mathbf m_j^{\mathrm T}\mathbf r+2=0.
\end{equation\*}
The equation of $P_j$ should holds when $\mathbf r=\mathbf v_k$
for all $k\ne j$, so we can derive $n-1$ linear equations with respect
to $\mathbf m_j$
\begin{equation}
    \forall k\ne j:n\mathbf m_j^{\mathrm T}\mathbf v_k+2=0.
    \label{equations for m}
\end{equation}

If we can show that
\begin{equation}
    \mathbf m_j=\boldsymbol\nu_j=2\mathbf W\mathbf v_j
    \label{solution for m}
\end{equation}
is the solution to Formula \ref{equations for m},
then we can say that the two hyperplane are parallel.
Thus, we need to verify the equations derived from
substituting Formula \ref{solution for m} into \ref{equations for m}
\begin{equation\*}
    \forall k\ne j:n\mathbf v_j^{\mathrm T}\mathbf W\mathbf v_k+1=0,
\end{equation\*}
which is to say that the $n\times n$ matrix
\begin{equation\*}
    \mathbf P:=\mathbf V^{\mathrm T}\mathbf W\mathbf V=\
    \mathbf V^{\mathrm T}\left(\mathbf V\mathbf V^{\mathrm T}\right)^{-1}
    \mathbf V
\end{equation\*}
is such a matrix that all of its components except those on its
diagonal are $-\frac1n$.

According to conclusions in matrix analysis,
if we regard $\mathbf V^{\mathrm T}$ as $n-1$ $n$-dimensional vectors,
then $\mathbf P$ is an orthogonal projection in $\mathbb R^n$ to
the linear subspace whose basis is the $n-1$ vectors.

Note that with Formula \ref{barycenter zero}, we can say that
the subspace is just a hyperplane whose normal vector is $\mathbf1$.
With the conclusion, we can easily write out the form of $\mathbf P$
because we just need to write out one set of its basis $\mathbf B$.
Writing out $\mathbf B$ only requires finding out $n-1$ linearly independent
vectors that are perpendicular to $\mathbf1$.
For example,
\begin{equation\*}
    \mathbf B:=\left(\begin{matrix}
        n-1&-1&-1&\cdots&-1\\\\-1&n-1&-1&\cdots&-1
        \\\\-1&-1&n-1&\cdots&-1\\\\\vdots&\vdots&\vdots&\ddots&\vdots
        \\\\-1&-1&-1&\cdots&n-1\\\\-1&-1&-1&\cdots&-1
    \end{matrix}\right).
\end{equation\*}

Then, we have
\begin{equation\*}
    \mathbf P=\mathbf B\left(\mathbf B^{\mathrm T}\mathbf B\right)^{-1}
    \mathbf B^{\mathrm T}.
\end{equation\*}
After some calculation, we can derive that the components of $\mathbf P$
are $1-\frac1n$ on the diagonal and $-\frac1n$ elsewhere,
which is what we want to show.

We have proved that the tangent hyperplane of the quadric
at $\mathbf v_j$ is parallel to $P_j$.
