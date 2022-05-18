#!/bin/bash
# author: Ray Cardillo circa 2022

imageName="$1"
contName="$2"

if [ -z "$imageName" ]
then
  echo "Usage: $(basename $0) <docker image name> <docker container name>"
  #exit 1
  imageName=$(basename "$PWD" | tr [:upper:] [:lower:])
  contName="$imageName"
  echo "Using default image name: $imageName"
  echo "Using default container name: $contName"
fi

if [ -z "$contName" ]
then
  echo "Usage: $(basename $0) <docker image name> <docker container name>"
  #exit 1
  contName="$imageName"
  echo "Using default container name: $contName"
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

echo "Calling $DOCKER run with image: $imageName"
$DOCKER run --name "$contName" -it "$imageName"
