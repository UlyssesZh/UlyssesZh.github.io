---
title: A polynomial whose sum of coefficients is a factorial
date: 2022-11-09 10:04:43 -0800
categories:
- math
tags:
- combinatorics
- number sequence
- from zhihu
layout: post
excerpt: 'The function $\left(1-z\right)^{n+1}\sum_{k=1}^\infty k^nz^k$ is a polynomial of degree $n$ w.r.t. $z$,
and the sum of its coefficients is $n!$.
This turns out to be properties of Eulerian numbers.'
---

*This article is translated from a
Chinese [article](https://zhuanlan.zhihu.com/p/73079049){:target="_blank"} on my Zhihu account.
The original article was posted at 2019-07-13 20:36 +0800.*

---

**Definition 1**. Let

$$f_n\!\left(z\right):=\left(1-z\right)^{n+1}\sum_{k=1}^\infty k^nz^k,$$

where $n$ is a positive integer.

Our goal is to prove that $f_n\\!\left(z\right)$ is a polynomial of degree $n$ w.r.t. $z$,
and the sum of its coefficients is $n!$.

**Lemma 1**.

$$f_{n+1}\!\left(z\right)=z\,\left(1-z\right)^{n+2}\frac{\mathrm d}{\mathrm dz}\left(\frac{f_n\!\left(z\right)}{\left(1-z\right)^{n+1}}\right).$$

*Proof.*

$$\begin{align*}
\frac{\mathrm d}{\mathrm dz}\left(\frac{f_n\!\left(z\right)}{\left(1-z\right)^{n+1}}\right)
&=\frac{\mathrm d}{\mathrm dz}\sum_{k=1}^\infty k^nz^k\\
&=\sum_{k=1}^\infty k^{n+1}z^{k-1}\\
&=\frac{f_{n+1}\!\left(z\right)}{z\,\left(1-z\right)^{n+2}}.&\square
\end{align*}$$

**Definition 2** (Eulerian numbers).

$$\left<\begin{matrix}n\\k\end{matrix}\right>:=\sum_{j=0}^{k+1}\left(-1\right)^j\binom{n+1}j\left(k-j+1\right)^n.$$

**Lemma 2**.

$$\left<\begin{matrix}n+1\\k+1\end{matrix}\right>=\left(n-k\right)\left<\begin{matrix}n\\k\end{matrix}\right>+\left(k+2\right)\left<\begin{matrix}n\\k+1\end{matrix}\right>.$$

*Proof.*

$$\begin{align*}
&\phantom{=}~\,\left(n-k\right)\left<\begin{matrix}n\\k\end{matrix}\right>+\left(k+2\right)\left<\begin{matrix}n\\k+1\end{matrix}\right>\\
&=\left(n-k\right)\sum_{j=0}^{k+1}\left(-1\right)^j\binom{n+1}j\left(k-j+1\right)^n+\left(k+2\right)\sum_{j=0}^{k+2}\left(-1\right)^j\binom{n+1}j\left(k-j+2\right)^n\\
&=\left(n-k\right)\sum_{j=0}^{k+2}\left(-1\right)^{j-1}\binom{n+1}{j-1}\left(k-j+2\right)^n+\left(k+2\right)\sum_{j=0}^{k+2}\left(-1\right)^j\binom{n+1}j\left(k-j+2\right)^n\\
&=\sum_{j=0}^{k+2}\left(-1\right)^j\left(k-j+2\right)^n\left(\left(k-n\right)\binom{n+1}{j-1}+\left(k+2\right)\binom{n+1}j\right)\\
&=\sum_{j=0}^{k+2}\left(-1\right)^j\left(k-j+2\right)^n\left(\left(k-n\right)\frac{\left(n+1\right)!}{\left(j-1\right)!\left(n-j+2\right)!}+\left(k+2\right)\frac{\left(n+1\right)!}{j!\left(n-j+1\right)!}\right)\\
&=\sum_{j=0}^{k+2}\left(-1\right)^j\left(k-j+2\right)^n\frac{\left(n+1\right)!}{j!\left(n-j+2\right)}\left(\left(k-n\right)j+\left(k+2\right)\left(n-j+2\right)\right)\\
&=\sum_{j=0}^{k+2}\left(-1\right)^j\left(k-j+2\right)^n\frac{\left(n+1\right)!}{j!\left(n-j+2\right)}\left(n+2\right)\left(k-j+2\right)\\
&=\sum_{j=0}^{k+2}\left(-1\right)^j\left(k-j+2\right)^{n+1}\frac{\left(n+2\right)!}{j!\left(n-j+2\right)}\\
&=\sum_{j=0}^{k+2}\left(-1\right)^j\binom{n+2}j\left(k-j+2\right)^{n+1}\\
&=\left<\begin{matrix}n+1\\k+1\end{matrix}\right>.
&\square
\end{align*}$$

**Lemma 3**.

$$\left<\begin{matrix}n\\0\end{matrix}\right>=1,\quad\left<\begin{matrix}n\\n\end{matrix}\right>=0.$$

*Brief proof.*
Easily proved by Definition 2. $\square$

**Lemma 4**.

$$f_n\!\left(z\right)=\sum_{k=1}^n\left<\begin{matrix}n\\n-k\end{matrix}\right>z^k.$$

*Proof.*
By mathematical induction.
When $n=1$,

$$f_n\left(z\right)=z=\sum_{k=1}^n\left<\begin{matrix}n\\n-k\end{matrix}\right>z^k,$$

the result stands.

Suppose the result stands when $n=n_0$, and then when $n=n_0+1$,

$$\begin{align*}
&\phantom{=}~\,f_n\!\left(z\right)\\
&=z\,\left(1-z\right)^{n_0+2}\frac{\mathrm d}{\mathrm dz}\left(\frac{f_{n_0}\left(z\right)}{\left(1-z\right)^{n_0+1}}\right)
&\text{(Lemma 1)}\\
&=z\,\left(1-z\right)^{n_0+2}\frac{\frac{\mathrm df_{n_0}\left(z\right)}{\mathrm dz}\left(1-z\right)^{n_0+1}-f_{n_0}\!\left(z\right)\frac{\mathrm d\left(\left(1-z\right)^{n_0+1}\right)}{\mathrm dz}}{\left(1-z\right)^{2n_0+2}}\\
&=z\,\left(1-z\right)^{n_0+2}\frac{\frac{\mathrm df_{n_0}\left(z\right)}{\mathrm dz}\left(1-z\right)^{n_0+1}+\left(n_0+1\right)f_{n_0}\!\left(z\right)\left(1-z\right)^{n_0}}{\left(1-z\right)^{2n_0+2}}\\
&=z\left(\frac{\mathrm df_{n_0}\!\left(z\right)}{\mathrm dz}\left(1-z\right)+\left(n_0+1\right)f_{n_0}\left(z\right)\right)\\
&=z\left(\left(1-z\right)\frac{\mathrm d}{\mathrm dz}\sum_{k=1}^{n_0}\left<\begin{matrix}n_0\\n_0-k\end{matrix}\right>z^k+\left(n_0+1\right)\sum_{k=1}^{n_0}\left<\begin{matrix}n_0\\n_0-k\end{matrix}\right>z^k\right)
&\text{(supposed)}\\
&=z\left(\left(1-z\right)\sum_{k=1}^{n_0}\left<\begin{matrix}n_0\\n_0-k\end{matrix}\right>kz^{k-1}+\left(n_0+1\right)\sum_{k=1}^{n_0}\left<\begin{matrix}n_0\\n_0-k\end{matrix}\right>z^k\right)\\
&=z\left(\sum_{k=1}^{n_0}\left<\begin{matrix}n_0\\n_0-k\end{matrix}\right>kz^{k-1}-\sum_{k=1}^{n_0}\left<\begin{matrix}n_0\\n_0-k\end{matrix}\right>kz^k+\left(n_0+1\right)\sum_{k=1}^{n_0}\left<\begin{matrix}n_0\\n_0-k\end{matrix}\right>z^k\right)\\
&=z\left(\sum_{k=0}^{n_0}\left<\begin{matrix}n_0\\n_0-k-1\end{matrix}\right>\left(k+1\right)z^k-\sum_{k=0}^{n_0}\left<\begin{matrix}n_0\\n_0-k\end{matrix}\right>kz^k+\left(n_0+1\right)\sum_{k=0}^{n_0}\left<\begin{matrix}n_0\\n_0-k\end{matrix}\right>z^k\right)
&\text{(Lemma 3)}\\
&=z\sum_{k=0}^{n_0}\left(\left<\begin{matrix}n_0\\n_0-k-1\end{matrix}\right>\left(k+1\right)z^k-\left<\begin{matrix}n_0\\n_0-k\end{matrix}\right>kz^k+\left(n_0+1\right)\left<\begin{matrix}n_0\\n_0-k\end{matrix}\right>z^k\right)\\
&=\sum_{k=0}^{n_0}\left(\left<\begin{matrix}n_0\\n_0-k-1\end{matrix}\right>\left(k+1\right)-\left<\begin{matrix}n_0\\n_0-k\end{matrix}\right>k+\left(n_0+1\right)\left<\begin{matrix}n_0\\n_0-k\end{matrix}\right>\right)z^{k+1}\\
&=\sum_{k=1}^{n_0+1}\left(k\left<\begin{matrix}n_0\\n_0-k\end{matrix}\right>+\left(n_0-k+2\right)\left<\begin{matrix}n_0\\n_0-k+1\end{matrix}\right>\right)z^k\\
&=\sum_{k=1}^{n_0+1}\left<\begin{matrix}n_0+1\\n_0-k+1\end{matrix}\right>z^k
&\text{(Lemma 2)}\\
&=\sum_{k=1}^n\left<\begin{matrix}n\\n-k\end{matrix}\right>z^k.
\end{align*}$$

Then we can derive that the result is true by mathematical induction. $\square$

**Lemma 5**.

$$\sum_{j=0}^n\left(-1\right)^{n-j}\binom njj^n=n!.$$

*Proof.*
Because $\mathrm e^x-1\sim x$ (in terms of infinitesimal quantity),
$\left(\mathrm e^x-1\right)^n\sim x^n$, i.e.

$$\left(\mathrm e^x-1\right)^n=x^n+o\!\left(x^n\right)$$

(where $o$ denotes higher order of infinitesimal quantity).

Apply Newton's binomial theorem to the left-hand side, and we have

$$\sum_{j=0}^n\left(-1\right)^{n-j}\binom nj\mathrm e^{jx}=x^n+o\!\left(x^n\right).$$

Take $n$th derivative of the equation, and we have

$$\sum_{j=0}^n\left(-1\right)^{n-j}\binom njj^n\mathrm e^{jx}=n!+o\!\left(1\right).$$

Take $x=0$, and we have

$$\sum_{j=0}^n\left(-1\right)^{n-j}\binom njj^n=n!.\qquad\square$$

**Lemma 6**.

$$\sum_{j=0}^n\left(-1\right)^{n-j}\binom nj\left(j+1\right)^n=n!.$$

*Proof.*

$$\begin{align*}
\left(n+1\right)!&=\sum_{j=0}^n\left(-1\right)^{n-j+1}\binom{n+1}jj^{n+1}&
\text{(Lemma 5)}\\
&=\sum_{j=1}^n\left(-1\right)^{n-j+1}\binom{n+1}jj^{n+1}\\
&=\sum_{j=1}^n\left(-1\right)^{n-j+1}\frac{\left(n+1\right)!}{j!\left(n-j+1\right)!}j^{n+1}
\\
&=\sum_{j=1}^n\left(-1\right)^{n-j+1}\frac{\left(n+1\right)n!}{\left(j-1\right)!\left(n-j+1\right)!}j^n\\
&=\sum_{j=0}^n\left(-1\right)^{n-j}\frac{\left(n+1\right)n!}{j!\left(n-j\right)!}\left(j+1\right)^n\\
&=\left(n+1\right)\sum_{j=0}^n\left(-1\right)^{n-j}\binom nj\left(j+1\right)^n.
&\square
\end{align*}$$

**Lemma 7**.

$$\sum_{k=0}^n\left<\begin{matrix}n\\k\end{matrix}\right>=n!.$$

*Proof.*

$$\begin{align*}
&\phantom{=}~\,\sum_{k=0}^n\left<\begin{matrix}n\\k\end{matrix}\right>\\
&=\sum_{k=0}^n\sum_{j=0}^{k+1}\left(-1\right)^j\binom{n+1}j\left(k-j+1\right)^n\\
&=\sum_{k=0}^n\sum_{j=0}^k\left(-1\right)^j\binom{n+1}j\left(k-j+1\right)^n\\
&=\sum_{j=0}^n\sum_{k=j}^n\left(-1\right)^j\binom{n+1}j\left(k-j+1\right)^n\\
&=\sum_{j=0}^n\left(-1\right)^j\binom{n+1}j\sum_{k=j}^n\left(k-j+1\right)^n\\
&=\sum_{j=0}^n\left(-1\right)^j\binom{n+1}j\sum_{k=1}^{n-j+1}k^n\\
&=\sum_{j=0}^n\left(-1\right)^{n-j}\binom{n+1}{n-j}\sum_{k=1}^{j+1}k^n\\
&=\sum_{j=0}^n\left(-1\right)^{n-j}\binom{n+1}{j+1}\sum_{k=1}^{j+1}k^n\\
&=\sum_{j=0}^n\left(-1\right)^{n-j}\left(\binom nj+\binom n{j+1}\right)\sum_{k=1}^{j+1}k^n\\
&=\sum_{j=0}^n\left(-1\right)^{n-j}\binom nj\sum_{k=1}^{j+1}k^n+\sum_{j=0}^n\left(-1\right)^{n-j}\binom n{j+1}\sum_{k=1}^{j+1}k^n\\
&=\sum_{j=0}^n\left(-1\right)^{n-j}\binom nj\left(j+1\right)^n+\sum_{j=0}^n\left(-1\right)^{n-j}\binom nj\sum_{k=1}^jk^n+\sum_{j=1}^n\left(-1\right)^{n-j+1}\binom nj\sum_{k=1}^jk^n\\
&=n!+\sum_{j=1}^n\left(-1\right)^{n-j}\binom nj\sum_{k=1}^jk^n-\sum_{j=1}^n\left(-1\right)^{n-j}\binom nj\sum_{k=1}^jk^n
&\text{(Lemma 6)}\\
&=n!.&\square
\end{align*}$$

*Proof of the original proposition.*
By Lemma 4, $f_n\!\left(z\right)$ is a polynomial of degree $n$ in $z$
(Lemma 3 guarantees that the coefficient of the $n$th degree term is not $0$).

The sum of coefficients

$$\begin{align*}
\sum_{k=1}^n\left<\begin{matrix}n\\n-k\end{matrix}\right>
&=\sum_{k=0}^{n-1}\left<\begin{matrix}n\\k\end{matrix}\right>\\
&=\sum_{k=0}^n\left<\begin{matrix}n\\k\end{matrix}\right>
&\text{(Lemma 3)}\\
&=n!.
&\text{(Lemma 7)}\\
&&\square
\end{align*}$$
