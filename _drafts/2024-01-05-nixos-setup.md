---
title: I switched from Ubuntu to NixOS as my daily-driven OS
date: 2024-01-04 23:25:25 -0800
categories:
- misc
tags:
- linux
layout: post
excerpt: 'Because I met with a strange problem that I cannot solve,
I decided to reinstall my OS.
This time, I decide to play with something other than Ubuntu and Arch.
I chose NixOS, a very interesting Linux distro.'
---

## Backstory

I should have written this post a long time ago
because I switched to NixOS back in January 4, 2024.
I know this date because the I created a draft for this article and marked the date.
However, because I keep finding, trying, and tweaking new things about NixOS,
I keep postponing writing this article
for covering more contents about my experience with NixOS.

The reason that I switched away from Ubuntu is a bit funny.
I updated OpenCC on that system, and then my input method (RIME) just stopped working for no reason.
I tried various different things to fix it without luck.
Therefore, I was like, screw it, I will just reinstall the OS.

The reason that I chose NixOS as the new distrohop target
is that I was aware that nixpkgs is the largest package repository in the world.
At that time, I like AUR very much because of its large number of packages,
and I thought that NixOS may even be better than Arch Linux in this regard.

## Initial setup

I followed the graphical installer to install NixOS on my system.
My laptop was shipped with a 500 GB SSD installed with Windows 11
and an extra NVMe SSD slot, where I installed a 2 TB SSD and installed Ubuntu on it.
Because I almost never use Windows since I bought this laptop,
I wiped the Windows partition and installed NixOS on it.

The initial setup was quite smooth
although there were some (quite expected) hiccups regarding the NVIDIA GPU.
To utilize both the integrated GPU and the discrete NVIDIA GPU,
I tried both the offload mode and the sync mode.
The offload mode should be more desirable,
but it does not support changing the layout of monitors,
so I had to use the sync mode instead.

Other than that, setting up the system was just as easy as
listing all the packages that I want to install in the `configuration.nix` file
and running `nixos-rebuild switch` to apply the changes.

## Packaging

Although nixpkgs has more packages than AUR by the numbers,
in practice, I do not feel that way.
While the applications that I want to use are usually available on AUR,
it is often not the case for nixpkgs.
Besides, because NixOS does not obey the FHS,
applications usually cannot run out of the box as the developers distributed them.
For both of these reasons,
I find it more necessary to package applications myself on NixOS
than on any other Linux distro.

However, packaging applications for Nix/NixOS is not an easy task.
An important knowledge to know is that Nix is different from nixpkgs.
Nix is a functional programming language and a package manager,
while nixpkgs is a very large Nix expression that contains many packages
and convenience tools for packaging them.
Packaging applications with Nix without using nixpkgs is very tedious and difficult,
so normally one would use nixpkgs to package applications.

There are several problems with nixpkgs, though, that makes packaging somewhat difficult.
The first problem is that it is not well documented.
There is an official nixpkgs manual,
but it hardly covers everything and it is very hard to navigate
(and you need a good browser to read it properly
because the HTML is so large that browsers that are not well-optimized
often gets stuck when rendering it).
Many good practices cannot be learnt from the manual
but must be learnt from others when they review your pull requests.

The second problem is that it is simply too large.
Cloning such a large Git repository with so many files and commits
can be very slow on a computer with a slow CPU, a slow disk, or a slow network connection.
Also because of its size,
evaluating nixpkgs as a Nix expression takes a long time.

Anyway, in the end, I managed to package some applications that I use
and got them merged into nixpkgs.
Up until now, I have opened 40 pull requests to nixpkgs,
among which 26 have been merged.
I can say that I am a mildly experienced package maintainer for nixpkgs now,
but packaging is still a challenging task for me.

## Storage hunger

The two biggest problems that I have with NixOS are,
first, that I always have to spend a lot of time to compile things when I upgrade the system,
and second, that my 470 GB root partition
(containing `/nix/store`) is not large enough for my daily use.

When I upgrade the system,
I must do the following steps to avoid running out of disk space:

- Delete all `result` links to prevent them from holding GC roots.
- Delete all generations except the current running one and run a garbage collection.
- Delete all Docker images, containers, and volumes, if they are large.
- Delete old journalctl logs.

Then, `nixos-rebuild` may still not succeed without running out of disk space.
I then have to run `nix-store --optimize` to squeeze some more space out for the packages that were just built.
Then, `nixos-rebuild` can just barely finish without running out of disk space.
In the end, the space usage will be sitting at 98% or 99%, with only a few gigabytes left.
Then, I would reboot the system to check that the new generation works,
and then I would delete the previous generation right away to free up some space.

At this rate, I will reach the point where I can no longer fully upgrade the system any more
in one `nixos-rebuild` call because of the disk space issue.
I will then have to first upgrade my system but only including
a smaller set of packages,
boot into the new generation,
delete the old generation,
and then install the full set of packages.
Otherwise, I will have to buy a larger SSD.
