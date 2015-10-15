#!/bin/sh
### nano /etc/cron.daily/autoblock.sh
### chmod +x /etc/cron.daily/autoblock.sh
#### piwik spam blocklist
mkdir -p /home/gagomap/tools/referrer_spam
\curl -sSL https://raw.githubusercontent.com/almer-t/tools/master/referrer_spam/nginx-refspam-config-gen.py > /home/gagomap/tools/referrer_spam/nginx-refspam-config-gen.py

### More nginx blacklist from oohnoitz
\curl -sSL https://raw.githubusercontent.com/oohnoitz/nginx-blacklist/master/blacklist.conf > /etc/nginx/conf.d/blacklist.conf

###More spam blacklist from Stevie-Ray
\curl -sSL https://raw.githubusercontent.com/Stevie-Ray/apache-nginx-referral-spam-blacklist/master/referral-spam.conf > /etc/nginx/conf.d/referral-spam.conf

### More nginx blacklist from mariusv
\curl -sSL https://raw.githubusercontent.com/mariusv/nginx-badbot-blocker/master/blacklist.conf > /etc/nginx/conf.d/nginx-badbot-blocker.conf

### ###More spam blacklist from cba85
\curl -sSL https://raw.githubusercontent.com/cba85/nginx-spam-referral/master/blacklist.conf > /etc/nginx/conf.d/cba85-nginx-referer-spam.conf

### Create Piwik blacklist
chmod +x /home/gagomap/tools/referrer_spam/nginx-refspam-config-gen.py
/home/gagomap/tools/referrer_spam/nginx-refspam-config-gen.py -f
