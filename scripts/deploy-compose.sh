#!/bin/bash

DOCKER_REPO=/home/scott/docker

if [ -z "$1" ]; then
  echo ERROR, you must pass an app you wish to deploy
  exit 1;
fi

for compose in "$@"; do
  COMPOSE_DIR=$DOCKER_REPO/compose/$compose
  if [ ! -d "$COMPOSE_DIR" ]; then
    echo ERROR, compose \"$compose\" does not exist. Mispelling maybe?
    continue
  fi

  if [ -f "$COMPOSE_DIR/run.sh" ]; then
    cd $COMPOSE_DIR
    . $COMPOSE_DIR/run.sh
    cd -
  else
    docker compose -f $DOCKER_REPO/apps/$compose/compose.yml up -d
  fi
done
