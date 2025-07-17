---
title: Multi-pass Gaussian blur filter
date: 2025-07-17 01:06:08 -0700
categories:
- programming
tags:
- algorithm
- shader
- probability
- pde
layout: post
excerpt: 'According to the central limit theorem, the sum of some i.i.d. samples is normally distributed in the limit of large sample size.
This fact can be used to implement a multi-pass Gaussian blur filter,
where the total number of passes is equal to the number of samples used in the averaging.
Through this, we can also see a nice relation to the heat equation,
which is not surprising since the heat kernel is a Gaussian function.'
---

In image processing, a Gaussian blur filter is the transformation of an image that blurs it by a Gaussian function.
Mathematically, a Gaussian blur filter is a linear transformation $G$ on a measurable function
$f:\bR^d\to\bR$ that does not grow too fast at infinity
(or more generally, $f:\bR^d\to V$, where $V$ is a locally convex topological vector space)
which results in a function $Gf:\bR^d\to\bR$ defined by the integral
$$\fc{Gf}x\ceq\int\frac{\d^dy}{\sqrt{\p{2\pi}^d\det A}}\fc\exp{-\fr12\p{A^{-1}}_{jk}y_jy_k}\fc f{x+y},$$
where $A$ is a symmetric positive definite matrix called the covariance matrix of the Gaussian kernel.

By looking at this formula,
we can see that $\fc{Gf}x$ is exactly the expectation value of $\fc f{x+Y}$,
where $Y$ is a random vector distributed according to the multivariate normal distribution
with mean $0$ and covariance matrix $A$.
Let's say, however, that instead of a multivariate normal distribution,
we have a discrete distribution on a finite set of points $\B{a_i}$, each with probability $w_i$,
satisfying
$$\sum_i w_i=1,\quad\sum_i w_ia_i=0.$$
Then, for $Y$ distributed according to this discrete distribution,
the expectation value of $\fc f{x+Y}$ is
$$\bopc E{\fc f{x+Y}}=\sum_i w_i\fc f{x+a_i}.$$
This distribution has the covariance matrix $A_{jk}=\sum_i w_ia_{ij}a_{ik}$,
but this expectation value is not the same as the result $\fc{Gf}x$ of the Gaussian blur filter.
In order to approach the Gaussian distribution,
we need to sum $N$ independent samples $\B{Y_\alpha}$,
each distributed according the same discrete distribution with covariance matrix $A/N$.
Without changing the relation between $A$ and $\B{a_i}$,
we can achieve this by taking the distribution to be among the points $\B{a_i/\sqrt N}$,
with the same probabilities $w_i$.
Then, according to the central limit theorem, we have
$$\fc{Gf}x=\lim_{N\to\infty}\bopc E{\fc f{x+\sum_\alpha Y_\alpha}}
=\lim_{N\to\infty}\sum_{\B{i_\alpha}}\p{\prod_\alpha w_{i_\alpha}}\fc f{x+\fr{1}{\sqrt N}\sum_\alpha a_{i_\alpha}}.$$
By staring at this formula,
one may notice that it is actually the result of the same linear transformation $P_N$
applied $N$ times to the function $f$, where
$$\fc{P_Nf}x\ceq\sum_iw_i\fc f{x+\fr{a_i}{\sqrt N}}.$$
Thus, we can write
$$G=\lim_{N\to\infty}P_N^N.$$

We can now see why we can implement a Gaussian blur filter as a multi-pass filter:
each pass of the filter is equivalent to applying the linear transformation $P_N$ once,
and the Gaussian blur filter is the limit of applying this transformation infinitely many times.
After choosing the points $\B{a_i}$ and the weights $w_i$,
we can easily implement the filter in a fragment shader.
After implementing $P_N$,
one can implement the multi-pass filter
by flip-flopping between two textures $N$ times.
Here is an example implementation of $P_N$ for a 2D ($d=2$) texture,
with
$$a_0=\begin{pmatrix}\sgm\\0\end{pmatrix},\quad
a_1=\begin{pmatrix}-\sgm\\0\end{pmatrix},\quad
w_0=w_1=\fr12,$$
where $\sgm$ would be the standard deviation of the resulting Gaussian blur filter:

```glsl
varying vec2 vTextureCoord;

uniform sampler2D uTexture;
uniform float uStrength; // sigma / sqrt(N)

void main() {
	gl_FragColor  = texture2D(uTexture, vTextureCoord + vec2( uStrength, 0.0)) * 0.5;
	gl_FragColor += texture2D(uTexture, vTextureCoord + vec2(-uStrength, 0.0)) * 0.5;
}
```

<p class="no-indent">
When using the shader, the texture is input as the uniform `uTexture`,
and $\sgm/\sqrt N$ is input as the uniform `uStrength`.
This example is then called the 2-tap horizontal Gaussian blur filter
(because to find $\fc fx$ for some $x$ one needs to evaluate $f$ twice).
</p>

To get a good Gaussian blur effect,
$N$ should be large enough, which can quickly become computationally expensive.
We can reduce the number of passes by rewriting $P_N^N=\p{P_N^n}^{N/n}$
so that the number of passes is now reduced from $N$ to $N/n$ without changing the result,
but the cost is to implement $P_N^n$ instead of $P_N$ in the shader.
With the $P_N$ example above, the $P_N^n$ filter is then a $\p{n+1}$-tap horizontal Gaussian blur filter.
The total number of times to fetch the texture is $\p{n+1}N/n$ to render the whole blurred texture,
which decreases as $n$ increases.

By utilizing the linear sampling feature of the GPU,
this number can be further reduced (by half) if $\sgm/\sqrt N$ is an integer.
One can read further about this in
[this article](https://www.rastergrid.com/blog/2010/09/efficient-gaussian-blur-with-linear-sampling/).

---

Let us now move on to an interesting relation to the heat equation.
The heat equation is a partial differential equation that reads
$$\partial_t\fc{f_t}x=\sum_j\partial_j\partial_j\fc{f_t}x.$$
The physical meaning of $\fc{f_t}x$ is the temperature at position $x$ at time $t$,
and the solution to this equation gives the time evolution
of the temperature distribution in a medium with unit thermal diffusivity.
More generally, we can have some other thermal diffusivities, which may even be anisotropic,
in which case the equation reads
$$\partial_t\fc{f_t}x=\fr12\sum_{jk}A_{jk}\partial_j\partial_k\fc{f_t}x,$$
where $A$ is a symmetric positive definite matrix.
Such an equation can always be reduced to the form with unit thermal diffusivity
by a linear transformation of the coordinates $x\mapsto Lx$,
where $L$ satisfies $A/2=L^\mrm TL$ (the Cholesky decomposition of $A/2$).
By using operator exponentiation, we can write the solution to the heat equation as $\fc{f_t}x=G^t\fc{f_0}x$, where
$$G^t\ceq\fc\exp{\fr t2\sum_{jk}A_{jk}\partial_j\partial_k}$$
is called the time evolution operator
(which is not generally defined for $t<0$,
which means that $\B{G^t}$ cannot form a group but only a monoid).

The reason that I denote it as $G^t$ is that $G^1$ gives exactly the Gaussian blur filter $G$
(when acting on real analytic functions).
This is not immediately obvious, and I will justify its correctness
by starting from the multi-pass expression of the Gaussian blur filter.
For analytic functions, we can get the translation operator by exponentiating the derivative operator, so
$$\fc f{x+\fr{a_i}{\sqrt N}}=\fc\exp{\sum_j\fr{a_{ij}}{\sqrt N}\partial_j}\fc fx.$$
Therefore, we can write
$$\begin{align*}
P_N&=\sum_iw_i\fc\exp{\sum_j\fr{a_{ij}}{\sqrt N}\partial_j}\\
&=\underbrace{\sum_iw_i}_1
+\fr1{\sqrt N}\sum_j\underbrace{\sum_iw_ia_{ij}}_0\partial_j
+\fr1{2N}\sum_{jk}\underbrace{\sum_iw_ia_{ij}a_{ik}}_{A_{jk}}\partial_j\partial_k
+\order{N^{-3/2}}.
\end{align*}$$
Now, in the limit of infinite $N$, we have
$$G=\lim_{N\to\infty}P_N^N
=\lim_{N\to\infty}\p{1+\fr1{2N}\sum_{jk}A_{jk}\partial_j\partial_k}^N
=\fc\exp{\fr12\sum_{jk}A_{jk}\partial_j\partial_k}=G^1.$$
This means that applying the Gaussian blur filter is equivalent to evolving one unit of time according to the heat equation.
Therefore, the equation in the beginning of this article,
the definition of the Gaussian blur filter,
can then be used to express the unit time evolution under the heat equation
in the form of a integral transformation.
To get the general $G^t$, we can just replace $A$ with $tA$.

As a byproduct, we can then show that the heat kernel is a Gaussian kernel.
The heat kernel $\fc{K_t}{x,x'}$ is defined as the solution to the heat equation
with initial condition $\fc{K_0}{x,x'}=\fc\dlt{x-x'}$.
Directly applying $G^t$ to $\fc\dlt{x-x'}$ gives
$$\begin{align*}
\fc{K_t}{x,x'}&=G^t\fc\dlt{x-x'}\\
&=\int\fr{\d^dy}{\sqrt{\p{2\pi t}^d\det A}}\fc\exp{-\fr1{2t}\p{A^{-1}}_{jk}y_jy_k}\fc\dlt{x+y-x'}\\
&=\fr{1}{\sqrt{\p{2\pi t}^d\det A}}\fc\exp{-\fr1{2t}\p{A^{-1}}_{jk}\p{x_j-x'_j}\p{x_k-x'_k}},
\end{align*}$$
which is the form that you would find in textbooks.

---

The reason that I decided to study the Gaussian blur filter
is that I spotted a flaw in the implementation of the blur filter in
[PixiJS](https://pixijs.com),
where the uniform `uStrength` in the example shader above
is scaled by $1/N$ instead of $1/\sqrt N$.
I was very happy to find the bug because this is the first time
that I found a bug without actually producing an unexpected phenomenon first
but by just staring at the source codes
and deducing the mathematical formulas by hand.
I opened an [issue](https://github.com/pixijs/pixijs/issues/11554) for my findings.
