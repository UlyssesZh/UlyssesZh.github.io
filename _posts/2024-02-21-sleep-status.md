---
title: Letting people know when you are asleep
date: 2024-02-21 02:26:45 -0800
categories:
- guide
tags:
- android
- github
layout: post
excerpt: 'While you are asleep, indicate that on your Discord and GitHub user status.'
---

While I have been trying to respond whenever people reach out to me,
it is impossible to be available 24/7 due to the simple fact that
[a human has to sleep to be alive](https://www.sleepfoundation.org/how-sleep-works/why-do-we-need-sleep).
While this is annoying, it is also a fact that I cannot change.

Therefore, a natural idea that comes to my mind is to simply let people know when I am asleep
so that they do not expect me to respond immediately.

Discord and GitHub have been among my most used platforms for some time,
and they both have a feature to let users set a custom status (with a custom text and an emoji).
This opens up a possibility of using a program to automatically set the status to indicate that I am asleep.

For Discord, this is as simple as invoking a REST API
([**Notice that this is against Discord's ToS**](https://support.discord.com/hc/en-us/articles/115002192352-Automated-user-accounts-self-bots)):

```shell
# Set sleeping status
curl -X PATCH \
	-H "Content-Type: application/json" \
	-H "Authorization: YoUr.DiScOrD.ToKeN" \
	-d '{"settings":"WhwKBQoDZG5kEhMKC1NsZWVwaW5nLi4uGgTwn5i0"}' \
	https://discord.com/api/v9/users/@me/settings-proto/1


# Clear sleeping status
curl -X PATCH \
	-H "Content-Type: application/json" \
	-H "Authorization: YoUr.DiScOrD.ToKeN" \
	-d '{"settings":"WgoKCAoGb25saW5l"}' \
	https://discord.com/api/v9/users/@me/settings-proto/1
```

If you wonder what those base64-encoded strings mean,
they are actually the binary contents of protobuf-encoded messages.
See [this `.proto` file](https://github.com/discord-userdoccers/discord-protos/blob/master/discord_protos/discord_users/v1/PreloadedUserSettings.proto)
for the definition of the message structure.

<details><summary>API v8</summary>

The commands written above was added when editing this article on July 20, 2025,
which uses API v9.
The latest API version as of originally writing this article was v8,
but now **using API v8 will get your account disabled**,
so do not use it!

```shell
# Set sleeping status
curl -X PATCH \
	-H "Content-Type: application/json" \
	-H "Authorization: YoUr.DiScOrD.ToKeN" \
	-d '{"custom_status":{"text":"Sleeping...","emoji_id":null,"emoji_name":"😴","expires_at":null},"status":"dnd"}' \
	https://discordapp.com/api/v8/users/@me/settings


# Clear sleeping status
curl -X PATCH \
	-H "Content-Type: application/json" \
	-H "Authorization: YoUr.DiScOrD.ToKeN" \
	-d '{"custom_status":null,"status":"online"}' \
	https://discordapp.com/api/v8/users/@me/settings
```

</details>

For GitHub, [there is not a REST API for that](https://github.com/orgs/community/discussions/108473),
but you can install the [user-status plugin](https://github.com/vilmibm/gh-user-status)
for [GitHub CLI](https://cli.github.com/):

```shell
gh extension install vilmibm/gh-user-status
```

<p class="no-indent">
Then, you can set the status with:
</p>

```shell
# Set sleeping status
gh user-status set 'Sleeping...' --emoji='sleeping' --limited

# Clear sleeping status
gh user-status set 'null' --expiry=1s
```

Now, the next step is to run these commands automatically when I fall asleep and wake up.
This can be done with [MacroDroid](https://www.macrodroid.com/),
which can trigger actions based on various triggers.
To run arbitrary commands, you can use [the Tasker plugin for Termux](https://f-droid.org/en/packages/com.termux.tasker/).
To have it working, one also needs to uncomment `allow-external-apps = true` in `~/.termux/termux.properties`,
and grant MacroDroid the permission to run Termux commands by

```shell
adb shell pm grant com.arlosoft.macrodroid com.termux.permission.RUN_COMMAND
```

MacroDroid supports using
the return value of [the sleep API](https://developers.google.com/location-context/sleep) to trigger an action,
but this tends to be quite unreliable on my device.
Therefore, I use it in conjunction with a quick setting tile that I can toggle manually.
The macro has two triggers:

- Fell Asleep / Woke Up (Android sleep API),
- Quick Tile On/Off,

<p class="no-indent">
and it has these actions:
</p>

```plain
If Trigger Fired: Woke Up, or Quick Tile Off
	If Sleeping = True
		Clear sleeping status on Discord and GitHub
		# Include other waking up logic here, such as turning off DND mode
	End If
	Sleeping = False
Else If Trigger Fired: Fell Asleep, or Quick Tile On
	If Sleeping = False
		Set GitHub and Discord user status to sleeping
		# Include other falling asleep logic here, such as turning on DND mode
	End If
	Sleeping = True
End If
```

By the way, I have a bunch of topics that I want to write blog articles about,
but I have been quite busy recently, so I may have to pause updating this blog for a while.
I hope I can get back to writing soon!
