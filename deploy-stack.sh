#!/bin/bash

DOCKER_REPO=/srv/docker

if [ -z "$1" ]; then
  echo ERROR, you must pass a stack you wish to deploy
  exit 1;
fi

for stack in "$@"; do
  if [ ! -d "stacks/$stack" ]; then
    echo ERROR, stack \"$stack\" does not exist. Mispelling maybe?
    continue
  fi
  docker stack deploy -c <(cat stacks/common.yml stacks/$stack/stack.yml) $stack
done
