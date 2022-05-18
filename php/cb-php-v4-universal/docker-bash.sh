#!/bin/bash
# author: Ray Cardillo circa 2022

contName="$1"

if [ -z "$contName" ]
then
  echo "Usage: $(basename $0) <docker container name>"
  #exit 1
  contName=$(basename "$PWD" | tr [:upper:] [:lower:])
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


echo "Calling $DOCKER start/exec with container: $contName"
$DOCKER start "$contName" \
&& \
$DOCKER exec -it "$contName" /bin/bash
