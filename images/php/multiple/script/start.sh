#!/usr/bin/env bash
service php7.2-fpm start
service nginx start
tail -f /var/log/nginx/access.log