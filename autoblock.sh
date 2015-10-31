#!/bin/sh
### nano /etc/cron.daily/autoblock.sh
### chmod +x /etc/cron.daily/autoblock.sh
#### piwik spam blocklist
mkdir -p /home/gagomap/tools/referrer_spam
\curl -sSL https://raw.githubusercontent.com/almer-t/tools/master/referrer_spam/nginx-refspam-config-gen.py > /home/gagomap/tools/referrer_spam/nginx-refspam-config-gen.py

### More nginx blacklist from oohnoitz (gagomap clone to allow yandex)
\curl -sSL https://raw.githubusercontent.com/gagomap/nginx-blacklist/master/blacklist.conf > /etc/nginx/conf.d/blacklist.conf

### More spam blacklist from Stevie-Ray
\curl -sSL https://raw.githubusercontent.com/Stevie-Ray/apache-nginx-referral-spam-blacklist/master/referral-spam.conf > /etc/nginx/conf.d/referral-spam.conf

### More nginx blacklist from mariusv (add it to block.conf)
### \curl -sSL https://raw.githubusercontent.com/gagomap/nginx-badbot-blocker/master/blacklist.conf > /etc/nginx/conf.d/nginx-badbot-blocker.conf

### More bots blocker from gagomap
\curl -sSL https://raw.githubusercontent.com/gagomap/nginx-block-bots/master/block.conf > /etc/nginx/conf.d/block.conf
\curl -sSL https://raw.githubusercontent.com/gagomap/nginx-block-bots/master/GG-blacklist1.conf > /etc/nginx/conf.d/GG-blacklist1.conf

### 4G Bots and Referer Blocker from gagomap
\curl -sSL https://raw.githubusercontent.com/gagomap/4g-blacklists/master/4g-referer.conf > /etc/nginx/conf.d/4g-referer.conf
\curl -sSL https://raw.githubusercontent.com/gagomap/4g-blacklists/master/4g-badbots.conf > /etc/nginx/conf.d/4g-badbots.conf

### GG Blacklist

### Create Piwik blacklist
chmod +x /home/gagomap/tools/referrer_spam/nginx-refspam-config-gen.py
/home/gagomap/tools/referrer_spam/nginx-refspam-config-gen.py -f
