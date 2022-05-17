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

echo "Making sure the Docker Desktop app is running"
open -j /Applications/Docker.app

echo "Calling docker run with image: $imageName"
docker run --name "$contName" -it "$imageName"
