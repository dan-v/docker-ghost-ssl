#!/bin/bash

cd $(dirname $0)

. config.sh

echo "Stopping and removing ${ghostblog_container_name} container"
docker stop ${ghostblog_container_name} > /dev/null 2>&1
docker rm --force ${ghostblog_container_name} > /dev/null 2>&1

echo "Stopping and removing ${ghostblog_proxy_container_name} container"
docker stop ${ghostblog_proxy_container_name} > /dev/null 2>&1
docker rm --force ${ghostblog_proxy_container_name} > /dev/null 2>&1