---
title: 'Introducing bra--ket notation to math learners'
date: 2023-02-03 15:12:53 -0800
categories:
- math
tags:
- from zhihu
- quantum mechanics
layout: post
excerpt: 'Bra--ket notation is a good-looking notation!
I am sad that it is not generally taught in math courses.
Let me introduce it to you.'
---

*This article is translated from a
Chinese [article](https://zhuanlan.zhihu.com/p/344660674){target="_blank"} on my Zhihu account.
The original article was posted at 2021-01-16 15:52 +0800.*

---

To keep you guys that have read different textbooks from fighting with each other, we say:

- The definition of inner products is opposite in math and physics,
and we take the customary definition in math as the standard:
inner products are linear in the first element and conjugate-linear in the second element.
- Denote Hilbert space by $\mathscr H$.
Denote inner products by $\left(\cdot,\cdot\right)$.
- Denote the dual space of $V$ as $V^*$.
Denote the Hermite adjoint of $\hat T$ as $\hat T^\dagger$.
Denote the complex conjugate of $\alpha$ as $\bar\alpha$.
- Denote the set of all bounded linear operators in $V\to V$ as $\mathcal L(V)$.

---

Riesz representation theorem points out that

$$\forall \left<z\right|\in\mathscr H^*:
\exists!\left|z\right>\in\mathscr H:
\forall\left|x\right>\in\mathscr H:
\left<z\middle|x\right>=\left(\left|x\right>,\left|z\right>\right),$$

which naturally gives a norm-preserving anti-isomorphism of $\mathscr H^*\to\mathscr H$
given by $\left<z\right|\mapsto\left|z\right>$.

(Actually, furthermore, we can study rigged Hilbert spaces,
but it is more complex in terms of mathematics,
and we currently only look at Hilbert spaces.)

**Now, bra--ket notation shows its first good-looking feature: use $\left<\cdot\middle|\cdot\right>$
to represent inner products.**

To generalize inner products,
we define sesquilinear forms on $\mathscr H$ as mappings of $\mathscr H\times\mathscr H\to\mathbb C$,
which is linear in the first element and conjugate-linear in the second element.

We can prove that, for a sequilinear form $\varphi$, if

$$\exists C>0:
\forall\left|x\right>,\left|y\right>\in\mathscr H:
\left|\varphi\!\left(\left|x\right>,\left|y\right>\right)\right|^2\le C\left<x\middle|x\right>\left<y\middle|y\right>$$

(i.e. $\varphi$ is bounded),
then there exists unique $\hat a\in\mathcal L(\mathscr H)$ such that

$$\forall\left|x\right>,\left|y\right>\in\mathscr H:
\left<x\middle|\hat a^\dagger\middle|y\right>=\overline{\left<y\middle|\hat a\middle|x\right>},$$

which is rather good-looking.

**Now, bra--ket notation shows its second good-looking feature: use $\left<\cdot\middle|\cdot\middle|\cdot\right>$
to represent bounded sesquilinear forms.**

Obviously, if a countable set $\left\{\left|e_n\right>\right\}$
is an orthonormal basis of $\mathscr H$
(countability requires $\mathscr H$ to be separable), then

$$\sum_n\left|e_n\right>\left<e_n\right|=\mathrm{id}.$$

Such way of expressing completeness is very good-looking.

If $\hat a\in\mathcal L(\mathscr H)$ has set of eigenvectors
$\left\{\left|e_n\right>\right\}$ (already orthonormalized and countable)
is complete, then we have the spectral decomposition

$$\hat a=\sum_na_n\left|e_n\right>,$$

where $\left\{a_n\right\}$ is the point spectrum of $\hat a$:

$$\hat a\left|e_n\right>=a_n\left|e_n\right>.$$

No wonder why physicists like bra--ket notation.
After all, to write

$$\operatorname{Pr}\!\left(a=a_n\right)=\left|\left<e_n\middle|\psi\right>\right|^2$$

(the probability of getting a result of $a_n$ when measuring
the observable $a$ corrresponding to the self-adjoint operator $\hat a$ with complete set of eigenvectors)
and

$$\operatorname{E}\!\left[a\right]=\left<\psi\middle|\hat a\middle|\psi\right>$$

(the expectation of $a$) is pleasant ($\left|\psi\right>$ is already normalized).

---

For sure, there are many more pleasant things out there.
It is also happy to write the operator into the argument of the exponential function
(because it is like making a very complicated thing look like a very simple thing).

If we assume that the Hamiltonian operator $\hat H$ is a bounded linear operator,
then $-\mathrm i\hat H$ naturally fits the Lipschitz condition,
so the Schrödinger equation

$$\frac{\mathrm d}{\mathrm dt}\left|\psi\right>=-\mathrm i\hat H\left|\psi\right>$$

has a unique solution.
Furthermore, if $\hat H$ does not depend on $t$ explicitly,
then the solution is

$$\left|\psi\right>=\mathrm e^{-\mathrm it\hat H}\left|\psi_0\right>.$$

What is pleasant about writing in this form is
(1) that the form is very simple,
(2) that it naturally motivates us to find energy eigenstates,
and (3) that it naturally makes us find that time evolution is unitary.

(You guys may notice that I ate the reduced Planck constant.
Yes, it is so happy to use natural units.)
