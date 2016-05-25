#!/bin/sh

### nano /etc/cron.daily/autoblock.sh
### chmod +x /etc/cron.daily/autoblock.sh
### sh /etc/cron.daily/autoblock.sh
### nginx -t && service nginx restart
#### piwik spam blocklist

mkdir -p /home/gagomap/tools/referrer_spam
\curl -sSL https://raw.githubusercontent.com/gagomap/tools/master/referrer_spam/nginx-refspam-config-gen.py > /home/gagomap/tools/referrer_spam/nginx-refspam-config-gen.py

echo "###################################################################"
### More nginx blacklist from oohnoitz (gagomap clone to allow yandex) (bad-client)
echo "Install nginx blacklist from oohnoitz (bad-client) "
\curl -sSL https://raw.githubusercontent.com/gagomap/nginx-blacklist/master/blacklist.conf > /etc/nginx/conf.d/blacklist.conf

### More spam blacklist from Stevie-Ray (bad_referer)
echo "Install referer blacklist Stevie-Ray (bad_referer) "
\curl -sSL https://raw.githubusercontent.com/Stevie-Ray/apache-nginx-referral-spam-blacklist/master/referral-spam.conf > /etc/nginx/conf.d/referral-spam.conf

### More nginx blacklist from mariusv (add it to block.conf)
echo "Install nginx blacklist from mariusv (bad_mariusv_referer and bad_mariusv_bot) "
\curl -sSL https://github.com/gagomap/nginx-badbot-blocker/blob/master/blacklist.conf > /etc/nginx/conf.d/nginx-badbot-blocker.conf

### More bots blocker from gagomap (limit_bots and ggbad_bots)
# echo "Install more bots blocker from gagomap (limit_bots and ggbad_bots) "
# \curl -sSL https://raw.githubusercontent.com/gagomap/nginx-block-bots/master/block.conf > /etc/nginx/conf.d/block.conf
# \curl -sSL https://raw.githubusercontent.com/gagomap/nginx-block-bots/master/gg-blacklist1.conf > /etc/nginx/conf.d/gg-blacklist1.conf

### 4G Bots and Referer Blocker from gagomap
# echo "Install 4G Bots and Referer (4gbad_bots and 4gbad_referers) "
# \curl -sSL https://raw.githubusercontent.com/gagomap/4g-blacklists/master/4g-referer.conf > /etc/nginx/conf.d/4g-referer.conf
# \curl -sSL https://raw.githubusercontent.com/gagomap/4g-blacklists/master/4g-badbots.conf > /etc/nginx/conf.d/4g-badbots.conf

### Create Piwik blacklist (piwik_referer)
echo "Install Piwik blacklist (piwik_referer) "
chmod +x /home/gagomap/tools/referrer_spam/nginx-refspam-config-gen.py
/home/gagomap/tools/referrer_spam/nginx-refspam-config-gen.py -f
