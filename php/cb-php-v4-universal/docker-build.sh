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

if [ -f /etc/os-release ]
then
    . /etc/os-release
fi

DOCKER=docker

if [ "$ID" = "fedora" ]
then
    echo "Fedora Linux detected. Use podman instead of docker"
    DOCKER=podman
else
    echo "Making sure the Docker Desktop app is running"
    open -j /Applications/Docker.app
fi

# using --no-cache to make sure a clean build is done
$DOCKER build --no-cache -t "$imageName" .


