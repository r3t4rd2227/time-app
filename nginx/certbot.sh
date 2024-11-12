#!/bin/bash
certbot certonly --webroot -w /var/www/certbot \
    -d jbadeyi.xyz -d www.jbadeyi.xyz \
    --email jbadeyi@icloud.com --agree-tos --non-interactive --quiet
