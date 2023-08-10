#!/bin/bash
# author: Ray Cardillo circa 2022

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

contName="$1"

if [ -z "$contName" ]
then
  echo "Usage: $(basename $0) <docker container name>"
  #exit 1
  contName=$(basename "$PWD" | tr [:upper:] [:lower:])
  echo "Using default container name: $contName"
fi

$SCRIPT_DIR/podman-start.sh

echo "Calling docker start/exec with container: $contName"
podman start "$contName" \
&& \
podman exec -it "$contName" /bin/bash
