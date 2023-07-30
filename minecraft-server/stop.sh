#!/bin/zsh

MC_CONTAINER=

docker kill $MC_CONTAINER
docker ps --filter "name=$MC_CONTAINER"
