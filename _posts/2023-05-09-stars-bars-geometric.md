---
title: 'The distribution when indistinguishable balls are put into boxes'
date: 2023-05-09 12:19:26 -0700
categories:
- math
tags:
- probability
- combinatorics
- ruby
layout: post
excerpt: 'Suppose there are $n$ distinguishable boxes and $k$ indistinguishable balls.
Now, we randomly put the balls into the boxes.
For each of the boxes, what is the probability that it contains $m$ balls?
This is a simple combanitorics problem that can be solved by the stars and bars method.
It turns out that in the limit $n,k\to\infty$ with $k/n$ fixed, 
the distribution tends to be a geometric distribution.'
---

> If there are 200 typographical errors randomly distributed in a 500 page manuscript,
find the probability that a given page contains exactly 3 errors.

<p class="no-indent">
We can abstract this type of problems as follows:
</p>

<blockquote>
Suppose there are $n$ distinguishable boxes and $k$ indistinguishable balls.
Now, we randomly put the balls into the boxes.
For each of the boxes, what is the probability that it contains $m$ balls?
</blockquote>

<p class="no-indent">
For example, if the first page contains 3 errors, the second page contains 197 errors,
and the rest of the pages contain no errors,
then the situation corresponds to the situation where the first box contains 3 balls,
the second box contains 197 balls, and the rest of the boxes contain no balls.
The balls are indistinguishable because we can only determine how many errors are on each page
but not which errors are on the page.
</p>

To deal with the problem, we simply need to find these two numbers:

- the number of ways to put $k$ indistinguishable balls into $n$ distinguishable boxes, and
- the number of ways to put $k-m$ indistinguishable balls into $n-1$ distinguishable boxes.

<p class="no-indent">
The latter corresponds to the number of ways to put the balls into the boxes
provided that we already know that the given box contains $m$ balls.
After we find these two numbers, their ratio is the probability in question.
</p>

To find the number of ways to put $k$ indistinguishable balls into $n$ distinguishable boxes,
we can use the stars and bars method.
To see this, we write a special example.
Here is an example of $n=4$ and $k=6$:
$${}|{}\star{}\star{}|{}\star{}|{}\star{}\star{}\star{},$$
which corresponds to the distribution $0,2,1,3$.
We can see that there are $n-1$ bars and $k$ stars.
Therefore, the number of ways to put the balls
is the same as the number of ways to choose the $k$ positions of the stars among $n+k-1$ positions.
Therefore, the number of ways is
$$N_{n,k}=\binom{n+k-1}{k}=\frac{\left(n+k-1\right)!}{k!\left(n-1\right)!}.$$
Therefore, the final probability of the given box containing $m$ balls is
$$P_{n,k}(m)=\frac{N_{n-1,k-m}}{N_{n,k}}
=\frac{\left(n-1\right)k!\left(n+k-m-2\right)!}{\left(k-m\right)!\left(n+k-1\right)!}.$$

---

Another easy way to derive this result is by using the generating function.
The number $N_{n,k}$ is just the coefficient of $x^k$ in the expansion of
the generating function $\left(1+x+x^2+\cdots\right)^n$.
The generating function is just $\left(1-x\right)^{-n}$, which can be easily expanded by
using the binomial theorem.

---

We are now interested in the limit $n,k\to\infty$ with $\lambda\coloneqq k/n$ fixed.
By Stirling's approximation, we have
$$P_{n,k}(m)\sim\left(n-1\right)
\frac{k^{k+1/2}\left(n+k-m-2\right)^{n+k-m-2+1/2}}{\left(k-m\right)^{k-m+1/2}\left(n+k-1\right)^{n+k-1+1/2} }
\mathrm e^{k-m+n+k-1-k-n-k+m+2}.$$
The $1/2$'s in the exponents can just be dropped because
you may find that if we extract the $1/2$'s, the factor tends to unity.
The exponential is just constant $\mathrm e$.
Therefore, we have
$$\begin{align*}
P_{n,k}(m)&\sim\left(n-1\right)
\frac{\left(\lambda n\right)^{\lambda n}\left(n+\lambda n-m-2\right)^{n+\lambda n-m-2} }
{\left(\lambda n-m\right)^{\lambda n-m}\left(n+\lambda n-1\right)^{n+\lambda n-1}}\mathrm e\\
&=\left(\tfrac{n+\lambda n-m-2}{n+\lambda n-1}\right)^n
\left(\tfrac{\left(n+\lambda n-m-2\right)\lambda n}{\left(\lambda n-m\right)\left(n+\lambda n-1\right)}\right)^{\lambda n}
\left(\tfrac{\lambda n-m}{n+\lambda n-m-2}\right)^m
\tfrac{\left(n-1\right)\left(n+\lambda n-1\right)}{\left(n+\lambda n-m-2\right)^2}\mathrm e\\
&\to\mathrm e^{-\frac{m+1}{\lambda+1}}\,\mathrm e^m\,
\mathrm e^{-\frac{m+1}{\lambda+1}\lambda}\left(\tfrac\lambda{\lambda+1}\right)^m\tfrac1{\lambda+1}\mathrm e\\
&=\left(\tfrac\lambda{\lambda+1}\right)^m\tfrac1{\lambda+1}.
\end{align*}$$
This is just the geometric distribution with parameter $p=1/(\lambda+1)=n/(k+n)$.

---

If you want to simulate the number of balls in a box, here is a simple way to do this.
First, because each box is the same, we can just focus on the first box without loss of generality.
Then, we just need to randomly generate the positions of the $n-1$ bars among the $n+k-1$ positions,
and then return the index of the first bar (which is the number of balls in the first box).

We can then write the following Ruby code to simulate the number of balls in the first box:

```ruby
def simulate n, k
  (n-1).times.inject(npkm1 = n+k-1) { |bar, i| [rand(npkm1 - i), bar].min }
end
```

Compare the simulated result with the theoretical result:

```ruby
def frequency m, n, k, trials
  trials.times.count { simulate(n, k) == m } / trials.to_f
end

def truth m, n, k
  (n-1) * (k-m+1..k).reduce(1,:*) / (n+k-m-1..n+k-1).reduce(1,:*).to_f
end

def approx m, n, k
  n*k**m / ((n+k)**(m+1)).to_f
end

srand 1108
m, n, k = 3, 5000, 8000
p frequency m, n, k, 10000 # => 0.0902
p truth m, n, k # => 0.08965012972626446
p approx m, n, k # => 0.08963271594131858
```
