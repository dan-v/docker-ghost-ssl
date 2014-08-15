#!/bin/bash

# Replace with upstream ghost container details
sed -i "/\ \ server /c\ \ server ${GHOSTBLOG_PORT_2368_TCP_ADDR}:${GHOSTBLOG_PORT_2368_TCP_PORT};" /etc/nginx/sites-enabled/ghost.conf

# Start nginx
nginx