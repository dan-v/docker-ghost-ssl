#!/bin/bash

ghostblog_build_folder="ghostblog"
ghostblog_proxy_build_folder="ghostblog_proxy"

cd $(dirname $0)

. ../config.sh

./${ghostblog_build_folder}/build.sh ${ghostblog_image_name}
if [ $? -ne 0 ]; then
	exit 1
fi

./${ghostblog_proxy_build_folder}/build.sh ${ghostblog_proxy_image_name}
if [ $? -ne 0 ]; then
	exit 1
fi