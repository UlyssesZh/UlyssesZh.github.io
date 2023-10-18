---
title: You can replace $\mathrm i$ with $-\mathrm i$ in the Schr&ouml;dinger equation?
date: 2023-10-18 09:57:54 -0700
categories:
- physics
tags:
- quantum mechanics
- letter
- complex
layout: post
excerpt: 'When someone asks you why it is $-\mathrm i$ here instead of $\mathrm i$
or the other way around, you can say that this is just a convention.
My professor of quantum mechanics once asked the class similar a question,
and I replied with this letter.'
---

*This article is adapted from the letter that I wrote to my professor of quantum mechanics.
Background: the professor asked the class why the infinitesimal translation $I-\mathrm i P\varepsilon$
instead of $I+\mathrm i P\varepsilon$ (here $P$ is the momentum operator).
I pointed out immediately that this is not a legitimate question to ask
because we can freely replace $\mathrm i$ with $-\mathrm i$ in the Schr&ouml;dinger equation.
The original letter was sent at 2023-10-10 16:42 -0700.*

---

Hi! I said in today's class that
it is just a random choice whether we use $\mathrm i$ or $-\mathrm i$. Here is the justification:

First, mathematically, conjugation is an automorphism of $\mathbb C$ (in the sense of being a field).
This fact can be easily verified.
It can be easily understood by considering $\mathbb C$ as the extension field $\mathbb R[X]/(X^2+1)$.
Furthermore, due to this fact, all theorems in complex analysis are still valid
if we replace every number by its conjugate.

Then, consider replacing $-\mathrm i$ with $\mathrm i$ in the SE,
namely changing $\psi' = -\mathrm iH\psi$ into $\psi' = \mathrm iH\psi$.
Due to the mathematical fact above, the new SE should lead to
exactly the same theory as our familiar QM because all physically meaningful quantities are real
(so that their conjugate are still themselves).
The solution to the SE will be $\psi = \psi_0\exp(\mathrm iHt)$ instead of $\psi = \psi_0\exp(-\mathrm iHt)$,
and they are exactly the same except an opposite phase (which does not matter)
(given that $\psi_0$ also becomes its original counterpart's conjugate in the new theory,
where by saying "conjugate" here I mean taking the conjugate of all of its coordinates under the basis of eigenvectors of $H$).

What about time reversal? The time reversal is $t\to-t$ in the SE,
which is actually slightly different from $\mathrm i\to-\mathrm i$
because when doing the latter I also assume that we make $\psi_0$ its conjugate,
while $t\to-t$ leaves $\psi_0$ unchanged.
However, the close connection between conjugate and time reversal does give us a hint about what the T-symmetry looks like in QM:
QM does have T-symmetry, but $T$ cannot be a linear operator because it unavoidably involves conjugation.
Actually, conjugation often does look like time reversal.
For example, $[X,P]=\mathrm i$ becoming $[X,P]=-\mathrm i$ can be either due to conjugation
(the $\mathrm i\to-\mathrm i$ here)
or due to time reversal ($P\to-P$ while $X$ unchanged).

Other than saving some minus signs here or there,
there is actually a benefit (though minor) about replacing our familiar QM with its conjugate:
this makes equations in QM have the same convention as in electrical engineering.
Specifically, QM uses $\exp(-\mathrm i E t)$ while EE uses $\exp(\mathrm i\omega t)$.
I don't know why, but conventions in EM seem to be the same as in QM because they also use $\exp(-\mathrm i\omega t)$.
It seems strange that EE does not use the same conventions in EM.

Back to where this topic was brought up:
why is infinitesimal translation identity minus $\mathrm i P \varepsilon$ instead of plus?
The answer to this question is the choice we made when we wrote the SE, which is just a matter of convention.
The question that can be genuinely asked is this:
why is infinitesimal translation identity minus $\varepsilon \mathrm d/\mathrm dx$ instead of plus?
The arguments made in class are then valid to answer this question.

Best regards,

Ulysses Zhan
