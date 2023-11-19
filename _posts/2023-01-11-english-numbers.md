---
title: 'I want to invent a better way to read numbers'
date: 2023-01-11 22:51:41 -0800
categories:
- language
tags:
- imagination
layout: post
excerpt: 'Reading numbers in English is a pain.
I want to invent a better way to read numbers!'
---

First, play a simple game. Read the number 7777 in English.
Here is what you read:

> Seven thousand seven hundred and seventy-seven.

There are 14 syllables while the original number has only 4 digits.
This makes it very tedious to read numbers in English.
Thus, I want to invent a better way to read numbers!

## Single-digit numbers

First, let's improve the first few numbers in English. They are

| Number | Original word | Pronunciation (BE) |
|---|---|---|
| 0 | zero | /ˈzɪərəʊ/ |
| 1 | one | /wʌn/ |
| 2 | two | /tuː/ |
| 3 | three | /θriː/ |
| 4 | four | /fɔː/ |
| 5 | five | /faɪv/ |
| 6 | six | /sɪks/ |
| 7 | seven | /ˈsevən/ |
| 8 | eight | /eɪt/ |
| 9 | nine | /naɪn/ |
| 10 | ten | /ten/ |
| 11 | eleven | /eˈlevən/ |
| 12 | twelve | /twelv/ |

(I do not want to read 0 as /əʊ/ because it confuses with the letter O.)
Here are several problems:

- Some words have more than one syllable or end with a consonant,
this makes it hard to pronounce them fast in continuous speech.
- What do 10, 11, and 12 do here?
They are not single-digit numbers and should not appear here.
- Some of the words have strange spelling.
- *two* has the same pronunciation as *too*,
and *four* has the same pronunciation as *for*,
which may be confusing sometimes.

I want to improve them as follows:

| Number | Word | Pronunciation |
|---|---|---|
| 0 | zoh | /zəʊ/ |
| 1 | wah | /wɑː/ |
| 2 | tue | /tjuː/ |
| 3 | tee | /tiː/ |
| 4 | foo | /fuː/ |
| 5 | fah | /fɑː/ |
| 6 | sou | /saʊ/ |
| 7 | sah | /sɑː/ |
| 8 | tay | /teɪ/ |
| 9 | nye | /naɪ/ |

There are some advantages:

- Most of the words have similar pronunciation as the original words,
this makes it easy to remember them.
The only exceptions are *sou* and *sah*
because there too many single-syllable English words that start with /s/,
and I have to avoid the existing words.
- Each of the words contains only one simple syllable,
which makes it easy to pronounce fast.
- The spelling pretty much follows the pronunciation
and avoids large discrepencies among accents.
- The written length of the words are all the same (three letters),
which makes it easier to sight-read.
- The words are pretty distinguishable by their pronunciations
so that they do not confuse when being said in a noisy environment.

## Positive integers smaller than 1000

In English, the suffix *-ty* is used to get multiples of ten.
This suffix will sound too similar to *tee* (3) in our improved words for digits.
Therefore, I want to propose a new suffix *-ta*, pronounced as /tə/.
The multiples of ten are then

| Number | Word | Pronunciation |
|---|---|---|
| 10 | wahta | /ˈwɑːtə/ |
| 20 | tueta | /ˈtjuːtə/ |
| 30 | teeta | /ˈtiːtə/ |
| 40 | foota | /ˈfuːtə/ |
| 50 | fahta | /ˈfɑːtə/ |
| 60 | souta | /ˈsaʊtə/ |
| 70 | sahta | /ˈsɑːtə/ |
| 80 | tayta | /ˈteɪtə/ |

For numbers smaller than 100 and not multiples of 10,
they are just the sum of the corresponding multiples of 10 and single-digit numbers.
The two parts hyphenizes to represent the number.
The numbers 11 etc. are then

| Number | Word | Pronunciation |
|---|---|---|
| 11 | wahta-wah | /ˈwɑːtəˈwɑː/ |
| 12 | wahta-tue | /ˈwɑːtəˈtjuː/ |
| 13 | wahta-tee | /ˈwɑːtəˈtiː/ |
| 14 | wahta-foo | /ˈwɑːtəˈfuː/ |
| 15 | wahta-fah | /ˈwɑːtəˈfɑː/ |

Now we can read all numbers smaller than 100.

For numbers starting from 100,
English uses the word *hundred*, which is very long,
and it is almost always followed by a useless word *and*.
A better way to express numbers starting from 100
is just how we express those from 10.
I want to propose a new suffix *-ha*, pronounced as /hə/,
to represent multiples of hundred.
The multiples of hundred are then

| Number | Word | Pronunciation |
|---|---|---|
| 100 | wahha | /ˈwɑːhə/ |
| 200 | tueha | /ˈtjuːhə/ |
| 300 | teeha | /ˈtiːhə/ |
| 400 | fooha | /ˈfuːhə/ |
| 500 | fahha | /ˈfɑːhə/ |
| 600 | souha | /ˈsaʊhə/ |
| 700 | sahha | /ˈsɑːhə/ |
| 800 | tayha | /ˈteɪhə/ |
| 900 | nyeha | /ˈnaɪhə/ |

Hyphenization gives other numbers below 1000:

| Number | Word |
|---|---|
| 101 | wahha-wah |
| 111 | wahha-wahta-wah |

Sometimes we also benefits from just reading the digits.
If the speaker know for sure that the audience will not confuse
whether the number is a categorical data or a cardinal data,
then the speaker can just read the digits.
This makes the delivery of information about numbers really fast
considering that now every digit only has one syllable.

| Number | Word | Shortcut |
|---|---|---|
| 42 | foota-tue | foo-tue |
| 255 | tueha-fahta-fah | tue-fah-fah |

## Integers starting from 1000

For numbers larger than 1000, just use how English deal with them,
but use *thou*, *mill*, *bill*, etc. to replace the multi-syllable words
*thousand*, *million*, *billion*, etc.
Another way to do this is just reading digits.

| Number | Word | Shortcut | Shorter-cut |
|---|---|---|---|
| 1,001 | wah thou wah | wah thou wah | wah-zoh-zoh-wah |
| 1,984 | wah thou nyeha-tayta-foo | wah thou nye-tay-foo | wah-nye-tay-foo |
| 65,535 | souta-fah thou fahha-teeta-fah | sou-fah thou fah-tee-fah | sou-fah-fah-tee-fah |
| 20,031,108 | tueta mill teeta-wah thou wahha-tay | tue-zoh mill tee-wah thou wah-zoh-tay | tue-zoh-zoh-tee-wah-wah-zoh-tay |

(Actually, I do not think using *thou*, *mill*, etc. is a good idea
because they coincide with existing English words and are hard to remember (for foreigners),
but I cannot come up with a better idea.)

## Decimals

For decimals, just use how English deal with them.
Use *dot* instead of *point* to tell the decimal point
because it is easier to pronounce.
Also, I propose that we read *dot* as /dɒ/ instead of /dɒt/
to pronounce it faster.

| Number | Word |
|---|---|
| 3.14 | tee dot wah-foo |
| 520.1314 | fahha-tueta dot wah-tee-wah-foo |

## Negative numbers

For negative numbers, add *ne* (from the word *negative*),
pronounced as /neɪ/, before the number.

| Number | Word | Pronunciation |
|---|---|---|
| -100 | ne wahha | /ˈneɪˈwɑːhə/ |

## Fractions

English use ordinal numerals to represent fractions,
which is very non-intuitive and sometimes ambiguous.
There are various ways to represent fractions in English that do not involve ordinal numerals.
For example, a half can be represented as

- 1 in 2,
- 1 (divided) by 2,
- 1 over 2,
- 1 to 2 *(only used for ratios)*,
- 1 slash 2,

etc., but none of them is a good way because they may be ambiguous.
We need to invent a new word.
I propose using the word *ci*, from the second syllable in the word *reciprocal*,
pronounced as /sɪ/.

| Number | Word |
|---|---|
| $\frac{22}7$ | tueta-tue ci sah |
| $\frac{114}{514}$ | wahha-wahta-foo ci fahha-wahta-foo |
| $-\frac12$ | ne wah ci fah |

## Scientific notation

How do you read $1.234\times10^{-8}$?

> One point two three four times ten to the power of negative eight.

That is very long!
I propose that we write the number as 1.234e-8, and just pronounce how it looks
(pronounce the *e* here as /iː/).

| Number | Word |
|---|---|
| 1.234e-8 | wah dot tue-tee-foo ee ne tay |

## Ordinal numerals

English uses the suffixes *-th*, *-st*, *-nd*, and *-rd* to represent ordinal numerals,
which is actually a disaster...

- [Do you like $(n+1)$st or $(n+1)$th?](https://english.stackexchange.com/q/36512/457522)
(People surely have personal preferences over these two according to the answers,
and there is no standard.)
- You may know
[Platform Nine and Three-Quarters](https://harrypotter.fandom.com/wiki/Platform_Nine_and_Three-Quarters)
if you are a *Harry Potter* fan,
but what is the ordinal of $9\frac34$?
- Because there are multiple suffixes,
there is a disaster for non-native speakers to write ordinal numerals.
You may [Google "21th"](https://www.google.com/search?q=21th)
to see how many people have made the mistake.
- How to ask a question w.r.t. an unknown ordinal numeral?
["The how many-th president is Barack Obama?"](https://english.stackexchange.com/q/21876/457522)
(Most the answers in this link cannot generalize to other questions like
"How many-th most beautiful person is Kat in the world?"
or even weirder questions like
"You love Kat the how many-th most in the world?")

Therefore, we need to have a consistent way to turn any cardinal numeral into an ordinal numeral,
and we need to invent a way to ask questions about ordinal numerals.

I then want to use the word *ra*
(abbreviation for *rank*, although this is an existing English meaning the hawk-headed sun god),
pronounced as /rɑː/.
Put the word *ra* before a number to represent the ordinal numeral.

| Original word | Word |
|---|---|
| first | ra wah |
| twentieth | ra tueta |
| $n$th | ra $n$ |

To ask a question about an ordinal numeral, just convert the structure "ra + *num.* + *sth*"
into "ra what + *sth*", and form the rest of the sentence to get a question.
If there is a definite article before *ra*, omit it in the question.

Example sentences:

> - The ra 21 century is the century of biology.
> - Kat wants a ra tue child.
> - The ra $n$ number in the Fibonacci sequence is $F_n$.
> - Students board Hogwarts Express at the ra $9\frac34$ platform on the ra wah day in September.
> - The ra ne wah element in an array is defined to be its last element.
> Generally, the ra $-k$ element in an array is defined to be its ra $n-k$ element,
> where $n$ is the length of the array.
> - In an arithmetic progression,
> the difference between the ra $n+1$ term and the ra $n$ term is the same for any $n$.
> - Ra what president is Barack Obama?
> - Ra what most beautiful person is Kat in the world?
> - Ra what most do you love Kat in the world?
> / Ra what most in the world do you love Kat?

Although I invented a set of new rules for ordinal numerals,
I do not delete the word *first* in English.
The word *first* now means the frontmost thing in spatial or chronological order.
The difference between being the first and being the ra wah appears when
the things in order are uncountable or does not start from number 1.
For example, we can say the first element in the interval $[0,1]$ is $0$
if we order the elements from the small to large,
but there is no *ra wah* element in it.
For another example, because indices start from 0 in programming languages,
the first element in an array is the *ra zoh* element instead of the *ra wah* element.

The word *first* can also be used in the following circumstances:

- In the structure *first... next... then... last...* or other similar structures;
- In collocations like *in the first place*, *first of all*, etc.

Sometimes, we may use *firstly* instead of *first* when it is used as an adverb
(the same thing applys to other ordinal numerals).
I would like to just replace *firstly*, *secondly*, etc.
with *ra wah*, *ra tue*, etc.

## Numerical prefixes

Here is another mess with English: numerical prefixes.
Just look at how many
[systems of numerical prefixes we have in English](https://en.wikipedia.org/wiki/Numeral_prefix).

However, I do not have motivations to fix the numerical prefixes...
After all, [people will invent their own](https://english.stackexchange.com/a/28374/457522).
Also, there is an advantage of using numerical prefixes different from normal numerals:
they avoid ambiguity in oral speech.
