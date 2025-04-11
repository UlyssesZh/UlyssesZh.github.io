---
title: Eigenfunctions of the Laplacian on an annulus with homogeneous Neumann boundary condition
date: 2025-04-11 00:40:49 -0700
categories:
- math
tags:
- mathematical physics
- pde
- ode
- long paper
layout: post
excerpt: 'Several features of the eigenfunctions of the Laplacian
on an annulus with homogeneous Neumann boundary condition are discussed.
The distribution of the eigenvalues is discussed in detail,
making use of a phase angle function called $\tht$.
The limiting cases of a disk and a circle are discussed.'
---

## The problem and the solution

Suppose there is an annulus defined by the region $\set{\p{\rho,\vphi}}{R_\mrm{in}<\rho<R_\mrm{out}}$.
What are the functions $\Phi$ defined on this region that satisfy
$$\lmd\Phi=\nabla^2\Phi=\fr1\rho\partial_\rho\p{\rho\partial_\rho\Phi}+\fr1{\rho^2}\partial_\vphi^2\Phi$$
and the boundary conditions
$$\partial_\rho\fc\Phi{\rho=R_\mrm{in},\vphi}=\partial_\rho\fc\Phi{\rho=R_\mrm{out},\vphi}=0,$$
i.e., eigenfunctions of the Laplacian on the annulus with homogeneous Neumann boundary conditions?

For any boundary condition with azimuthal symmetry,
an easy separation of variable gives you solutions of the general form
$$\fc\Phi{\rho,\vphi}=\p{\Xi^{\p J}\fc{J_m}{z\rho/R_\mrm{out}}+\Xi^{\p Y}\fc{Y_m}{z\rho/R_\mrm{out}}}\e^{\i m\vphi},$$
where $\Xi^{\p J}$, $\Xi^{\p Y}$, and $z$ are constants fixed by the boundary conditions, and $m$ is an integer and the azimuthal quantum number.
The functions $J_m$ and $Y_m$ are Bessel functions of the first and second kind, respectively,
which are two linearly independent solutions of the Bessel equation
$$z^2\fc{y''}z+z\fc{y'}z+\p{z^2-m^2}\fc{y}z=0$$ {#eq:bessel-equation}
with some particular normalization.
Plugging the general form into the boundary condition, and we have
$$\Xi^{\p J}\fc{J_m'}{z}+\Xi^{\p Y}\fc{Y_m'}{z}=0,\quad
\Xi^{\p J}\fc{J_m'}{rz}+\Xi^{\p Y}\fc{Y_m'}{rz}=0,$$
where $r\ceq R_\mrm{in}/R_\mrm{out}$.
This is regarded as a homogeneous linear system of equations for $\Xi^{\p J}$ and $\Xi^{\p Y}$.
In order for it to have nontrivial solutions, the determinant of the coefficient matrix must vanish, which gives
$$\fc gz\ceq\fc{J_m'}{rz}\fc{Y_m'}z-\fc{Y_m'}{rz}\fc{J_m'}z=0.$$ {#eq:g}
We can then assign a radial quantum number $n$ to the eigenfunctions by
making the value of $z$ the $n$th root of $g$, which we may casually call $z_{mn}$.

We then have the final solution (up to normalization)
$$\fc{\Phi_{mn}}{\rho,\vphi}=\p{\fc{Y_m'}{z_{mn}}\fc{J_m}{z_{mn}\rho/R_\mrm{out}}
-\fc{J_m'}{z_{mn}}\fc{Y_m}{z_{mn}\rho/R_\mrm{out}}}\e^{\i m\vphi},$$
where $m$ is the azimuthal quantum number, and $n$ is the radial quantum number,
and $z_{mn}$ is defined as the $n$th root of the function $g$.
The eigenvalue is $\lmd_{mn}=-z_{mn}^2/R_\mrm{out}^2$.
In order for the eigenfunctions to be complete, we need to allow $m$ to be any integer,
but we will restrict ourselves to non-negative $m$ in the rest of the article
because the negative ones are practically the same as the positive ones.

## Distribution of eigenvalues

From the well-known asymptotic form of the Bessel functions ([source](https://dlmf.nist.gov/10.7#E8))
$$\fc{J_m}{z\to\infty}=\sqrt{\fr2{\pi z}}\fc\cos{z-\fr{m\pi}2-\fr\pi4},\quad
\fc{Y_m}{z\to\infty}=\sqrt{\fr2{\pi z}}\fc\sin{z-\fr{m\pi}2-\fr\pi4},$$
we can easily conclude that the asymptotic form of $g$ is
$$\fc g{z\to\infty}=\fr{2\fc\sin{\p{1-r}z}}{\pi\sqrt r\,z}.$$
This inspires us to define a function in companion with $g$ as
$$\fc fz\ceq\fc{J_m'}{rz}\fc{J_m'}z+\fc{Y_m'}{rz}\fc{Y_m'}z,$$ {#eq:f}
which will have the asymptotic form
$$\fc f{z\to\infty}=\fr{2\fc\cos{\p{1-r}z}}{\pi\sqrt r\,z}.$$
Therefore, $f\sim\cos\fc\tht z$ and $g\sim\sin\fc\tht z$
are like the cosine and sine pair of oscillatory functions,
with a phase angle $\fc\tht{z\to\infty}=\p{1-r}z$
asymptotically directly proportional to $z$.

Here is a plot that shows how $\tht$ behaves:

![Plot of $\fc\tht z$ and $\p{1-r}z$ for $m=4$, $r=1/3$]({{page.figure}}theta-asymptotic.svg){.dark-adaptive}

<p class="no-indent">
The blue line is $\fc\arctan{\fc gz/\fc fz}$,
and the orange line is $\arctan\fc\tan{\p{1-r}z}$.
we can see that the two functions are asymptotically equal.
</p>

A good thing about this description is that we can now see that $z_{mn}$
as a root of $g$ is just the solution to the equation $\fc\tht z=n\pi$.
In other words, $z_{mn}$ are just the points at which the blue line crosses the horizontal axis
in the plot above.
Therefore, if we can find the inverse function $\fc z\tht$
(maybe in a series expansion), we can directly get $z_{mn}=\fc z{n\pi}$.
We can see from the plot that $\fc z\tht=\tht/\p{1-r}$ is probably not a good enough approximation.
Therefore, we would like to seek higher order terms.

### Kummer's equation

For this part, we employ a method similar to
a [paper](https://www.math.toronto.edu/bremer/papers/bessel2.pdf) by Bremer.

First, for a general homogeneous second-order linear ODE in the form
$y''+2\chi y'+\psi y=0$,
where $\chi$ and $\psi$ are known functions of $z$,
we can define
$$y_\mrm n\ceq py,\quad p\ceq C\exp\int\chi\,\d z,
\quad q\ceq p\psi-p'',$$
and the ODE will become a normal form
$y_\mrm n''+qy_\mrm n=0$.
Therefore, for any second-order linear ODE, we only need to consider those
without the first-derivative term.

Then, one can prove that, for the ODE $y''+qy=0$,
its two linearly independent solutions can be expressed as
$$u=\fr{\cos\alp}{\sqrt{\alp'}},\quad v=\fr{\sin\alp}{\sqrt{\alp'}},$$ {#eq:kummer-solutions}
where $\alp$ satisfy Kummer's equation
$$\alp^{\prime2}+\fr{\alp'''}{2\alp'}-\fr{3\alp^{\prime\prime2}}{4\alp^{\prime2}}=q.$$ {#eq:kummer}
This may seem like converting a problem to a more complicated one,
but the advantage is that $\alp$ is not oscillatory while $u$ and $v$ are oscillatory,
which means that it would be easier to expand $\alp$ as a series for large $z$.
Notice that $\alp'=1/\p{u^2+v^2}$, which provides a means of finding $\alp$
if the solutions of the original ODE are known.

<details><summary>Derivation</summary>

For the ODE $y''+qy=0$,
substitute the trial solution $y=\e^{\alp+\i\beta}$,
where $\alp,\beta$ are real functions of $z$.
We can derive the following equations:
$$\alp''+2\alp'\beta'=0,\quad
\beta''+\beta^{\prime2}-\alp^{\prime2}+q=0.$$
The first equation gives $\beta=-\ln\alp'/2$,
which we can substitute into the second equation to get Equation [@eq:kummer].
On the other hand, the real and imaginary parts of the trial solution gives us
Equation [@eq:kummer-solutions].
Technically speaking, it can be called the real and imaginary parts
only if $\alp'>0$, but they are still solutions to the ODE.

Another way to prove Kummer's equation is just substituting
$\alp'=1/\p{u^2+v^2}$ and check that it satisfies Kummer's equation
if $u$ and $v$ satisfy the ODE and have Wronkskian equal to $1$.

</details>

Now, we can try to apply this to $J_m'$ and $Y_m'$.
First, we need to find the second-order ODE that those two functions satisfy.
We already know that $J_m$ and $Y_m$ are solutions to Equation [@eq:bessel-equation],
so it would be straightforward to derive that $J_m'$ and $Y_m'$ satisfy
$$\fc{y''}z+\fr1z\fr{z^2-3m^2}{z^2-m^2}\fc{y'}z
+\p{1-\fr{m^2+1}{z^2}-\fr{2m^2}{z^2-m^2}}\fc yz=0.$$
To reduce this into the normal form without the first-derivative term,
define
$$\fc pz\ceq\sqrt{\fr\pi2}\fr{z^{3/2}}{\sqrt{z^2-m^2}},\quad
\fc qz\ceq1-\fr{4m^2-1}{4z^2}-\fr{2m^2+z^2}{\p{m^2-z^2}^2},$$ {#eq:p-and-q}
and we have $\fc pz\fc{J_m'}z$ and $\fc pz\fc {Y_m'}z$ satisfy $\fc{y''}z+\fc qz\fc yz=0$.
Equation [@eq:kummer-solutions] then gives
$$\fc{Y_m'}z=\fr{\cos\fc\alp z}{\fc pz\sqrt{\fc{\alp'}z}},\quad
-\fc{J_m'}z=\fr{\sin\fc\alp z}{\fc pz\sqrt{\fc{\alp'}z}}$$ {#eq:bessel-as-kummer-solutions}
(the normalization of $p$ and the initial value of $\alp$
are chosen to make sure they are correct).
You may worry that $\fc p{z<m}$ is imaginary, but $\fc{\alp'}z$ will be negative in that region
so that everything works out and is real in the end.
Substitute Equation [@eq:bessel-as-kummer-solutions] into Equation [@eq:f] and [@eq:g], and we have
$$\fc fz=\fr{\cos\fc\tht z}{\fc p{rz}\fc pz\sqrt{\fc{\alp'}{rz}\fc{\alp'}z}},\quad
\fc gz=\fr{\sin\fc\tht z}{\fc p{rz}\fc pz\sqrt{\fc{\alp'}{rz}\fc{\alp'}z}},$$
where $\fc\tht z\ceq\fc\alp z-\fc\alp{rz}$.
By this, we have a workable expression for $\fc\tht z$
so that we now just need to turn our attention to $\fc\alp z$.

We can substitute $\fc qz$ in Equation [@eq:p-and-q] into Equation [@eq:kummer]
and expand on both sides as a series of $z$ at infinity and solve for the series coefficients to get
$$\fc{\alp'}z=1+\fr{-4m^2-3}{8z^2}+\fr{-16m^4-184m^2+63}{128z^4}+\cdots,$$ {#eq:alpha-prime-few-terms}
which has a certain convergence radius which is not important at this stage.

### Asymptotic expansion

Here we will work out another way of expanding $\fc\alp z$ as a series
based on properties of the Bessel functions.
From Equation [@eq:bessel-as-kummer-solutions], we have
$$\fr1{\fc{\alp'}z}=\fc pz^2\p{\fc{J_m'}z^2+\fc{Y_m'}z^2}.$$
If we were working with $\fc{J_m}z^2+\fc{Y_m}z^2$ instead,
we would be able to employ the handy Nicholson's integral,
but the same method cannot be applied here.

<details><summary>Why it does not work</summary>

Nicholson's integral is
$$\fc{J_m}z^2+\fc{Y_m}z^2=\fr8{\pi^2}\int_0^\infty\fc\cosh{2mt}\fc{K_0}{2z\sinh t}\d t,$$
where $K_0$ is the modified Bessel function.
A derivation is given in Section 13.73 of
Watson's <cite>A Treatise on the Theory of Bessel Functions</cite>.

To apply this to $\fc{J_m'}z^2+\fc{Y_m'}z^2$,
we need to use ([source](https://dlmf.nist.gov/10.6#E1))
$$\fc{J_m'}z=\fr12\p{\fc{J_{m-1}}z-\fc{J_{m+1}}z},\quad
\fc{Y_m'}z=\fr12\p{\fc{Y_{m-1}}z-\fc{Y_{m+1}}z}.$$
Then, we just need to work out the cross terms
$\fc{J_{m-1}}z\fc{J_{m+1}}z+\fc{Y_{m-1}}z\fc{Y_{m+1}}z$.
By the same method of deriving Nicholson's integral,
we can get
$$\begin{align*}
&\phantom{={}}\fc{J_{m_1}}z\fc{J_{m_2}}z+\fc{Y_{m_1}}z\fc{Y_{m_2}}z\\
&=\fr4{\pi^2}\int_0^\infty\p{\e^{\p{m_1+m_2}t}\fc\cos{\p{m_1-m_2}\pi}
+\e^{-\p{m_1+m_2}t}}\fc{K_{m_2-m_1}}{2z\sinh t}\d t,
\end{align*}$$
which is a more general version of Nicholson's integral.
However, this formula is only valid for $\v{\fc\Re{m_1-m_2}}<1$
because otherwise the integral diverges near $t=0$,
while we need $m_2-m_1=2$.

One can also try to employ the same method of deriving Nicholson's integral directly on
$\fc{J_m'}z^2+\fc{Y_m'}z^2$,
but it will turn out to have the same divergence problem.
Briefly speaking, there is a term that is an infinitesimal quantity times
the integral of $\partial_\mu^2\fc{K_\mu}{2z\sinh t}$,
which can only be thrown away without any problem if $\v{\Re\mu}<1$,
which is not the case here.

</details>

<p class="no-indent">
We can, however, use the asymptotic expansion of the Bessel functions directly ([source](https://dlmf.nist.gov/10.17#E9)):
$$\begin{align*}
\fc{Y_m'}z&=\sqrt{\fr2{\pi z}}\p{\fc\cos{z-\fr{m\pi}2-\fr\pi4}
\sum_{k=0}^\infty\fr{\p{-1}^kc_{2k}}{z^{2k}}
-\fc\sin{z-\fr{m\pi}2-\fr\pi4}\sum_{k=0}^\infty\fr{\p{-1}^kc_{2k+1}}{z^{2k+1}}},\\
-\fc{J_m'}z&=\sqrt{\fr2{\pi z}}\p{\fc\cos{z-\fr{m\pi}2-\fr\pi4}
\sum_{k=0}^\infty\fr{\p{-1}^kc_{2k+1}}{z^{2k+1}}
+\fc\sin{z-\fr{m\pi}2-\fr\pi4}\sum_{k=0}^\infty\fr{\p{-1}^kc_{2k}}{z^{2k}}},
\end{align*}$$
where
$$c_k\ceq a_k+\p{k-\fr12}a_{k-1},\quad
a_k\ceq\p{-1}^k\fr{\p{1/2-m}^{\overline k}\p{1/2+m}^{\overline k}}{2^kk!},$$
where the raising factorial notation is used.
By combining them, we get
$$\fc{J_m'}z^2+\fc{Y_m'}z^2=\fr2\pi\sum_{k=0}^\infty\fr{r_k}{z^{2k+1}},\quad
r_k\ceq\p{-1}^k\sum_{l=0}^{2k}\p{-1}^lc_lc_{2k-l}.$$
</p>

<details><summary>Derivation</summary>

First, expand the squares, and the cross terms will cancel, and we have
$$\fr{\pi z}2\p{\fc{J_m'}z^2+\fc{Y_m'}z^2}=
\p{\sum_k\p{-1}^k\fr{c_{2k}}{z^{2k}}}^2
+\p{\sum_k\p{-1}^k\fr{c_{2k+1}}{z^{2k+1}}}^2.$$
For the first term, combine a $1/z^{2l}$ and a $1/z^{2\p{k-l}}$ to get a $1/z^{2k}$,
so that we can resum it as
$$\p{\sum_k\p{-1}^k\fr{c_{2k}}{z^{2k}}}^2
=\sum_{k=0}^\infty\fr1{z^{2k}}\sum_{l=0}^k\p{-1}^lc_{2l}\p{-1}^{k-l}c_{2k-2l}.$$
Similarly, for the other term, combine a $1/z^{2l-1}$ and a $1/z^{2\p{k-l}+1}$ to get a $1/z^{2k}$,
so that we can resum it as
$$\p{\sum_k\p{-1}^k\fr{c_{2k+1}}{z^{2k+1}}}^2
=\sum_{k=0}^\infty\fr1{z^{2k}}\sum_{l=1}^k\p{-1}^{l-1}c_{2l-1}\p{-1}^{k-l}c_{2k-2l+1}.$$
Combine to get
$$\begin{align*}
\fr{\pi z}2\p{\fc{J_m'}z^2+\fc{Y_m'}z^2}&=
\sum_{k=0}^\infty\fr1{z^{2k}}
\p{\sum_{l=0}^k\p{-1}^kc_{2l}c_{2k-2l}
+\sum_{l=1}^k\p{-1}^{k-1}c_{2l-1}c_{2k-2l+1}}\\
&=\sum_{k=0}^\infty\fr{\p{-1}^k}{z^{2k}}
\sum_{l=0}^{2k}\p{-1}^lc_lc_{2k-l}.
\end{align*}$$

</details>

Then, take the reciprocal of the series, and we have
$$\fr1{\fc{J_m'}z^2+\fc{Y_m'}z^2}=\fr\pi2\sum_{k=0}^\infty\fr{r^\mrm r_k}{z^{2k-1}},$$
where $r^\mrm r_k$ is defined recursively as (noticing that $r_0=1$)
$$r^\mrm r_0\ceq 1,\quad
r^\mrm r_{k>0}\ceq-\sum_{l=1}^kr_lr^\mrm r_{k-l}.$$

<details><summary>Series reciprocation</summary>

For a series $\sum_{k=0}^\infty r_kz^k$,
what is the reciprocal $\p{\sum_{k=0}^\infty r_kz^k}^{-1}$?
Assume that it is another series $\sum_{k=0}^\infty r^\mrm r_kz^k$.
Then, we have
$$1=\p{\sum_{k=0}^\infty r_kz^k}\p{\sum_{k=0}^\infty r^\mrm r_kz^k}
=\sum_{k=0}^\infty z^k\sum_{l=0}^k r_l r^\mrm r_{k-l}.$$
Compare the coefficients of $z^k$ on both sides, and we have
$$\dlt_{k,0}=\sum_{l=0}^k r_l r^\mrm r_{k-l}
=r_0r^\mrm r_k+\sum_{l=1}^k r_l r^\mrm r_{k-l}.$$
Therefore, we get the recursion relation
$$r^\mrm r_0=\fr1{r_0},\quad
r^\mrm r_{k>0}=-\fr1{r_0}\sum_{l=1}^kr_lr^\mrm r_{k-l}.$$
I will use the notation of superscript $\mrm r$ for series reciprocation
in the rest of this article.

There are non-recursive ways of writing those coefficients,
but they are either very long or needs notations that require a bit of explanation,
so I restrained from that.

</details>

<p class="no-indent">
Therefore, we get the asymptotic expansion of $\fc\alp z$ as
$$\fc\alp z=\int\fr{\d z}{\fc pz^2\p{\fc{J_m'}z^2+\fc{Y_m'}z^2}}
=-\fr{m\pi}2-\fr\pi4+\sum_{k=0}^\infty\fr{s_k}{z^{2k-1}},\quad
s_k\ceq\fr{m^2r^\mrm r_{k-1}-r^\mrm r_k}{2k-1}$$
(with $r^\mrm r_{-1}$ understood as $0$; I will be assuming
the reference to any expansion coefficients outside their designated range
to be interpreted as zero in all occurrences in the rest of this article).
The additive constant in $\fc\alp z$ is properly chosen so that
Equation [@eq:bessel-as-kummer-solutions] is satisfied without being off by a phase
(but it is actually unimportant anyway because it gets canceled in the expression of $\tht$).
One can check that this agrees with Equation [@eq:alpha-prime-few-terms].
</p>

We can now find an expansion for $\tht$:
$$\fc\tht z=\fc\alp z-\fc\alp{rz}=\p{1-r}\sum_{k=0}^\infty\fr{d_k}{z^{2k-1}},\quad
d_k\ceq\p{1-\fr1{r^{2k-1}}}\fr{s_k}{1-r}.$$
Then it is the final step to find an expansion for the inverse function $\fc z\tht$.
Take the reciprocal of $\fc\tht z$:
$$\fr1{\fc\tht z}=\fr1{1-r}\sum_{k=0}^\infty\fr{d^\mrm r_k}{z^{2k+1}},\quad
d^\mrm r_0\ceq1,\quad d^\mrm r_{k>0}\ceq-\sum_{l=1}^kd_l d^\mrm r_{k-l}.$$
Then, [invert the series](https://en.wikipedia.org/wiki/Lagrange_inversion_theorem):
$$\fr1{\fc z\tht}=\sum_{k=0}^\infty\fr{b^\mrm r_k}{\tht^{2k+1}},\quad
b^\mrm r_k\ceq\fr{\p{1-r}^{2k+1}}{\p{2k+1}!}\begin{dcases}
\sum_{l=1}^{2k}\p{-1}^l\p{2k+1}^{\overline l}
\fc{B_{2k,l}}{0,2!d^\mrm r_1,0,4!d^\mrm r_2,0,\ldots},&k>0,\\
1,&k=0,
\end{dcases}$$
where $B_{2k,l}$ is the [Bell polynomial](https://en.wikipedia.org/wiki/Bell_polynomials).
Finally, take the reciprocal:
$$\fc z\tht=\sum_{k=0}^\infty\fr{b_k}{\tht^{2k-1}},\quad
b_0\ceq\fr1{1-r},\quad
b_{k>0}\ceq-\fr1{1-r}\sum_{l=1}^kb^\mrm r_lb_{k-l}.$$
The first few terms are
$$\fc z\tht=\fr\tht{1-r}+\fr{\p{4m^2+3}\p{1-r}}{8r\tht}+\cdots$$
(I only write two terms here because the next term starts to be very long;
it will turn out that only the first two terms are useful anyway).

<details><summary>Wolfram codes for computing the coefficients</summary>

```wolfram
a[m_,k_]:= (-1)^k Pochhammer[1/2-m,k]Pochhammer[1/2+m,k]/(2^k k!)
c[m_,k_]:=a[m,k]+(k-1/2)a[m,k-1]
r[m_,k_]:=(-1)^k Sum[(-1)^l c[m,l]c[m,2k-l],{l,0,2k}]
rr[m_,k_]:=rr[m,k]=If[k<0,0,If[k==0,1,-Sum[r[m,l]rr[m,k-l],{l,1,k}]]]
s[m_,k_]:=(m^2 rr[m,k-1]-rr[m,k])/(2k-1)
d[m_,k_,R_]:=(1-1/R^(2k-1))s[m,k]/(1-R)
dr[m_,k_,R_]:=dr[m,k,R]=If[k==0,1,-Sum[d[m,l,R]dr[m,k-l,R],{l,1,k}]]
br[m_,k_,R_]:=(1-R)^(2k+1)/(2k+1)!If[k==0,1,Sum[(-1)^l Pochhammer[2k+1,l]BellY[2k,l,Table[If[EvenQ[j],dr[m,j/2,R]j!,0],{j,1,2k-l+1}]],{l,1,2k}]]
b[m_,k_,R_]:=b[m,k,R]=If[k==0,1/(1-R),-1/(1-R)Sum[br[m,l,R]b[m,k-l,R],{l,1,k}]]
```

<p class="no-indent">
(The capitalized `R` is the parameter $r$ in this article;
I have so poor choices of variable names...)
</p>

</details>

The result is shown in the plot below.

![Plot of $\tht$ vs. $z$ with different numbers of terms for $m=4$, $r=1/3$]({{page.figure}}theta-expansion.svg){.dark-adaptive}

<p class="no-indent">
The black line is the exact function $\fc\tht z$ for $m=4$, $r=1/3$,
and the blue, green, orange, and red lines are the truncated asymptotic series of the inverse function $\fc z\tht$
with 1, 2, 3, and 4 terms, respectively.
The horizontal grid lines are the integer multiples of $\pi$,
whose intersections with the black line gives the wanted roots $z_{mn}$.
To be honest, the result is a bit anticlimactic because it turns out that
truncating the series to only the first two terms gives the best approximation.
This is within expectation, though, because the asymptotic series
is never guaranteed to give better approximations with more terms.
</p>

### The $n=0$ mode

For all the previous plots, I have only shown $m=4$.
For $m$ being other positive integers, they all look similar,
but there is a special feature for $m=0$.
To see this, first study the limiting form of $\fc fz$ and $\fc gz$ for small $z$.
The limiting forms of the Bessel functions are ([source](https://dlmf.nist.gov/10.7#i))
$$\begin{align*}
\fc{J_0'}{z\to0}&=-\fr z2,&
\fc{J_{m>0}'}{z\to0}&=\fr{1}{2^m\p{m-1}!}z^{m-1},\\
\fc{Y_0'}{z\to0}&=\fr2{\pi z},&
\fc{Y_{m>0}'}{z\to0}&=\fr{2^mm!}{\pi}\fr1{z^{m+1}}.
\end{align*}$$ {#eq:bessel-limiting}
We can then get
$$\begin{align*}
\fc f{z\to0}&=\begin{dcases}
\fr4{\pi^2rz^2},&m=0,\\
\fr1{r^{m+1}}\p{\fr{2^mm!}\pi}^2\fr1{z^{2m+2}},&m>0,
\end{dcases}\\
\fc g{z\to0}&=\begin{dcases}
\fr{1-r^2}{\pi r},&m=0,\\
\fr m\pi\p{r^{m-1}-\fr1{r^{m+1}}}\fr1{z^2},&m>0.
\end{dcases}
\end{align*}$$
From this, we can get the limiting form of $\fc\tht z$:
$$\fc\tht{z\to0}=\begin{dcases}
\fr{\pi\p{1-r^2}}4z^2,&m=0,\\
-\fr{\pi m\p{1-r^{2m}}}{\p{m!2^m}^2}z^{2m},&m>0.
\end{dcases}$$
The particularly interesting thing to note is the negative sign for the case of $m>0$.
Remember that $\fc\tht{z\to\infty}=\p{1-r}z$,
which is a positive thing,
we would conclude that $\fc\tht z$ would become zero for some positive $z$ if $m>0$,
while that may not be the case for $m=0$.
Indeed, there is no positive $z$ for $\fc\tht z=0$ if $m=0$, as we can see from the plot below.

![Plot of $\fc\tht z$ for $m=0$ and $m=1$.]({{page.figure}}n-zero-mode-existence.svg){.dark-adaptive}

<p class="no-indent">
The red line is $\fc\tht z$ for $m=1$, which we can see that crosses the horizontal axis,
while the blue line is $\fc\tht z$ for $m=0$, which does not cross the horizontal axis.
The more lightly colored lines are the limiting forms of $\fc\tht z$ for small $z$.
</p>

The implication is that the $n=0$ mode would not exist for $m=0$
but exist for $m>0$.
However, traditionally, when people talk about eigenmodes of the Laplacian,
the quantum number $n$ refers to the 1-based numbering of the roots of the Bessel functions
($g$ in our case).
This would mean that what is referred to as the $\p{m>0,n}$ mode in this article would be
traditionally called the $\p{m>0,n+1}$ mode,
while the $\p{m=0,n}$ mode in this article is the same as what is traditionally called.
In other words, the traditional names of the modes for different values of $m,n$ are
$$\begin{array}{r|cccc}
&n=0&1&2&\cdots\\
\hline
m=0&&\p{0,1}&\p{0,2}\\
1&\p{1,1}&\p{1,2}&\p{1,3}\\
2&\p{2,1}&\p{2,2}&\p{2,3}\\
\vdots&&&&\ddots
\end{array}$$

Another way to see this is that, according to Equation [@eq:bessel-as-kummer-solutions],
in order for $\fc{J_m'}z$ and $\fc{Y_m'}z$ to be real-valued,
whenever $\fc{\alp'}z<0$, we would need $\fc pz$ to be purely imaginary,
and vice versa.
From Equation [@eq:p-and-q], we can see that $\fc pz$ is real when $z\ge m$,
and it is purely imaginary when $z<m$.
Therefore, $\fc{\alp'}z$ goes from negative to positive when $z$ crosses $m$.
This means that $\fc\alp z$ is monotonically decreasing when $z<m$
but monotonically increasing when $z>m$, and $z=m$ is the minimum.
This means that
$$rz<z<m\implies\fc\alp{rz}>\fc\alp z,$$
which means $\fc\tht{z<m}<0$.
This means that when $m>0$, the root $z_{m0}$ must exist,
and we also get a lower bound $z_{m0}>m$.
However, when $m=0$, $\fc\alp z$ would be monotonically increasing for all $z$,
and thus $\fc\tht z$ would be positive for all $z$,
which means that $z_{00}$ does not exist.
By a similar method, we can also derive an upper bound for $z_{m0}$.
We have
$$m<rz<z\implies\fc\alp{rz}<\fc\alp z,$$
which means $\fc\tht{z>m/r}>0$.
This means that $z_{m0}<m/r$.
This also implies the nonexistence of $z_{00}$.

### Numerical root-finding

A key thing to note about the asymptotic series truncated to the first two terms is that
it is impossible to get $z$ values smaller than a certain bound:
$$\fc{z_\mrm{trunc}}\tht=\fr{\tht}{1-r}+\fr{\p{4m^2+3}\p{1-r}}{8r\tht}
\ge z^*\ceq\sqrt{\fr{4m^2+3}{2r}},$$
where the equality holds when $\tht=\tht^*\ceq\p{1-r}\sqrt{\p{4m^2+3}/8r}$.
This means that if we use $z_{mn}\approx\fc{z_\mrm{trunc}}{n\pi}$ to approximate the roots,
we will miss all the roots with $z<z^*$.
The number of missed roots is $n^*\ceq\ceil{\tht^*/\pi}$
(this includes the $n=0$ mode, so for $m=0$, the number of missed roots is $n^*-1$).
According to the bound on $z_{m0}$ we derived in the previous section,
all the missing roots are in the interval $\p{z^*,m}$.
In order to numerically find those roots,
we can equispacedly sample more than $n^*$ points
(maybe $3\p{n^*+1}$ points to be safe) in the interval as initial guesses
and use usual root-finding methods such as Newton's method to find the roots.

## Limiting cases

### The disk limit

When $r\to0$, the annulus becomes a disk.
We will see how the eigenmodes tend to the eigenmodes on a disk, which are given by
$$\fc{\Phi_{mn}^{\mrm{disk}}}{\rho,\vphi}
=\fc{J_m}{z_{mn}^\mrm{disk}\rho/R_\mrm{out}}\e^{\i m\vphi},$$
where $z_{mn}^\mrm{disk}$ are the roots of $J_m'$.

In this case, we can regard $rz$ as small, so using Equation [@eq:bessel-limiting] gives
$$\fc fz=\begin{dcases}
\fr2{\pi rz}\fc{Y_0'}z,&m=0,\\
\fr{2^mm!}{\pi\p{rz}^{m+1}}\fc{Y_m'}z,&m>0,
\end{dcases}\quad
\fc gz=\begin{dcases}
-\fr2{\pi rz}\fc{J_0'}z,&m=0,\\
-\fr{2^mm!}{\pi\p{rz}^{m+1}}\fc{J_m'}z,&m>0.
\end{dcases}$$
This means that
$$\tan\fc\tht z=\fr{\fc gz}{\fc fz}=\fr{-\fc{J_m'}z}{\fc{Y_m'}z}=\tan\fc\alp z,$$
or just $\fc\tht z=\fc\alp z$.
We can also see this by noting that $\fc\alp{rz}=0$ when $r=0$,
so $\fc\tht z=\fc\alp z-\fc\alp{rz}=\fc\alp z$.
Therefore, the solutions to $\fc\tht z=n\pi$ would just be the solutions to
$\fc\alp z=n\pi$,
which are just roots of $J_m'$.
This hence recovers the eigenmodes on a disk.

### The circle limit

When $r\to1$, the annulus becomes a circle.
In this case, we can suppress the radial dimension to make the problem one-dimensional.
The eigenmodes would be
$$\fc{\Phi_m^\mrm{circle}}{\vphi}=\e^{\i m\vphi},$$
and the eigenvalues are $\lmd^\mrm{circle}_m=-m^2/R^2$
(no need to distinguish between $R_\mrm{in}$ and $R_\mrm{out}$ here).

This case is interesting in that the radial dimension would become "invisible"
from the physics of the system.
Note that $\fc\tht{z\to\infty}=\p{1-r}z$ would be a very flat line,
which means that $z$ would need to increase by a very large amount
in order to get $\tht$ to increase by $\pi$.
Therefore, the radial quantum number $n$ would be very hard to increase.
Formally, the eigenvalues of the modes with $n>0$ will become infinite,
so we then practically only need to consider $n=0$ for the "low-energy description" of the system.

We have previously derived the lower bound and upper bound for $z_{m0}$,
which gives $z_{m0}\in\p{m,m/r}$.
When $r\to1$, we then get $z_{m0}=m$ by the squeeze theorem.
The eigenvalue of the Laplacian is then
$\lmd_{m0}=-z_{m0}^2/R^2=-m^2/R^2=\lmd^\mrm{circle}_m$.

However, a peculiar thing to note is that we cannot obtain the $m=0$ mode on a circle
by taking the limit of $r\to1$
because there is no $n=0$ mode when $m=0$ in the annulus.
The seemingly peculiar behavior is due to the fact that actually $z=0$ is also a root of $g$,
which is not feasible for a practical annulus with $r<1$,
but it becomes a feasible solution when $r=1$.
