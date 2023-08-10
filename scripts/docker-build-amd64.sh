#!/bin/bash
# author: Ray Cardillo circa 2022

# NOTE: Enable the "Use Rosetta for x86/amd64 emulation on Apple Silicon" feature when running on an M1 mac.

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

imageName="$1"

if [ -z "$imageName" ]
then
  echo "Usage: $(basename $0) <docker image name>"
  #exit 1
  imageName=$(basename "$PWD" | tr [:upper:] [:lower:])
  echo "Using default image name: $imageName"
fi

$SCRIPT_DIR/docker-open.sh

# using --no-cache to make sure a clean build is done
docker build --platform linux/amd64 --no-cache -t "$imageName" ./context

