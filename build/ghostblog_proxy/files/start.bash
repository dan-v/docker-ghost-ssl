#!/bin/bash

# Replace with upstream ghost container details (assumes container is being linked)
sed -i "/\ \ server /c\ \ server ${GHOSTBLOG_PORT_2368_TCP_ADDR}:${GHOSTBLOG_PORT_2368_TCP_PORT};" /etc/nginx/sites-enabled/*.conf

# Start nginx
nginx