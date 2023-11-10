---
title: The image of a circular object through a thin lens
date: 2022-11-09 09:37:41 -0800
categories:
- physics
tags:
- geometrical optics
- from zhihu
layout: post
excerpt: 'The image of a circle with radius $r$ and centered at $C\left(-2f,0\right)$
through a thin lens at $x=0$ with focal length $f$ and centered at $O\left(0,0\right)$
is a conic section with the focus being $\left(2f,0\right)$,
the directrix being line $x=f$,
and the eccentricity being $\frac rf$.'
---

*This article is translated from a
Chinese [article](https://zhuanlan.zhihu.com/p/73294062){target="_blank"} on my Zhihu account.
The original article was posted at 2019-07-12 15:40 +0800.*

---

The center of the circular luminous object is $C$, and its radius is $r$.
The center of the thin lens is $O$, and its focal length is $f$.
The object is in the same plane as $C$, and $OC$ is perpendicular to the thin lens,
and $\left\|OC\right\|=2f$.

Set up Cartesian coordinate with $O$ being the origin and $CO$ being the $x$-axis.
Then, $C\left(-2f.0\right)$.
The luminous object is described by the parametric equations

$$\begin{cases}
x=-2f+r\cos t,\\y=r\sin t.
\end{cases}$$

Pick point $P\left(-2f+r\cos t,r\sin t\right)$ on the object.
According to the formula for imaging of thin lenses

$$\begin{cases}
-\frac1x+\frac1{x'}=\frac1f,\\
\frac x{x'}=\frac y{y'},
\end{cases}$$

the point $P$ is transformed to $P'\left(f\left(1+\frac f{f-r\cos t}\right),-f\frac{r\sin t}{f-r\cos t}\right)$.
Therefore, we can have the parametric equations of the image:

$$\begin{cases}
x=f\left(1+\frac f{f-r\cos t}\right),\\y=-f\frac{r\sin t}{f-r\cos t}.
\end{cases}$$

Cancel $t$, and we have

$$y^2=\left(\frac rf\right)^2\left(x-f\right)^2-\left(x-2f\right)^2,$$

which means that the image is a conic section with the focus being $\left(2f,0\right)$,
the directrix being line $x=f$,
and the eccentricity being $\frac rf$.

Alternatively, let $\rho\coloneqq\sqrt{\left(x-2f\right)^2+y^2}$, and we have

$$\rho=\frac r{1-\frac rf\cos t},$$

and we may have the same conclusion through this equation.
