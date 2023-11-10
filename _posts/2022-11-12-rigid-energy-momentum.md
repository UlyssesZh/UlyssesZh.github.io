---
title: Kinetic energy, momentum, and angular momentum of rigid bodies
date: 2022-11-12 19:29:40 -0800
categories:
- physics
tags:
- rigid body
- linear algebra
- classical mechanics
- from zhihu
layout: post
excerpt: 'In this article, we will find that the inertia matrix naturally appears
when we calculate the kinetic energy $T$ or the angular momentum $\mathbf M$ of a rigid body.
Then, we introduce the concept of principal inertia $\mathbf J_{\mathrm{pri}}$.
We also study how the inertia matrix changes under translations and rotations
and how those transformations may lead to conclusions that can help us simplify the calculation of inertia matrices.'
---

*This article is translated from a
Chinese [article](https://zhuanlan.zhihu.com/p/89690556){target="_blank"} on my Zhihu account.
The original article was posted at 2019-11-03 20:02 +0800.*

---

Some notations:

- $a$ indexes particles. $j,k,l$ are indices of vector components.
$\mathbf q,\mathbf s,\mathbf t$ are arbitrary vectors.
- $\mathbf I$ is the unit matrix.
Matrix $\mathbf q\otimes\mathbf s\coloneqq\mathbf q\mathbf s^\mathrm T$ is the outer product of $\mathbf q$ and $\mathbf s$,
and $\mathbf q^{\otimes 2}\coloneqq\mathbf q\otimes\mathbf q$.
- A rigid body consists of some particles with distances between each other fixed.
$\mu_a$ is the mass of a particle;
$\mathbf r_a$ is the position of a particle relative to the center of the rigid body
($\sum_a\mu_a\mathbf r_a=\mathbf 0$);
and $\mathbf v_a$ is the velocity of a particle.
- The total mass of the rigid body is $m=\sum_a\mu_a$;
the velocity of its mass center is $\mathbf V$;
and its angular velocity is $\mathbf\Omega$.
$\theta_a$ is the angle between $\mathbf r_a$ and $\mathbf\Omega$.
- $\mathbf m\coloneqq m\mathbf I$, $\mathbf J\coloneqq\sum_a\mu_a\left(\mathbf r_a^2\mathbf I+\mathbf r_a^{\otimes 2}\right)$.

---

Talk about homogeneous scalar fields of degree 2.
Homogeneous scalar fields of degree 2 are function $f$ that satisfies

$$f\!\left(\lambda\mathbf q\right)=\lambda^2f\!\left(\mathbf q\right).$$

It has the form

$$f\!\left(\mathbf q\right)=\frac12\sum_{j,k}A_{j,k}q_jq_k,$$

where the coefficient matrix $\mathbf A$ is a symmetric matrix
(this is why there is a factor of $\frac12$ in front).

Actually, such a function can be written in matrix multiplication as

$$f\!\left(\mathbf q\right)=\frac{\mathbf A}2\mathbf q\cdot\mathbf q$$

(note that it is not the same as $\frac{\mathbf A}2\mathbf q^2$,
but is $\left(\frac{\mathbf A}{2}\mathbf q\right)\cdot\mathbf q$ instead).

Similarly, homogeneous vector field with degree 1 has the property

$$\mathbf g\!\left(\lambda\mathbf q\right)=\lambda\mathbf g\!\left(\mathbf q\right),$$

and they have the form

$$\mathbf g\!\left(\mathbf q\right)=\mathbf A\mathbf q$$

(now the coefficient matrix $\mathbf A$ is not necessarily symmetric).

---

Introduce outer product.
If the matrix $\mathbf A\coloneqq\mathbf q\otimes\mathbf s$, then

$$A_{j,k}=q_js_k.$$

Specially, if $\mathbf A\coloneqq\mathbf q^{\otimes 2}$, then

$$A_{j,k}=q_jq_k.$$

The perfect square expansion of outer product is

$$\left(\mathbf q+\mathbf s\right)^{\otimes 2}=
\mathbf q^{\otimes 2}+\mathbf q\otimes\mathbf s+\mathbf s\otimes\mathbf q+\mathbf s^{\otimes 2}.$$

---

First, according to geometric relations, we can prove a theorem

$$\mathbf v_a=\mathbf V+\mathbf\Omega\times\mathbf r_a.$$

Then, we can discuss the kinetic energy

$$T\coloneqq\sum_a\frac{\mu_a}2\mathbf v_a^2$$

of the rigid body.
We will discover that the kinetic energy of the rigid body can be represented as
the sum of a homogeneous function of degree 2 w.r.t. $\mathbf V$
and a homogeneous function of degree 2 w.r.t. $\mathbf\Omega$,
i.e.

$$T=T_{\mathrm{tra}}+T_{\mathrm{rot}},$$

where

$$T_{\mathrm{tra}}\coloneqq\frac{\mathbf m}2\mathbf V\cdot\mathbf V,$$

$$T_{\mathrm{rot}}\coloneqq\frac{\mathbf J}2\mathbf\Omega\cdot\mathbf\Omega.$$

The proof is not difficult:

$$\begin{align*}
T&\coloneqq\sum_a\frac{\mu_a}2\mathbf v_a^2\\
&=\sum_a\frac{\mu_a}2\left(\mathbf V+\mathbf\Omega\times\mathbf r_a\right)^2\\
&=\sum_a\frac{\mu_a}2\left(
	\mathbf V^2+2\mathbf V\cdot\left(\mathbf\Omega\times\mathbf r_a\right)
	+\left(\mathbf\Omega\times\mathbf r_a\right)^2
\right)\\
&=\frac12\mathbf V^2\underbrace{\sum_a\mu_a}_m
+\mathbf V\cdot\left(\mathbf\Omega\times\underbrace{\sum_a\mu_a\mathbf r_a}_{\mathbf 0}\right)
+\frac12\sum_a\mu_a\left(\mathbf\Omega\times\mathbf r_a\right)^2\\
&=T_{\mathrm{tra}}+\frac12\sum_a\mu_a\left(\mathbf\Omega\times\mathbf r_a\right)^2,
\end{align*}$$

while

$$\begin{align*}
&\phantom{=}~\,\left(\mathbf\Omega\times\mathbf r_a\right)^2\\
&=\mathbf\Omega^2\mathbf r_a^2\sin^2\theta_a\\
&=\mathbf\Omega^2\mathbf r_a^2-\mathbf\Omega^2\mathbf r_a^2\cos^2\theta_a\\
&=\mathbf\Omega^2\mathbf r_a^2-\left(\mathbf\Omega\cdot\mathbf r_a\right)^2\\
&=\left(\sum_jr_{a,j}^2\right)\left(\sum_j\Omega_j^2\right)
-\left(\sum_jr_{a,j}\Omega_j\right)\left(\sum_jr_{a,j}\Omega_j\right)\\
&=\sum_{j,l}r_{a,l}^2\Omega_j^2-\sum_{j,k}r_{a,j}r_{a,k}\Omega_j\Omega_k\\
&=\sum_{j,l}r_{a,l}^2\Omega_j\sum_kI_{j,k}\Omega_k
-\sum_{j,k}r_{a,j}r_{a,k}\Omega_j\Omega_k\\
&=\sum_{j,k}\underbrace{\left(\sum_{l}r_{a,l}^2\right)}_{\mathbf r_a^2}
I_{j,k}\Omega_j\Omega_k
-\sum_{j,k}r_{a,j}r_{a,k}\Omega_j\Omega_k\\
&=\sum_{j,k}\left(\mathbf r_a^2I_{j,k}-r_{a,j}r_{a,k}\right)\Omega_j\Omega_k\\
&=\left(\mathbf r_a^2\mathbf I-\mathbf r_a^{\otimes2}\right)\mathbf\Omega\cdot\mathbf\Omega.
\end{align*}$$

Therefore,

$$\begin{align*}
T&=T_{\mathrm{tra}}+\frac12\sum_a\mu_a\left(\mathbf r_a^2\mathbf I-\mathbf r_a^{\otimes2}\right)\mathbf\Omega\cdot\mathbf\Omega\\
&=T_{\mathrm{tra}}+T_{\mathrm{rot}}.
\end{align*}$$

Then, we may discuss the momentum of the rigid body

$$\mathbf P\coloneqq\sum_a\mu_a\mathbf v_a.$$

We will discover that it is a homogeneous function of degree 1 w.r.t. $\mathbf V$,
i.e.

$$\mathbf P=\mathbf m\mathbf V.$$

The proof is easier:

$$\begin{align*}
\mathbf P&\coloneqq\sum_a\mu_a\mathbf v_a\\
&=\sum_a\mu_a\left(\mathbf V+\mathbf\Omega\times\mathbf r_a\right)\\
&=\underbrace{\left(\sum_a\mu_a\right)}_m\mathbf V
+\mathbf\Omega\times\underbrace{\sum_a\mu_a\mathbf r_a}_{\mathbf 0}\\
&=\mathbf m\mathbf V.
\end{align*}$$

Finally, we can discuss the angular momentum of the rigid body

$$\mathbf M\coloneqq\sum_a\mathbf r_a\times\left(\mu_a\mathbf v_a\right).$$

We will discover that it is a homogeneous function of degree 1 w.r.t. $\mathbf\Omega$,
i.e.

$$\mathbf M=\mathbf J\mathbf\Omega.$$

The proof is also easy:

$$\begin{align*}
\mathbf M&\coloneqq\sum_a\mathbf r_a\times\left(\mu_a\mathbf v_a\right)\\
&=\sum_a\mu_a\mathbf r_a\times\left(\mathbf V+\mathbf\Omega\times\mathbf r_a\right)\\
&=\underbrace{\left(\sum_a\mu_a\mathbf r_a\right)}_{\mathbf 0}\times\mathbf V
+\sum_a\mu_a\mathbf r_a\times\left(\mathbf\Omega\times\mathbf r_a\right)\\
&=\sum_a\mu_a\left(\mathbf r_a^2\mathbf\Omega-\mathbf r_a\cdot\mathbf\Omega\mathbf r_a\right)
\end{align*}$$

(note the order of computation in the notation $\mathbf q\cdot\mathbf s\mathbf t$:
it is $\left(\mathbf q\cdot\mathbf s\right)\mathbf t$).
Therefore,

$$\begin{align*}
M_j&=\sum_a\mu_a\mathbf r_a^2\underbrace{\Omega_j}_{\sum_kI_{j,k}\Omega_k}
-\sum_a\mu_a\left(\sum_kr_{a,k}\Omega_k\right)r_{a,k}\\
&=\sum_a\mu_a\sum_k\left(\mathbf r_a^2I_{j,k}-r_{a,j}r_{a,k}\right)\Omega_k\\
&=\sum_k\sum_a\mu_a\left(\mathbf r_a^2I_{j,k}-r_{a,j}r_{a,k}\right)\Omega_k\\
&=\sum_kJ_{j,k}\Omega_k,
\end{align*}$$

i.e.

$$\mathbf M=\mathbf J\mathbf\Omega.$$

We discover that, it seems that the kinetic energy is the sum of "translational kinetic energy" and "rotational kinetic energy",
while the momentum only contains "translational momentum",
and the angular momentum only contains "rotational angular momentum".

---

We may discover that $\mathbf J$ seems to represent some inertia related to rotation of the rigid body,
so we call it the inertia matrix (or, in tensor language, the inertia tensor).
By this means we introduced an important physical quantity.
Now we study some of its properties.

Note that $\mathbf J$ is a real symmetric matrix,
so it has real eigenvaluese $\mathbf J_{\mathrm{pri}}$
(this is a vector containing all the eigenvalues as its components),
and its (normalized) eigenvectors $\mathbf e_{\mathrm{pri}}$
(this is a matrix, with its columns being the eigenvectors) orthogonal to each other.
These eigenvalues are called the principal moments of inertia,
and the axes parallel to the eigenvectors and passing through the center of mass are called the principal axes of inertia.

$\mathbf J$ is diagonalizable, i.e.

$$\mathbf e_{\mathrm{pri}}^{-1}\mathbf J\mathbf e_{\mathrm{pri}}
=\operatorname{\mathbf{diag}}\mathbf J_{\mathrm{pri}}.$$

Because the eigenvectors of $\mathbf J$ are orthogonal to each other,
the matrix $\mathbf e_{\mathrm{pri}}$ is an orthogonal matrix, i.e.

$$\mathbf e_{\mathrm{pri}}^{\mathrm T}=\mathbf e_{\mathrm{pri},j},$$

so

$$\begin{align*}
\mathbf q_{\mathrm{pri}}&=\left(\mathbf q^\mathrm T\mathbf e_{\mathrm{pri}}\right)^\mathrm T\\
&=\mathbf e_{\mathrm{pri}}^\mathrm T\mathbf q\\
&=\mathbf e_{\mathrm{pri}}^{-1}\mathbf q,
\end{align*}$$

i.e.

$$\mathbf e_{\mathrm{pri}}\mathbf q_{\mathrm{pri}}=\mathbf q.$$

We may find that

$$\begin{align*}
\mathbf M&=\mathbf J\mathbf\Omega\\
&=\left(\mathbf e_{\mathrm{pri}}\mathbf e_{\mathrm{pri}}^{-1}\right)\mathbf J
\left(\mathbf e_{\mathrm{pri}}\mathbf e_{\mathrm{pri}}^{-1}\right)\mathbf\Omega\\
&=\mathbf e_{\mathrm{pri}}\left(\mathbf e_{\mathrm{pri}}^{-1}\mathbf J\mathbf e_{\mathrm{pri}}\right)
\left(\mathbf e_{\mathrm{pri}}^{-1}\mathbf\Omega\right)\\
&=\mathbf e_{\mathrm{pri}}\left(\operatorname{\mathbf{diag}}\mathbf J_{\mathrm{pri}}\right)\mathbf\Omega_{\mathrm{pri}}.
\end{align*}$$

On the other hand, we have

$$\mathbf M=\mathbf e_{\mathrm{pri}}\mathbf M_{\mathrm{pri}},$$

so

$$\mathbf M_{\mathrm{pri}}=\left(\operatorname{\mathbf{diag}}\mathbf J_{\mathrm{pri}}\right)\mathbf\Omega_{\mathrm{pri}},$$

i.e.

$$M_{\mathrm{pri},j}=\mathbf J_{\mathrm{pri},j}\Omega_{\mathrm{pri},j}.$$

This means that the component of the angular momentum along some certain principal axis of inertia
is the product of the principal inertia along this axis and the component of the angular velocity along this axis.
This can simplify the calculation of the angular momentum a lot
when the principal inertia can be calculated.

Now, we may study the rotational kinetic energy

$$\begin{align*}
T_{\mathrm{rot}}&\coloneqq\frac{\mathbf J}2\mathbf\Omega\cdot\mathbf\Omega\\
&=\frac12\mathbf M\cdot\mathbf\Omega\\
&=\frac12\mathbf M\cdot\mathbf\Omega\\
&=\frac12\mathbf e_{\mathrm{pri}}\left(\operatorname{\mathbf{diag}}\mathbf J_{\mathrm{pri}}\right)
\mathbf\Omega_{\mathrm{pri}}\cdot\mathbf\Omega\\
&=\frac12\left(\operatorname{\mathbf{diag}}\mathbf J_{\mathrm{pri}}\right)
\left(\mathbf e_{\mathrm{pri}}\mathbf\Omega\right)\cdot\mathbf\Omega_{\mathrm{pri}}\\
&=\frac12\left(\operatorname{\mathbf{diag}}\mathbf J_{\mathrm{pri}}\right)
\mathbf\Omega_{\mathrm{pri}}\cdot\mathbf\Omega_{\mathrm{pri}}\\
&=\frac12\sum_jJ_{\mathrm{pri},j}\Omega_{\mathrm{pri},j}^2.
\end{align*}$$

This also makes the calculation simplified when the principal inertia can be calculated.

---

Study how $\mathbf J$ will change if $\mathbf r_a$ experience some transformations.

First, consider translation.
Let

$$\mathbf r_a'\coloneqq\mathbf r_a+\mathbf d,$$

$$\mathbf J'\coloneqq\sum_a\mu_a\left(\mathbf r_a'^2\mathbf I-\mathbf r_a'^{\otimes2}\right)$$

(we may regard $\mathbf J'$ as the inertia matrix of the rigid body w.r.t. the point with $\mathbf d$ distance away from the center of mass,
but not (in usual cases) w.r.t. the center of mass),
and then we will discover that $\mathbf J$ can be calculated from $\mathbf J'$ by

$$\mathbf J=\mathbf J'-m\left(\mathbf d^2\mathbf I-\mathbf d^{\otimes2}\right).$$

This provides us a useful way to calculate $\mathbf J$ when $\mathbf J'$ is easy to calculate while $\mathbf J$ is not.

The proof is not difficult:

$$\begin{align*}
\mathbf J'&\coloneqq\sum_a\mu_a\left(\mathbf r_a'^2\mathbf I-\mathbf r_a'^{\otimes2}\right)\\
&=\sum_a\mu_a\left(\left(\mathbf r_a+\mathbf d\right)^2\mathbf I-\left(\mathbf r_a+\mathbf d\right)^{\otimes2}\right)\\
&=\sum_a\mu_a\left(\left(\mathbf r_a^2+2\mathbf r_a\cdot\mathbf d+\mathbf d^2\right)\mathbf I
-\left(\mathbf r_a^{\otimes2}+\mathbf d\otimes\mathbf r_a+\mathbf r_a\otimes\mathbf d+\mathbf d^{\otimes 2}\right)\right)\\
&=\underbrace{\sum_a\mu_a\left(\mathbf r_a^2\mathbf I-\mathbf r_a^{\otimes2}\right)}_\mathbf J
+\underbrace{\left(\sum_a\mu_a\right)}_m\left(\mathbf d^2\mathbf I-\mathbf d^{\otimes2}\right)
+\sum_a\mu_a\left(2\mathbf r_a\cdot\mathbf d\mathbf I-\mathbf d\otimes\mathbf r_a-\mathbf r_a\otimes\mathbf d\right)\\
&=\mathbf J+m\left(\mathbf d^2\mathbf I-\mathbf d^{\otimes2}\right)
+2\underbrace{\left(\sum_a\mu_a\mathbf r_a\right)}_\mathbf 0\cdot\mathbf d\mathbf I
-\mathbf d\otimes\underbrace{\left(\sum_a\mu_a\mathbf r_a\right)}_\mathbf 0
-\underbrace{\left(\sum_a\mu_a\mathbf r_a\right)}_\mathbf 0\otimes\mathbf d\\
&=\mathbf J+m\left(\mathbf d^2\mathbf I-\mathbf d^{\otimes2}\right),
\end{align*}$$

i.e.

$$\mathbf J=\mathbf J'-m\left(\mathbf d^2\mathbf I-\mathbf d^{\otimes2}\right).$$

The special case of it is called the parallel axis theorem in general physics.

Now, consider rotation.
Suppose the rotational matrix $\mathbf R$ represents the rotation around the unit vector $\mathbf u$.
Let

$$\mathbf r_a'\coloneqq\mathbf R\mathbf r_a,$$

$$\mathbf J'\coloneqq\sum_a\mu_a\left(\mathbf r_a'^2\mathbf I-\mathbf r_a'^{\otimes2}\right),$$

and we will discover

$$\mathbf J'=\mathbf R\mathbf J\mathbf R^{-1}.$$

Now we will prove the conclusion. First, we now that $\mathbf R$ is an orthogonal matrix, i.e.

$$\mathbf R^\mathrm T=\mathbf R^{-1}.$$

By this we can get other properties like

$$\left(\mathbf R\mathbf q\right)^2=\mathbf q^2,$$

$$\left(\mathbf R\mathbf q\right)^{\otimes2}=\mathbf R\mathbf q^{\otimes2}\mathbf R^{-1}.$$

Therefore,

$$\begin{align*}
\mathbf J'&\coloneqq\sum_a\mu_a\left(\mathbf r_a'^2\mathbf I-\mathbf r_a'^{\otimes2}\right)\\
&=\sum_a\mu_a\left(\mathbf r_a^2\mathbf I-\mathbf R\mathbf r_a^{\otimes2}\mathbf R^{-1}\right)\\
&=\mathbf R\left(\sum_a\mu_a\left(\mathbf r_a^2\mathbf I-\mathbf r_a^{\otimes2}\right)\right)\mathbf R^{-1}\\
&=\mathbf R\mathbf J\mathbf R^{-1}.
\end{align*}$$

After getting this conclusion, we may be interested in non trivial (i.e. $\mathbf R\ne\mathbf I$) cases of $\mathbf J'=\mathbf J$.
We will prove that in this case $\mathbf u$ is a principal axis of the rigid body.

By $\mathbf J'=\mathbf R\mathbf J\mathbf R^{-1}$, we can get

$$\mathbf J=\mathbf R\mathbf J\mathbf R^{-1},$$

i.e.

$$\mathbf R\mathbf J=\mathbf J\mathbf R.$$

Multiply $\mathbf u$ on both sides, and we have

$$\mathbf R\mathbf J\mathbf u=\mathbf J\mathbf R\mathbf u,$$

i.e.

$$\mathbf R\left(\mathbf J\mathbf u\right)=\mathbf J\left(\mathbf R\mathbf u\right).$$

By Euler's rotation theorem,
the only real eigenvalue of nontrivial $\mathbf R$ is $1$,
and its corresponding eigenvector is $\mathbf u$, i.e.

$$\mathbf R\mathbf u=\mathbf u.$$

Substitute, and we have

$$\mathbf R\left(\mathbf J\mathbf u\right)=\mathbf J\mathbf u,$$

i.e. $\mathbf J\mathbf u$ is an eigenvector of $\mathbf R$.

Because the only independent (real) eigenvector of notrial $\mathbf R$ is $\mathbf u$,
$\mathbf J\mathbf u$ is parallel to $\mathbf u$,
so $\mathbf u$ is an eigenvector of $\mathbf J$,
i.e. $\mathbf u$ is a principal axis of the rigid body.

This leads to an important conclusion:
if the rigid body maintains its original inertia matrix
after it rotates around an axis passing its center of mass by a nontrivial angle (an angle that is not a multiple of $2\pi$),
then this axis is a principal axis of the rigid body.

By this we can also get another important conclusion:
if a rigid body is rotational symmetric around some axis,
then this axis is a principal axis of the rigid body.
This conclusion simplifies the determination of principal axes of a rigid body with some symmetries.
