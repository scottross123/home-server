#!/bin/sh

DOCKER_REPO=/srv/docker

ln -s $DOCKER_REPO/deploy-stack.sh /home/$USER/.local/bin/deploy-stack
ln -s $DOCKER_REPO/deploy-compose.sh /home/$USER/.local/bin/deploy-compose
ln -s $DOCKER_REPO/new-stack.sh /home/$USER/.local/bin/new-stack
