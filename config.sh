#!/bin/bash

ghostblog_url="https://vittegleo.com"

ghostblog_build_folder="build_ghostblog"
ghostblog_proxy_build_folder="build_ghostblog_proxy"

ghostblog_image_name="9df8/ghostblog"
ghostblog_container_name="ghostblog"
ghostblog_proxy_image_name="9df8/ghostblog_proxy"
ghostblog_proxy_container_name="ghostblog_proxy"

data_folder="data"
ghost_data_folder="${data_folder}/ghostblog_data"
ghost_config_file="${ghost_data_folder}/config.js"
cert_folder="${data_folder}/certificates"
ssl_crt="${cert_folder}/server.crt"
ssl_key="${cert_folder}/server.key"
nginx_sites_folder="${data_folder}/sites-enabled"
nginx_ghost_conf="${nginx_sites_folder}/ghost.conf"