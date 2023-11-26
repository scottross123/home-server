#!/bin/bash

DOCKER_REPO=/srv/docker

if [ -z "$1" ]; then
  echo ERROR, you must pass a stack you wish to deploy
  exit 1;
fi

for stack in "$@"; do
  if [ ! -d "$DOCKER_REPO/stacks/$stack" ]; then
    echo ERROR, stack \"$stack\" does not exist. Mispelling maybe?
    continue
  fi
  docker stack deploy -c <(cat $DOCKER_REPO/stacks/common.yml $DOCKER_REPO/stacks/$stack/stack.yml) $stack
done
