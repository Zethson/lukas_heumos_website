#!/bin/bash
# Reference:
# https://www.digitalocean.com/community/tutorials/how-to-serve-flask-applications-with-gunicorn-and-nginx-on-ubuntu-18-04

apt-get update

apt-get install python3-pip python3-dev nginx -y

pip3 install virtualenv

cd ~

git clone https://github.com/Zethson/lukas_heumos_website

cd lukas_heumos_website

virtualenv dpenv

source dpenv/bin/activate

pip3 install gunicorn

python setup.py clean --all install

cp /home/zeth/lukas_heumos_website/deployment_scripts/lukas_heumos_website.service \
/etc/systemd/system/lukas_heumos_website.service

systemctl start lukas_heumos_website

systemctl enable lukas_heumos_website

cp /home/zeth/lukas_heumos_website/deployment_scripts/lukas_heumos_website \
/etc/nginx/sites-available/lukas_heumos_website

ln -s /etc/nginx/sites-available/lukas_heumos_website /etc/nginx/sites-enabled

nginx -t

systemctl restart nginx

ufw delete allow 5000

ufw allow 'Nginx Full'

add-apt-repository ppa:certbot/certbot -y

apt install python-certbot-nginx -y

certbot --nginx -d lukasheumos.com -d www.lukasheumos.com --non-interactive --agree-tos -m lukas.heumos@posteo.net







