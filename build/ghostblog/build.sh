#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Must give image name as parameter. Exiting."
    exit 1
fi

image_name=$1

cd $(dirname $0)
echo "Started building image ${image_name}"
docker build -t ${image_name} .
if [ $? -ne 0 ]; then
	echo "Failed to build ${image_name}"
	exit 1
else 
	echo "Finished building image ${image_name}"
	exit 0
fi