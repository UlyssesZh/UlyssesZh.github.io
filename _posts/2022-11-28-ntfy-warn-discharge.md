---
title: 'Using ntfy to warn me when my computer is discharging'
date: 2022-11-28 15:50:50 -0800
categories:
- programming
tags:
- selfhosting
- linux
layout: post
excerpt: 'I use udev and systemd to send a notification to my phone via ntfy automatically
whenever my laptop is discharging.'
---
I need to thank [one of my friends](https://orashshi.github.io){target="_blank"}
for giving me one of his old laptops.
We are now [using it as a self-hosting server](https://reddit.com/y5a1k0){target="_blank"}.

However, there is a problem around it:
the charging port of the laptop is a little bit broken,
which makes the connection to the charger loose.
One day, when I accidentally touched the laptop,
the charger disconnected from the laptop, and the laptop started discharging.
I was not aware of that until I found my services stopped working because the laptop shut down after some time.

Because I may run some important tasks or services on this laptop,
I need a way to get aware when the laptop starts discharging.

I found the way when I saw [ntfy](https://ntfy.sh){target="_blank"}.
It is a self-hostable pub-sub notification service.
All I need to do is to [host ntfy on my server](https://docs.ntfy.sh/install){target="_blank"}
and let my laptop publish a notification on it whenever it starts discharging.

To make my laptop run commands automatically when it switches the power source (AC or battery),
I can [write udev rules](http://www.reactivated.net/writing_udev_rules.html){target="_blank"}.
For example, to run `touch /tmp/discharging` when the laptop starts discharging, I can write the following rule
(write it to a file in `/etc/udev/rules.d/` and run `udevadm control --reload-rules` to apply it):

```ruby
SUBSYSTEM=="power_supply", ATTR{online}=="0", RUN+="/usr/bin/touch /tmp/discharging"
```

However, I cannot just replace the `touch` command here with a `ntfy` command or a `curl` command
because udev cannot run commands with access to the internet.
Actually, we can find in `systemd-udevd.service`:

```systemd
[Unit]
IPAddressDeny=any
```

If you write any commands that try to access the internet in the udev rule,
you will get errors of being unable to resolve hosts or connection time out.

Nevertheless, udev can trigger systemd services that can have access to the network. Write a
[systemd service](https://www.freedesktop.org/software/systemd/man/systemd.service.html){target="_blank"}
file as such, and name it `curl-ntfy.service` for example:

```systemd
[Unit]
Description=Notify about discharging
After=network.target

[Service]
Type=oneshot
ExecStart=/opt/curl-ntfy/curl-ntfy
```

Here, `/opt/curl-ntfy/curl-ntfy` is the script that sends a notification to ntfy.
The contents of the script are:

```ruby
#!/usr/bin/env ruby
require 'yaml'
require 'uri'
require 'net/http'

CONFIG_FILENAME = ARGV[0] || File.join(__dir__, 'config.yml')
CONFIG = YAML.load_file CONFIG_FILENAME

PROTOCOL = CONFIG['use_https'] ? 'https' : 'http'
HOST = CONFIG['host']
TOPIC = CONFIG['topic']
HEADERS = CONFIG['headers']
CONTENTS = CONFIG['contents']

uri = URI "#{PROTOCOL}://#{HOST}/#{TOPIC}"
res = Net::HTTP.post uri, CONTENTS, HEADERS
# p res
# puts res.body
```

This is a Ruby script that basically reads the configuration from `config.yml`
and sends a POST request to the ntfy server according to the configurations.
The `config.yml` is, for example:

```yaml
host: ntfy.sh
topic: discharge-warning
use_https: true
headers:
  Title: Discharge warning
  Priority: urgent
contents: Your laptop is discharging
```

Finally, write a udev rule to make the systemd service triggered whenever the laptop starts discharging:

```ruby
SUBSYSTEM=="power_supply", ATTR{online}=="0", TAG+="systemd", ENV{SYSTEMD_WANTS}="curl-ntfy.service"
```

Hooray! Now, try unplugging the charger and see if you get a notification on your phone.
