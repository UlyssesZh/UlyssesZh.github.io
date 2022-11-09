---
title: The point on the circle farthest to two lines
date: 2022-11-08 21:12:08 -0800
categories:
- math
tags:
- elementary geometry
- trigonometry
- from zhihu
layout: post
---

*This article is translated (while omitting some tedious calculations) from a
Chinese [article](https://zhuanlan.zhihu.com/p/62898884){:target="_blank"} on my Zhihu account.
The original article was posted at 2019-05-15 20:28 +0800.*

---

Suppose $P$ is a point on the circle $\odot C$ with radius $r$.
Now we study the feature of the position of the point $P$
when the sum of the distances from $P$ to the two edges of $\angle O$ is extremal.

Set up Cartesian plane coordinates with the origin at $O$ and the $x$-axis pointing from $O$ to $C$.
Suppose the coordinates of $C$ are $\left(x_C,0\right)$,
the coordinates of $P$ is $\left(x_C+r\cos\theta,r\sin\theta\right)$,
and the slope of the two sides of $\angle O$ are $k_1$ and $k_2$ respectively.
Then, we have

$$\begin{align*}
l_1&:k_1x-y=0,\\
l_2&:k_2x-y=0.
\end{align*}$$

Suppose

$$\begin{align*}
d_1&:=\frac{k_1\left(x_C+r\cos\theta\right)-r\sin\theta}{\sqrt{k_1^2+1}},\\
d_2&:=\frac{k_2\left(x_C+r\cos\theta\right)-r\sin\theta}{\sqrt{k_2^2+1}},
\end{align*}$$

and then $\left\|d_1\right\|$ and $\left\|d_2\right\|$ are the distances from $P$ to $l_1$ and $l_2$ respectively.
The sum of the distances

$$\left|d\right|=\left|d_1\right|+\left|d_2\right|$$

(the definition of $d$ here are discussed case by case below).

Now, we discuss case by case.

## Case 1: $d_1$ and $d_2$ have the same sign

In this case, $P$ is on the same "side" of $l_1$ and $l_2$,
i.e. $P$ is in the interior of the adjacent supplementary angle of $\angle O$.

Suppose

$$d:=d_1+d_2,$$

and then $\left\|d\right\|$ is the sum of distances from $P$ to $l_1$ and $l_2$,
so we just need to discuss the case when $d$ is extremal.

Let

$$d_C:=x_C\left(\frac{k_1}{\sqrt{k_1^2+1}}+\frac{k_2}{\sqrt{k_2^2+1}}\right),$$

$$A:=r\sqrt{\left(\frac{k_1}{\sqrt{k_1^2+1}}+\frac{k_2}{\sqrt{k_2^2+1}}\right)^2
+\left(\frac1{\sqrt{k_1^2+1}}+\frac1{\sqrt{k_2^2+1}}\right)^2},$$

$$\phi:=\arctan\frac{\frac1{\sqrt{k_1^2+1}}+\frac1{\sqrt{k_2^2+1}}}{\frac{k_1}{\sqrt{k_1^2+1}}+\frac{k_2}{\sqrt{k_2^2+1}}}.$$

Then, we have

$$\begin{align*}
d&=d_C+A\cos\phi\cos\theta-A\sin\phi\sin\theta\\
&=d_C+A\cos\left(\phi+\theta\right).
\end{align*}$$

Therefore, we find that, $d$ is extremal iff $\theta=n\pi-\phi$ ($n\in\mathbb Z$).
Then we study what are the features of $\theta$ when $d$ is extremal.

Let

$$\begin{align*}
\theta_1&:=\arctan k_1,\\
\theta_2&:=\arctan k_2.
\end{align*}$$

Then, we have after some calculations

$$\tan\theta=-\frac{\frac1{\sqrt{k_1^2+1}}+\frac1{\sqrt{k_2^2+1}}}{\frac{k_1}{\sqrt{k_1^2+1}}+\frac{k_2}{\sqrt{k_2^2+1}}}
=\tan\frac{\theta_1+\theta_2+\pi}2.$$

Therefore,

$$\theta=n\pi+\frac{\theta_1+\theta_2+\pi}2.$$

This means that $\tan\theta$ is the slope of the bisector of the adjacent supplementary angle of $\angle O$.

Therefore, we get such a method of construction of $P$ for extremal $\left\|d\right\|$:
draw the bisector $l$ of the adjacent supplementary angle of $\angle O$;
draw a line passing $C$ parallel to $l$,
whose intersection with $\odot C$ is $P$
(there are two such intersection points, corresponding to $n$ being even and odd respectively,
and $d$ takes maximal and minimal values respectively).

## Case 2: $d_1$ and $d_2$ have different signs

Now, $P$ are on different "sides" of $l_1$ and $l_2$,
i.e. $P$ is in the interior of $\angle O$ or its opposite angle.

Similarly, let

$$d:=d_1-d_2,$$

and then $\left\|d\right\|$ is the sum of distances from $P$ to $l_1$ and $l_2$.

Let

$$d_C:=x_C\left(\frac{k_1}{\sqrt{k_1^2+1}}-\frac{k_2}{\sqrt{k_2^2+1}}\right),$$

$$A:=r\sqrt{\left(\frac{k_1}{\sqrt{k_1^2+1}}-\frac{k_2}{\sqrt{k_2^2+1}}\right)^2
+\left(\frac1{\sqrt{k_1^2+1}}-\frac1{\sqrt{k_2^2+1}}\right)^2},$$

$$\phi:=\arctan\frac{\frac1{\sqrt{k_1^2+1}}-\frac1{\sqrt{k_2^2+1}}}{\frac{k_1}{\sqrt{k_1^2+1}}-\frac{k_2}{\sqrt{k_2^2+1}}}.$$

Then, we have

$$d=d_C+A\cos\!\left(\theta+\phi\right).$$

Therefore, we find that $d$ is extremal iff $\theta=n\pi-\phi$ ($n\in\mathbb Z$).
Then we study what are the features of $\theta$ when $d$ is extremal.

Similarly, let

$$\begin{align*}
\theta_1&:=\arctan k_1,\\
\theta_2&:=\arctan k_2.
\end{align*}$$

Then, we have after some calculations

$$\theta=n\pi+\frac{\theta_1+\theta_2}2.$$

In other words, $\tan\theta$ is the slope of the bisector of $\angle O$.

Therefore, we get such a method of construction of $P$ for extremal $\left\|d\right\|$:
draw the bisector $l$ of $\angle O$;
draw a line passing $C$ parallel to $l$,
whose intersection with $\odot C$ is $P$
(there are two such intersection points, corresponding to $n$ being even and odd respectively,
and $d$ takes maximal and minimal values respectively).

## Case 3: $d_1=0$ or $d_2=0$

In this case, $P$ is on either $l_1$ or $l_2$.

Without loss of generality, we assume $d_2=0$.
Then, $P$ is the intersection of $\odot C$ and $l_2$,
the number of cases is reduced to finite.
To avoid confusion, we denote $\theta$ now $\theta_0$.
Now, $d_1$ and $d_2$ are functions of $\theta$, while $\theta_0$ is the $\theta$ at which $d_2=0$.

### Subcase 1: $d_1=0$

Obviously, in this case, when $\theta=\theta_0$, the sum of distances from $P$ to $l_1$ and $l_2$ takes minimal.
This case occurs only when $l_1,l_2,\odot C$ intersect at the same point.

### Subcase 2: $d_1\neq 0$

Then, according to the property of continuous functions,
in some neighborhood of $\theta_0$, $d_1\ne0$.

#### Subsubcase 1: $\odot C$ intersects but is not tangent to $l_2$

Then, in some neighborhood of $\theta_0$, for the two cases $\theta<\theta_0$ and $\theta>\theta_0$,
the sign of $d_2$ is different.
We can define in this neighborhood

$$d:=\begin{cases}
d_1+d_2,&\text{if $d_1d_2>0$,}\\
d_1,&\text{if $\theta=\theta_0$,}\\
d_1-d_2,&\text{if $d_1d_2<0$.}
\end{cases}$$

It is easy to see that the left and right derivative of the continuous function $d$ both exist at $\theta_0$.
It can be proved (how?) that, if the two derivatives have different signs,
then $d$ is extremal at $\theta=\theta_0$.

To examine whether the two derivatives have different signs,
we can write the product of them and see whether the result is positive or negative
(the case of it being $0$ will be discussed later).

Find the derivatives of $d_1$ and $d_2$ respectively.

$$\begin{align*}
\theta_1&:=\arctan k_1,\\
\theta_2&:=\arctan k_2.
\end{align*}$$

Then, we have

$$\begin{align*}
\frac{\mathrm dd_1}{\mathrm d\theta}
&=\frac{-k_1r\sin\theta-r\cos\theta}{\sqrt{k^2+1}}\\
&=-r\cos\!\left(\theta-\theta_1\right),
\end{align*}$$

$$\frac{\mathrm dd_2}{\mathrm d\theta}=-r\cos\!\left(\theta-\theta_2\right).$$

Therefore, the left and right derivatives of $d$ at $\theta_0$ are respectively

$$\begin{align*}
\left.\frac{\mathrm dd}{\mathrm d\theta}\right|_{\theta=\theta_0^\pm}
&=\left.\frac{\mathrm dd_1}{\mathrm d\theta}\right|_{\theta=\theta_0}
+\left.\frac{\mathrm dd_2}{\mathrm d\theta}\right|_{\theta=\theta_0}\\
&=-r\cos\!\left(\theta_0-\theta_1\right)-r\cos\!\left(\theta_0-\theta_2\right)\\
&=-2r\cos\!\left(\theta_0-\frac{\theta_1+\theta_2}2\right)\cos\frac{\theta_1-\theta_2}2,
\end{align*}$$

$$\left.\frac{\mathrm dd}{\mathrm d\theta}\right|_{\theta=\theta_0^\mp}
=-2r\sin\!\left(\theta_0-\frac{\theta_1+\theta_2}2\right)\sin\frac{\theta_1-\theta_2}2.$$

Then, the product of the two derivatives is

$$\nu_0:=
\left.\frac{\mathrm dd}{\mathrm d\theta}\right|_{\theta=\theta_0^\pm}
\cdot\left.\frac{\mathrm dd}{\mathrm d\theta}\right|_{\theta=\theta_0^\mp}
=r^2\sin\!\left(\theta_1-\theta_2\right)\sin\left(2\left(\theta_0-\frac{\theta_1+\theta_2}2\right)\right).$$

According to this equation, we can determine the sign of $\nu_0$ by merely knowing
which quadrant the angle $\theta_0-\frac{\theta_1+\theta_2}2$ is in,
and can therefore determine whether $d$ is extremal.

(When $\nu_0=0$, $P$ is the intersection of the three object:
the bisector of $\angle O$ or its adjacent supplementary angle,
$\odot C$, and $l_2$.
In this case, $d$ may take extremal or not.
How do we discuss this case now?)

#### Subsubcase 2: $\odot C$ is tangent to $l_2$

This case is easy.
You only need to see whether $P$ is in the interior of $\angle O$ or its opposite angle
when $P$ is moving near the tangent point.
If it is in the interior, then the case is identical to Case 2;
if it is in the exterior, then the case is identical to Case 1.

## Summary

We finally got the method of determining whether the point $P$ on $\odot C$ has the extremal sum of distances to $l_1$ and $l_2$:

- If $P$ is in the interior of $\angle O$ or its opposite angle
(or, $P$ is on the tangent point of $\odot C$ and one of the sides of $\angle O$
while $P$ is in the interior of $\angle O$ or its opposite angle when it moves near the tangent point),
then we can see whether it is the intersection of $\odot C$ and the bisector of $\angle O$.
If it is, then the sum of distances is extremal;
if it is not, then the sum of distances is not extremal.
- If $P$ is in the interior of an adjacent supplementary angle of $\angle O$
(or, $P$ is on the tangent point of $\odot C$ and one of the sides of $\angle O$
while $P$ is in the interior of an adjacent supplementary angle of $\angle O$ when it moves near the tangent point),
then we can see whether it is the intersection of $\odot C$ and the bisector of the adjacent supplementary angle $\angle O$.
If it is, then the sum of distances is extremal;
if it is not, then the sum of distances is not extremal.
- If $P$ is on the intersection of $\odot C$ and one of the edge $l_2$ of $\angle O$,
then we can divide the plane into four parts by drawing the bisector of $\angle O$
and that of the adjacent supplementary angle of $\angle O$,
call the union of the two divided parts with $l_2$ passing through as $D_2$.
Then, translate $D_2$ to make the intersection of its boundary lines overlap with $C$,
and see whether $P$ belongs to the translated $D_2$.
If it is an interior point of the region, then the sum of distances is extremal;
if it is an exterior point of the region, then the sum of distances is not extremal;
if it is a boundary point of the region, then the sum of distances may be extremal or not.
