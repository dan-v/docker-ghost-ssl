#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Must give blog URL as parameter (e.g. https://test.com)"
    exit 1
fi
ghostblog_url=$1

cd $(dirname $0)

. config.sh

check=$(docker logs ${ghostblog_container} > /dev/null 2>&1)
if [ $? -eq 0 ]; then
	echo "Container ${ghostblog_container} is still running. Exiting."
	exit 1
fi

check=$(docker logs ${ghostblog_proxy_container} > /dev/null 2>&1)
if [ $? -eq 0 ]; then
	echo "Container ${ghostblog_proxy_container} is still running. Exiting."
	exit 1
fi

if [ ! -f ${ssl_crt} ]; then
    echo "Need to put SSL certificate at ${ssl_crt}. Exiting."
    exit 1
fi

if [ ! -f ${ssl_key} ]; then
    echo "Need to put SSL key at ${ssl_crt}. Exiting."
    exit 1
fi

if [ ! -f ${nginx_conf} ]; then
    echo "Need to nginx conf file at ${nginx_conf}. Exiting."
    exit 1
fi

if [ ! -f ${ghost_config_file} ]; then
    echo "Need Ghost ${ghost_config_file} file. Exiting."
    exit 1	
fi

echo "Updating ${ghost_config_file} with blog url ${ghostblog_url}"
sed -i "/url:/c\ \ \ \ \ \ \ \ url:\ '${ghostblog_url}', " ${ghost_config_file}
if [ $? -ne 0 ]; then
	echo "Failed to update ${ghost_config_file}. Exiting."
	exit 1
fi

echo "Starting container ${ghostblog_container_name}"
sleep 1
start=$(docker run -d -p 2368 --name ${ghostblog_container_name} -v $(pwd)/${ghost_data_folder}:/ghost-override ${ghostblog_image_name})
if [ $? -ne 0 ]; then
	echo "Container ${ghostblog_container_name} failed to start. Exiting."
	exit 1
fi

echo "Starting container ${ghostblog_proxy_container_name}"
sleep 1
start=$(docker run -d -p 80:80 -p 443:443 --name ${ghostblog_proxy_container_name} --link ${ghostblog_container_name}:${ghostblog_container_name} -v $(pwd)/${cert_folder}:/etc/nginx/certificates -v $(pwd)/${nginx_sites_folder}:/etc/nginx/sites-enabled ${ghostblog_proxy_image_name})
if [ $? -ne 0 ]; then
	echo "Container ${ghostblog_proxy_image_name} failed to start. Exiting."
	exit 1
fi

echo "Blog is now up and running.."