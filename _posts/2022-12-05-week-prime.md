---
title: 'I made this, for the number of days in a week is prime'
date: 2022-12-05 10:23:34 -0800
categories:
- programming
tags:
- selfhosting
- linux
- ruby
layout: post
excerpt: 'The number of days in a week is prime,
so we cannot utilize weekly periods to help us remember periodical events unless the period is a multiple of 7.
However, there may be something that we need to get reminded of which happens once per two days or three days.
For example, I wash my hair once per two days and wash my clothes once per eight days.
To solve the problem, I wrote a Ruby program to help remind me of those routines.'
---

The number of days in a week is prime,
so we cannot utilize weekly periods to help us remember periodical events unless the period is a multiple of 7.
However, there may be something that we need to get reminded of which happens once per two days or three days.
For example, I wash my hair once per two days and wash my clothes once per eight days.

I may use calendar apps to help me with that, but there is a problem around it:
most calendar apps set periodical events based on weeks
(i.e. you can set an event to happen on every Monday but can not set it to happen every other day).
Since my need is actually very easy to satisfy (I just need a reliable reminder!),
I decided to write a Ruby program to help me with that.

The program is called peroutine.
It is available [on GitHub](https://github.com/UlyssesZh/peroutine).
It is a Ruby program that runs on the command line.
I can now see whether I need to wash my hair or clothes today by running `peroutine list`!
It also notifies me every day at 11 PM via my self-hosted [ntfy](https://ntfy.sh) server
whether I need to wash my hair today.
