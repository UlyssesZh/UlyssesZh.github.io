---
title: 'How to self-host Overleaf (ShareLaTeX)'
date: 2023-09-29 11:11:38 -0700
categories:
- guide
tags:
- linux
- selfhosting
- tex
layout: post
excerpt: 'It has been a pain setting up Overleaf on my own server.
I have finally figured it out and I am sharing my notes here.'
---

Install Docker and NGINX before you go.
Replace every `overleaf.your-domain.com` with your own domain name.

## Set up NGINX

```nginx
server {
	listen 80;
	listen [::]:80;
	server_name overleaf.your-domain.com;
	return 301 https://$host$request_uri;
}
server {
	listen 443 ssl;
	listen [::]:443 ssl;
	server_name overleaf.your-domain.com;
	ssl_certificate /path/to/your/cert/fullchain.pem;
	ssl_certificate_key /path/to/your/cert/privkey.pem;
	location / {
		proxy_set_header Host $host;
		proxy_pass http://localhost:8444; # use a port you like
		proxy_redirect off;

		proxy_http_version 1.1;
		proxy_set_header Upgrade $http_upgrade;
		proxy_set_header Connection $connection_upgrade;
		proxy_set_header X-Scheme $scheme;

		proxy_buffering off;
	}
	location ~ /.well-known {
		allow all;
	}
}
```

## Set up ShareLaTeX

*Refer to*:
[quick start guide](https://github.com/overleaf/toolkit/blob/master/doc/quick-start-guide.md){target="_blank"}.

Run the following:

```shell
OVERLEAF_HOME=./overleaf # set to whatever you want; sudo in following if not having write access
git clone https://github.com/overleaf/toolkit.git $OVERLEAF_HOME
cd $OVERLEAF_HOME
bin/init
```

*Notice*: You may look at `git log -n 1 --pretty=format:"%H"`.
Mine was `cc4d01bb46d4e0d7c08124372ff69a4578e7333d`.
I can guarantee that the following steps work with this version of Overleaf toolkit,
but may fail in future versions.

Edit `config/variables.env`, add the following:

```ini
# See https://github.com/overleaf/overleaf/issues/1044#issuecomment-1741289459
PATH=/usr/local/texlive/2023/bin/x86_64-linux:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

SHARELATEX_BEHIND_PROXY=true
# Do NOT set SHARELATEX_SECURE_COOKIE to true, see https://github.com/overleaf/overleaf/issues/388#issuecomment-1741162658

SHARELATEX_SITE_URL=https://overleaf.your-domain.com
# If you want, set SHARELATEX_APP_NAME, SHARELATEX_NAV_TITLE, SHARELATEX_HEADER_IMAGE_URL, SHARELATEX_ADMIN_EMAIL.

# Email settings, see https://github.com/overleaf/overleaf/issues/816#issuecomment-864665071
SHARELATEX_EMAIL_FROM_ADDRESS=Overleaf <your.email@domain.com>
# SHARELATEX_EMAIL_REPLY_TO does not seem to work.
SHARELATEX_EMAIL_SMTP_HOST=smtp.domain.com
SHARELATEX_EMAIL_SMTP_PORT=465
SHARELATEX_EMAIL_SMTP_SECURE=true
SHARELATEX_EMAIL_SMTP_USER=your.email@domain.com
SHARELATEX_EMAIL_SMTP_PASS=yourpassword
SHARELATEX_EMAIL_SMTP_TLS_REJECT_UNAUTH=false
SHARELATEX_EMAIL_SMTP_IGNORE_TLS=false

# Uncomment this when you want to debug:
#LOG_LEVEL=debug

# Search for process.env in github.com/overleaf/overleaf to see more options (shame for not documenting them):
# https://github.com/search?q=repo%3Aoverleaf%2Foverleaf+process.env&type=code
```

Edit these entries in `config/overleaf.rc`:

```ini
# Match the port in NGINX conf
SHARELATEX_PORT=8444
```

Create a file `config/docker-compose.override.yml` and write:

```yaml
---
version: '2.2'
services:
  mongo:
    restart: unless-stopped
    container_name: overleaf-mongo

  redis:
    restart: unless-stopped
    container_name: overleaf-redis

  sharelatex:
    restart: unless-stopped
    #image: sharelatex/sharelatex:with-texlive-full # will be uncommented later
    container_name: overleaf-sharelatex
    stop_grace_period: 10s # see https://github.com/overleaf/overleaf/issues/1156
```

Run `bin/up`.
Wait for the containers to be up.
Then, go to `https://overleaf.your-domain.com/launchpad` and set up the admin account.
Use `bin/logs` in another shell to check the logs if there are any issues.

## Set up TeXLive

*Refer to*:
[upgrading TeXLive](https://github.com/overleaf/toolkit/blob/master/doc/ce-upgrading-texlive.md){target="_blank"}.

While the containers are up, run `bin/shell` and run `tlmgr install scheme-full`.
You need to wait for a long time.

After that, run `docker commit overleaf-sharelatex sharelatex/sharelatex:with-texlive-full`.
Then, edit `config/docker-compose.override.yml` and uncomment the line `image: sharelatex/sharelatex:with-texlive-full`.
Then, run

```shell
bin/stop
bin/docker-compose rm -f sharelatex
bin/up
```

When you upgrade later,
you need to re-comment the line in `config/docker-compose.override.yml`, delete the container,
and do the above steps again.
