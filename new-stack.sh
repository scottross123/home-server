#!/bin/bash

DOCKER_REPO=/srv/docker
STACK_NAME=$1

if [ -z $STACK_NAME ]; then
  echo ERROR name of new stack is required!
  exit;
fi

STACK_DIR=$DOCKER_REPO/stacks/$STACK_NAME

mkdir $STACK_DIR
envsubst < $DOCKER_REPO/templates/stack.yml > $STACK_DIR/stack.yml
docker network create $STACK_NAME
$EDITOR $STACK_DIR/stack.yml
echo TODO automatically add
$EDITOR $DOCKER_REPO/nginx-proxy-manager/stack.yml

