#!/bin/zsh

CONTAINER_ID=$(docker ps --filter name="minecraft_mc*" -q)
docker container exec -it $CONTAINER_ID rcon-cli
