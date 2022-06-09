#!/bin/bash
# author: Ray Cardillo circa 2022

imageName="$1"

if [ -z "$imageName" ]
then
  echo "Usage: $(basename $0) <docker image name>"
  #exit 1
  imageName=$(basename "$PWD" | tr [:upper:] [:lower:])
  echo "Using default image name: $imageName"
fi

./docker-open.sh

# using --no-cache to make sure a clean build is done
docker build --platform linux/amd64 --no-cache -t "$imageName" ./context


