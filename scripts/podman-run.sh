#!/bin/bash
# author: Ray Cardillo circa 2022

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

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

$SCRIPT_DIR/podman-start.sh

echo "Calling docker run with image: $imageName"
podman run --name "$contName" -it "$imageName"
