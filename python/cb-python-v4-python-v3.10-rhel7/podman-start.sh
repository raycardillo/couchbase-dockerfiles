#!/bin/bash
# author: Ray Cardillo circa 2022

echo "Make sure the podman machine is already started."

unameOut="$(uname -s)"
case "${unameOut}" in
  Linux*)
    machine=Linux
    ;;
  Darwin*)
    machine=Mac
    ;;
  CYGWIN*)
    machine=Cygwin
    ;;
  MINGW*)
    machine=MinGw
    ;;
  *)
    machine="UNKNOWN:${unameOut}"
esac

podman machine start
