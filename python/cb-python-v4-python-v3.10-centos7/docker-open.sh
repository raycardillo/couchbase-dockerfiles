#!/bin/bash
# author: Ray Cardillo circa 2022

echo "Make sure the Docker Desktop app is already running."

unameOut="$(uname -s)"
case "${unameOut}" in
  Linux*)
    machine=Linux
    ;;
  Darwin*)
    machine=Mac
    open -j /Applications/Docker.app
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
