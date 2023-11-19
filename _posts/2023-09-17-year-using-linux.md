---
title: 'My old computers and my experience of daily driving Linux and self-hosting'
date: 2023-09-17 10:07:45 -0700
categories:
- misc
tags:
- linux
- selfhosting
layout: post
excerpt: 'I have been using Linux and self-hosting for over a year now.
Overall, I would like to say that it is rather satisfactory and
that I will continue to use Linux as my daily driver in future.
Thinking of that, I felt a little bit nostalgic about my old computers.
So I decided to write an article about my old computers and my experience of daily driving Linux now.'
---

## My old computers

I have been using Windows since I was a child.
The first computer that I have ever used is one with Windows XP installed.
It was the one that my grandpa and grandma used to use for stock exchanges,
and I got to use it after the stock market closes every day.
I do not remember much about the specs of that computer,
but I remember how slow it was but how much fun I had with it.

My second computer is a Dell laptop that had been used by my mom.
It was a laptop with Windows 7 installed.
My mom gave that laptop to me because I was interested in digital drawing at that time,
and she was afraid that the old computer that my grandparents used was not good enough to run Photoshop.

I used that laptop for a long time.
Due to the rapid development of technology, that laptop gradually failed to catch up.
Then, when I was in middle school, my parents bought me a new laptop.
It was Dell Inspiron 15 7570, with Windows 10 installed.
It was my choice, and the reason for that choice is mainly due to its color---pink.
Despite that, its specs were not bad at all, and the price was also very cheap.

## My first touch with Linux

For a long time, I equated desktop OS with Windows.
I first knew about Linux when I knew OI (Olympiad in Informatics) in 2019.
OI is a programming competition for high school students.
The programs submitted by the contestants are assessed on Linux computers.
I did not dig far into OI ever, but what is important is that I then knew the existence of Linux.
I installed VirtualBox on my Inspiron 7570 and installed Ubuntu 19.04 on it.

My first impression of Linux was that package managers are awesome.
I was amazed by how easy it is to install software on Linux.
I then also knew about what FOSS is, what GNU is, etc.,
and I realized that GNU/Linux is a very good and important OS.
I was trying to move all my workflows (including studying and developing) to Linux in the virtual machine,
and I was enjoying it.
To have better experience with virtual machines,
I replaced the 8 GB memory of my Inspiron 7570 to two 16 GB memory sticks.

However, virtual machines have their limitations.
In 2020 and 2021, I stopped using Linux for a while.
Fortunately, in 2022, WSL became very popular.
I installed WSL on my Inspiron 7570 and started to use Linux again.
This time, I only use Linux for developing purposes because I did not install a desktop environment on WSL.

## My current computer

In 2022, I graduated from high school and was going to study abroad.
Although my Inspiron 7570 was still working fine,
I felt that I needed a new computer for my upcoming 4 years of college life
and that I should try Linux as my daily driver on my new computer.
The new laptop I got was Lenovo Legion R7000 2021, which is the one I am using now.
It is a gaming laptop with Windows 11 installed.
I switched the memory sticks of my Inspiron 7570 and my Legion R7000 so that my Legion R7000 has 32 GB memory.

To install Linux on my Legion R7000,
I bought an additional 2 TB SSD and put it in the second M.2 slot of my Legion R7000.
I installed Ubuntu 22.04 on the SSD and set up dual boot.
However, I found that Ubuntu 22.04 was too new and that the newly introduced Wayland is not very stable.
I then reinstalled Ubuntu 20.04 on the SSD and set up dual boot again,
and this is the same OS that I am still using now on this computer.

Before I installed Linux on my Legion R7000, I made a list of software that I need to use on Linux.
I listed every single software that I was currently using on Windows
and tried to find alternatives for them on Linux.
If there were, I would try the Windows version of the alternative software first.
If I liked it, I would continue to use it on Linux after I installed Linux later.

Everything did not worked through very well, but I made it.
I transitioned to Linux as my daily driver on my Legion R7000.

## Aspects of my life on Linux

There are several things that I do on my computer every day.
How are them on Linux desktop?

### Gaming

I have played many games on Linux.
The games I mainly play are rhythm games, puzzle games, PvZ series games, and Celeste.

I have to say, thanks to Steam and [Lutris](https://lutris.net){target="_blank},
gaming on Linux is not as bad as I thought.
It is just as good as gaming on Windows.
Sometimes it is even better because some very old games cannot run perfectly on Windows
but can run perfectly on Linux with certain versions of Wine or Proton.
Another edge case that prefers Linux is when I tried playing Genshin Impact with my Wacom tablet
(I was just testing whether it was playable. I do not actually play that game.).
It is playable on Linux, but it is not playable on Windows.

To play Android games, I use Genymotion as an Android emulator.
It is not a good alternative for Noxplayer or MuMu on Windows,
but it is good enough.
For more information about Android gaming on Linux, see my
[article on Zhihu](https://zhuanlan.zhihu.com/p/542623694) (Chinese).

### Drawing tablet

This is not an aspect of my life, but I want to mention it here.
I use my drawing tablet as the pointer device on my computer instead of a mouse
because I find it more comfortable, flexible, and precise.
However, because it is not a very common input device,
I guessed that it might not be well supported on Linux.

I have a Wacom Intuos CTL-690 drawing tablet.
It is very old, but it is still working fine, and I am using it right now.
It rather surprised me that Ubuntu is preinstalled with drivers for Wacom tablets.
I did not need to install any drivers for my Wacom tablet on Ubuntu.

The only annoyance is that Qt applications do not work well with Wacom tablets on Linux.
For example, VLC, Olive (video editor), and OBS Studio do not work well with Wacom tablets on Linux.
Although Krita, as a Qt application, works well with Wacom tablets on Linux,
that is because Krita's binary releases contains several patches to Qt as well as other dependencies.

### Study

I am a college student, so I need to read many papers and textbooks, take notes, and write homework assignments.
To be honest, there are no differences between different OSes in this aspect.

The default PDF reader of GNOME is Evince, and it is good enough.
However, if SumatraPDF has a Linux version, I would definitely use it instead.
I also read many PDFs online (from my own instance of [Kavita](https://kavitareader.com)),
and it is done on browser, so it is not very related to OS.

I use [Joplin](https://joplinapp.org)
(synchronized using my own instance of [Nextcloud](https://nextcloud.com))
and [Write](https://styluslabs.com) (not open-source) as my note-taking apps.
They are very convenient.

For writing homework, I mostly use $\LaTeX$.
It is good enough and convenient enough for writing homework.
If I have to work with Microsoft Office documents, I use LibreOffice.
These aspects are not very related to OS,
but what is good about Linux in this aspect is that it is very easy to install $\LaTeX$.

### Development

I write programs. Surprisingly, developing on Linux is not actually much better than developing on Windows.
First, development tools that are available on Windows are mostly available on Linux,
so I do not need to worry about having different experiences due to using different tools.
Second, WSL and Windows Terminal are actually decent for development.

The only advantage of developing on Linux, in my opinion,
is that I can integrate development with my life more easily.
Many of my everyday workflows depend on tools developed on my own,
so their development environments are the same as the production environments.
I cannot do that on Windows because most of my development environments are in WSL
while my everyday workflows are done outside WSL.

## What is bad about Linux desktop?

I have to say, even with all the efforts of the Linux community,
Linux desktop is still not good enough.
Although it is a better desktop OS than Windows for me,
there are still many things that are not as good as Windows.

For example, specific to my computer (Legion R7000), Linux has very serious vsync issue.
It can be solved by tweaking an option in NVIDIA X Server Settings,
but that will make the frame rate too low to be usable.

There are many features that have been actively worked on by the Linux community but still not available or very buggy.
As typical examples, HDR, fractional scaling, etc. are still not steadily available on Linux desktop.

There are often other commonly complained issues about Linux that I have met with,
such as the lack of driver support, lack of application/game software support, audio issues, etc.,
as well as many other issues that I have never solved or found anyone who also has the same issue.
To solve these issues, I have to spend hours on my OS to tweak them or even write programs to solve them (for example,
[I wrote a Python script just to make my Smartisan stylus usable](https://zhuanlan.zhihu.com/p/539458130)).

## Self-hosting

You may wonder what happened to my Inspiron 7570.
Well, I did not bring it to college though I wanted to (my mom did not allow me to, and that is another story).
If I brought it, I would have been using it as a self-hosting server.
Actually, I already installed Arch Linux on it and set up a few services on it before I left for college.

However, I still got to do self-hosting because I brought another computer.
Thanks to my friend [Xiang](https://orashshi.github.io/),
who gave me his old laptop (Lenovo Legion Y7000P), I got another computer for self-hosting.
I installed Arch Linux on it and set up a few services on it.
I need to say, self-hosting is very fun and useful.

What is awesome about self-hosting in my university (UC Santa Barbara) is that its dorms are very friendly to self-hosting.
[Every ethernet port in the dorm has a public IPv4 address.](https://reddit.com/y5a1k0/)
Previously I thought that I would have to use tunneling services such as ngrok, but I do not need to do that now.

Unfortunately, due to the low availability of campus housing and various other reasons,
I decided to move out of the dorms and live off-campus.
I have not moved in to my new apartment unit yet,
but I have to investigate about available ISPs in the area that are friendly to self-hosting
(has public IP address and does not block inbound traffic).

### Self-hosting is useful

Self-hosting is very fun and useful.
I have been using my self-hosted services every day.
I set up more and more services on the Legion Y7000P.
Right now, there are more than 20 services running on it.

Among all the services, the most useful one, in my opinion, is my
[Nextcloud](https://nextcloud.com/) instance.
Nextcloud is an cloud storage service, and what is good about it is that
its desktop client is the best cloud storage client available on Linux.
I use it to synchronize my study notes and homeworks.

Another useful service is my [Kavita](https://kavitareader.com/) instance.
I have already mentioned it before that I read many PDFs online.
I often download PDFs from the Internet on the Legion Y7000P so that I can read them on Kavita.
By using Kavita, I do not have to worry about downloading multiple copies
on all my devices that I want to read the PDF on.

I also use my [ntfy](https://ntfy.sh/) instance to send notifications to my phone.
I have previously written articles about how I use ntfy to send notifications to help with my life
([this]({% post_url 2022-11-28-ntfy-warn-discharge %}) and [this]({% post_url 2022-12-05-week-prime %})).

I do not want to make this article and endless list of my useful services,
so I will stop here.

Self-hosting also made me learn a lot.
First, because I does not use a desktop environment on my self-hosting server,
I get to learn how to do various things without a GUI.
Then, to make my services secure while accessible, I learned a lot about networking.

### What is bad about self-hosting?

I have to admit that self-hosting is not necessarily better than using cloud services provided by companies.

First, although self-hosting may be cheaper than commercial solutions if you only consider the electricity cost,
but it is not necessarily cheaper if you consider the time spent on it.
You need to maintain your self-hosting server, and that takes time.
You need to regularly update the software on your server,
and every time you want to upgrade a service,
you need to check the changelog of the service for any breaking changes.

Second, not every place is friendly to self-hosting.
Although my university is friendly to self-hosting, this does not apply to other places.
If your server is at home, your ISP may not give you a public IP address (CGNAT),
may block certain ports (such as port 22, 80, and 443),
or may block all inbound traffic.
Tunneling services such as Cloudflare tunnel and ngrok may mitigate this issue,
but they are not as usable.
