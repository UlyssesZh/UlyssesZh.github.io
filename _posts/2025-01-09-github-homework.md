---
title: Why it is a bad idea to use GitHub for submiting school homework
date: 2025-01-09 23:51:35 -0800
categories:
- misc
tags:
- programming
- github
- school
layout: post
excerpt: 'It is common for school courses to require students to submit their homework using GitHub.
However, this is usually a bad idea for several reasons.'
---

*Do not take this artical as legal advice because I am not a lawyer.*

---

It is common for school courses to require students to submit their homework using GitHub,
especially in college-level courses offered in universities,
but this may not be the best idea.

The first reason why GitHub is not suitable for that is that it is not controlled by the school.
GitHub has its own terms of service (TOS), which students must agree to.
This may not sound bad because it is not hard for students to do so,
but the course instructors may be
**forcing students to violate the TOS**
by "threatening" that they will get a bad grade otherwise.
There are different possible reasons why the instructors may be doing this.
Maybe they are not familiar with the TOS enough;
maybe they are just not familar enough with GitHub
to come up with an actually good way of managing homework;
or maybe they are aware of that but do not care.

What is the big deal?
Why is it bad to violate the TOS?
Well, the GitHub account of a student may be really important to him:
he may be contributing to dozens of open-source projects,
or he may be presenting his GitHub username in his resume.
This account is not only important for the owner himself,
it is also important for the community:
some of the repositories that the account owns may be very popular projects;
there may be hundreds of people following the account
because they are interested in the work of its owner;
important webpages (hosted on GitHub Pages) or
important package registries (hosted on GitHub Packages) may be associated with the account;
and many pages on the internet may be linking to contents of the account.
Now, if the account violates the TOS, it may be subject to being suspended,
losing privileges, or getting hidden from the public,
any of which may cause a lot of harm to the owner and the community.
Because of violation of TOS, the account owner may face trouble when reaching GitHub support
because it tends to refuse to help users who violate the TOS.

What about creating a new account just for the course?
Yes, it sounds like a effective and simple solution, only if it is allowed by the TOS.
Actually, the TOS explicitly prohibits one person to own multiple non-bot accounts:

> <p class="no-indent">
> One person or legal entity may maintain no more than one free Account
> (if you choose to control a machine account as well,
> that's fine, but it can only be used for running a machine).
> </p>

<p class="no-indent">
Therefore, it is still a violation of TOS to create a new account just for the course.
People may argue that GitHub will not know whether different accounts are owned by the same person,
but the answer is it will know if it really wants to know.
Also, even if it does not ban the account for this reason,
it is still possible for GitHub support to ignore the tickets filed by the account owner
because his violation of the TOS.
There are actually multiple real-life cases of this.
</p>

What is worse is that the students do not have a proper way to defend against this.
The most likely case that will happen is that all the students are not familiar enough with the TOS
to discover that the instructors are forcing them to violate the TOS.
The consequences of the violation may only appear long after they are out of the course
or even long after they graduate.
There is no way they can trace back to the instructors
and ask them to take responsibility for the harm they have caused.
Even if there is a student that discovers the potential problem in violating the TOS
and sends an email to the instructors to ask for a change in the policy of the course,
it is still up to the instructors to decide whether
they are actually going to do that.
If they are, it is good, but if they are not,
there is no place for the student to appeal to.
GitHub will not care about this because the account owner takes all the responsibility
in the issues related to his account.
The school will not care about this because the course is still "fair" for the students.
Other students will not care about this because most of them are
not going to heavily use their GitHub accounts after the course or after they graduate.

After saying so much about the consequences of the instructors forcing students to violate the TOS,
what are the TOS that may be violated?
The first one is the one mentioned above: multiple accounts.
Instructors may tell students to create a new account just for the course,
or they may tell students to do so if they do not feel comfortable
using their existing personal account for the course,
due to ignoring or not knowing that this is a violation of the TOS.

Another TOS that may be violated is the one that enforces the right for
GitHub users to fork public repositories.
The instructors may tell students to comply with academic integrity codes
by stating that the work done in the repo must not be "plagiarized".
However, not only is this not enforceable,
but it also violates the TOS of GitHub because any public repository
grants the right for other GitHub users to freely use and create their own copies:

> <p class="no-indent">
> If you set your pages and repositories to be viewed publicly,
> you grant each User of GitHub a nonexclusive, worldwide license
> to use, display, and perform Your Content through the GitHub Service and
> to reproduce Your Content solely on GitHub as permitted
> through GitHub's functionality (for example, through forking).
> </p>

<p class="no-indent">
While this can be circumvented by making the repositories private,
many instructors do not allow using private repositories for homework for some reasons.
Maybe they do not want to bother managing the access permissions to many students' private repositories,
or maybe they are only coping with the academic integrity codes
without actually enforcing it.
</p>

---

Besides violation of the TOS, the instructors may also be
**forcing students to do harm to their own**.
One example is that
some instructors force the names of the repositories that students create for homework,
and the repositories must be under the account of the student
(so no designated GitHub organization for that).
However, the names of the repositories under the same account must be unique,
which means that students may have to delete or rename their old repositories.
This definitely is doing harm to the account as well as the community
because it breaks the links to the old repositories,
and students have to do this because their grades are at stake.

Another harm that using GitHub for schoolwork can cause is the privacy issue.
If the repositories are public, people can see the work of the students
and infer school information from them.
If the repositories are private,
people can still see when the repositories are created and updated,
which may be enough to infer school information.
Because the GitHub account is also used by the student to communicate with
other people in the open-source community on the internet,
the partial disclosure of these information may cause harm to the student
by enabling others to identify his real-life identity.

Another harm is that the school activities may be "polluting" the GitHub account activities
and thus affecting the students' reputation in the community.
Some people may be following the account because they are interested in the work of the student,
but if the student starts using the account for schoolwork,
the account activities will be filled with schoolwork activities for some time,
which may not be the things that the student may want to show to the followers.
This may cause the followers to unfollow the account.
It is similar to the situation where the instructors ask students to upload public videos
using their personal YouTube accounts for schoolwork,
which can do harm to the students if they are already popular YouTubers.
However, YouTube actually allows one account to have multiple channels,
so that does not have negative effects like GitHub.

---

The third reason why GitHub is not suitable for submitting school homework is that
the school has no control over the service.
GitHub is also probably not receiving any money from the school
to take the responsibility of providing the service for schoolwork purposes.
Apparently, **GitHub can refuse its service for any or no reason**:

> <p class="no-indent">
> GitHub has the right to suspend or terminate your access
> to all or any part of the Website at any time, with or without cause, with or without notice, effective immediately.
> GitHub reserves the right to refuse service to anyone for any reason at any time.
> </p>

<p class="no-indent">
This means that students have to "pray" that GitHub will continue be reliable
for them to keep using it for schoolwork.
If GitHub decides to stop providing services for some students,
their grades may get penalized because they cannot submit their homework,
and this situation is definitely possible considering that the students may actually
be violating the TOS of GitHub whether for the course or not.
GitHub will not care about this because the account owner takes all the responsibility.
The instructor or the school may not care about this because
they may deem the students' own fault to be the cause of the suspension of the service.
There is simply no way for students to tackle this situation.
</p>

This situation is very different from other third-party services,
such as Google Workspace, Zoom Workplace, or Microsoft 365,
because the school is actually paying for the service
so that the providers are liable to provide the service.

There is indeed paid services provided by GitHub, though,
such as GitHub Enterprise, which may actually be suitable for school contexts.
However, the school is not motivated to pay for the service
because the free services provided by GitHub are already enough for educational purposes.

---

The fourth reason of not using GitHub for schoolwork is that
Git and GitHub are just too difficult to use while being designed to be user-friendly.
This causes an awkward situation:
it does not worth a full course designated to teach Git and GitHub,
but it would also have to take up a considerable part of a course
to teach all the relevant best practices of Git and GitHub to students.
This leads to the problem of
**students actually misusing Git and GitHub when learning it in school**
because instructors may not bother to spend time to teach them Git
instead of teaching the actually relevant course materials.
Not to mention that the instructors may intentionally tell students to follow bad practices
because GitHub is missing on LMS (learning management system) features
to conveniently suit schoolwork needs
or because the instructors are simply not aware of better practices.
It is also possible that the instructor just does not want to bother teaching those practicies
because most students are not going to use Git and GitHub after the course or after they graduate.

One common bad practice that especially happens in school contexts
is to use Git to manage frequently-updated binary files.
While it is arguable whether Git should be used to manage binary files at all,
it definitely causes resource waste to use Git to manage frequently-updated binary files
because diffs on them can only be resolved if the old version mathces exactly.
Also, in most cases, it is impossible to efficiently store the history version of binary files
by storing deltas between versions.
Another common bad practice is to include running results of the code in the repository.
Instead, they should be produced by CI systems (e.g. GitHub Actions)
and stored in the artifacts of the CI systems (e.g. GitHub releases or GitHub Packages).
A worse common bad practice is that some instructors are just using GitHub as a file hosting service
instead of a version control system.
They may tell students to upload their homework as a zip file or tarball on GitHub,
which is really confusing because you can actually
download the tarball of a repository directly on GitHub.
The list of bad practices can go on.

Some may argue that the problem of teaching bad practices can happen in any course
besides those use GitHub for homework submission.
Some incapable instructors may even teach false information in the course,
which is just inevitable.
However, the problem especially with GitHub is that GitHub is also the place
where worldwide developers form the community,
and a concensus on good practices is important for a community.
Having students employ bad practices on GitHub may affect the atmosphere of the community
and can also cause resource wasting from the perspective of GitHub the platform.
This is different from usual academic situations because,
in most academic situations, misusage can only propagate through paper publications
and academic conferences,
which are much more formal and have a much higher barrier of entry than GitHub.

---

The final reason of not using GitHub for schoolwork is that
**GitHub is not a learning management system (LMS)**.
It lacks essential features that are needed for schoolwork.

There are existing LMS softwares that are designed to be used in school contexts,
suited for material distribution, homework submission and collection, grading,
communication, and so on,
designed with the consideration of being used by the instructors, graders, students,
and possibly other roles.
There are even open-source ones that can actually be self-hosted by the school such as Canvas
(I am a big fan of Canvas).

What is more devious is that,
in order to use the workflow of the existing LMS, some instructors ask students
to submit their homework in the LMS after they finish it on GitHub.
Sometimes instructors ask students to submit a GitHub link in the LMS.
While this may seem like a good idea,
some instructors may ask students to submit wierd things
such as a PDF consisting of screenshots of webpages on GitHub
so that graders can annotate using the features shipped with the LMS.
These are just inefficient ways of working around the limitations
of the LMS and GitHub.

If the course needs to use GitHub for source version control,
CI/CD, or other software development-related purposes,
besides normal LMS features such as homework submission and grading,
there is a LMS provided GitHub dedicated for that purpose called GitHub Classroom.
Though it looks very promising,
it seems rare for schools to actually use it,
so I have never used it myself.
