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

./docker-open.sh

echo "Calling docker start/exec with container: $contName"
docker start "$contName" \
&& \
docker exec -it "$contName" /bin/bash
