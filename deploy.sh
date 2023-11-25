#!/bin/bash

STACK=$1

# TODO accept multiple stacks and loop through them

if [ ! -z "$STACk" ]; then
  echo ERROR, you must pass a stack you wish to deploy
  exit 1;
fi

if [ ! -d "stacks/$STACK" ]; then
  echo ERROR, stack \"$STACK\" does not exist. Mispelling maybe?
  exit 1;
fi

docker stack deploy -c <(cat stacks/common.yml stacks/$STACK/docker-compose.yml) $STACK
