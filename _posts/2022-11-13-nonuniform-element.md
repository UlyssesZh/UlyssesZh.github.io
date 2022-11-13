---
title: 'An example of non-uniform elements: heavy elastic rope'
date: 2022-11-13 10:15:12 -0800
categories:
- physics
tags:
- from zhihu
layout: post
excerpt: 'To illustrate the concept about non-uniform elements,
we study a simple problem: suppose a uniform heavy elastic rope has mass $m$, original length $L_0$, and stiffness $k$,
and find the mass distribution and length of it when hung vertically.
We can use the element method to solve this problem, but the elements are non-uniform in terms of length.
The elements add up to get the total length $L=\frac{mg}{2k}+L_0$.'
---

*This article is translated from a
Chinese [article](https://zhuanlan.zhihu.com/p/97803238){:target="_blank"} on my Zhihu account.
The original article was posted at 2019-12-18 11:20 +0800.*

---

Review middle school contents!

Suppose a uniform heavy elastic rope has mass $m$, original length $L_0$, and stiffness $k$.
Find the mass distribution and length of it when hung vertically.

When the elastic rope has its original length,
divide it into $n$ equal segments, where $n$ is large
so that when the elastic rope is stretched, the mass distribution within every segment is uniform.

When the rope is hung vertically, the tension experienced by every segment is

$$F_j=\frac{mg}n\left(n-j\right).$$

Therefore, the length of every segment is

$$\Delta l_j=\frac{F_j}{nk}+\frac{L_0}n=\frac{mg\left(n-j\right)}{n^2k}+\frac{L_0}n.$$

Therefore, the position of the end of every segment is

$$x_j=\sum_{s=1}^j\Delta l_s=\frac{2nL_0kj+2nmgj-mgj-mgj^2}{2n^2k}.$$

The equation can be solved to get

$$j=\frac{2nmg+2nL_0k-mg\pm\sqrt{\left(mg-2nL_0k-2nmg\right)^2-8n^2mgkx_j}}{2mg}.$$

The (linear) mass density of every segment is

$$\rho_j=\frac{m}{n\Delta l_j}=\frac{m}{n\left(\frac{mg\left(n-j\right)}{n^2k}+\frac{L_0}n\right)}.$$

Express $j$ here with $x_j$, and we have

$$\rho_j=\frac{2nmk}{mg\mp\sqrt{\left(2nL_0k+mg\left(2n-1\right)\right)^2-8n^2mgkx_j}}.$$

The length of the rope is

$$L=x_n=\frac{mg\left(n-1\right)}{2nk}+L_0.$$

Take the limit $n\to\infty$, and we have

$$L=\frac{mg}{2k}+L_0,$$

$$\rho\!\left(x\right)=\pm\frac{mk}{\sqrt{L_0^2k^2+m^2g^2+2mgk\left(L_0-x\right)}}.$$

The plus-minus sign here should take plus sign.

To test, calculate $\int_0^L\rho\\!\left(x\right)\mathrm dx=m$.

The conclusion can be written in a more beautiful way:

$$\rho\!\left(x\right)=\frac{m}{\sqrt{\left(2L-L_0\right)^2-4\left(L-L_0\right)x}}.$$
