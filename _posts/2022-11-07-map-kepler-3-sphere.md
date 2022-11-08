---
title: Mapping from Kepler problem to free particle on 3-sphere
date: 2022-11-07 16:12:09 -08:00
categories:
- physics
tags:
- classical mechanics
- canonical transformation
- letter
layout: post
---

*This article is adapted from the letter that I wrote to my professor of classical mechanics.
Background: the professor said in class that he know there is a way to transform the Kepler problem into the system of a free particle on a 3-sphere,
but he did not know what is the explicit form of the mapping
and asked us to try to research and find out the mapping.
The original letter was sent at 2022-10-13 21:56 -07:00.*

---

Hello!

After searching on the internet,
I found something about what the mapping from the 3-dimensional Kepler problem
to the 3-sphere is.

We choose the canonical coordinates as the 3 Cartesian coordinates and the 3 associated momenta.
Then, use stereographic projection to map the 3-dimensional vector $\mathbf p/p_0$ (where $p_0:=\sqrt{-2mE}$) to a point on an 3-sphere
(where we should already have built a coordinate system $\mathbf u$ for us to calculate with).
The explicit expression for the projection is

$$\mathbf u:=\frac{p^2-p_0^2}{p^2+p_0^2}\hat{\mathbf n}+\frac{2p_0}{p^2+p_0^2}\mathbf p,$$

where $\mathbf u$ is a unit 4-dimensional vector, and $\hat{\mathbf n}$ is a unit vector perpendicular to the hyperplane where $\mathbf p$ lies.
I'm sorry for the abuse of notation, but the $\mathbf u$ in this email also stands for the (3-spherical) coordinates of it on the 3-sphere.

Now, we can use the coordinates on the 3-sphere to express the momenta $\mathbf p(\mathbf u)$.
Then, write down the one-form $\mathbf p\cdot\mathrm d\mathbf x$ in terms of the 3-dimensional Cartesian coordinates $\mathbf x$ and the coordinates on the 3-sphere,
and convert it into the form $\mathrm d(\mathbf p\cdot\mathbf x)-\mathbf P(\mathbf x,\mathbf u)\cdot\mathrm d\mathbf u$.
Then, we get the canonical transform $(\mathbf x,\mathbf p)\mapsto(\mathbf u,\mathbf P)$.
The hamiltonian will be correspondingly transformed into exactly the same as the hamiltonian of a free particle on the 3-sphere.

The explicit calculation for the 2-dimensional case can be found in [this paper](https://www.researchgate.net/publication/268173388){:target="_blank"}.
It also covered the case where $E=0$ and $E>0$.

Figuring out this mapping is actually more straightforward if we consider it as a problem in quantum mechanics.
Here is how Fock derived this historically.
The Schrödinger equation of the Kepler problem, after a Fourier transformation, is

$$\left(\frac{p^2}{2m}-E\right)\Phi(p)=\frac{k}{2\pi^2\hbar}\int\mathrm d^3q\frac{\Phi(q)}{|\mathbf p-\mathbf q|^2}.$$

Looking into it keenly enough, one may find that the factor $1/|\mathbf p-\mathbf q|^2$ is
actually the Jacobian of the stereographic projection mentioned above.
Some calculation should reduce this equation to the Schrödinger equation of a free particle on the 3-sphere.

Some online sources:
several Wikipedia pages,
[Baez 2022](https://math.ucr.edu/home/baez/gravitational.html){:target="_blank"},
[Egan 2013](http://www.gregegan.net/SCIENCE/Ellipse/Ellipse.html){:target="_blank"}.

Best regards,

Ulysses Zhan
