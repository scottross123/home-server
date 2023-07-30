#!/bin/zsh

docker run \
  --rm \
  --name bluebubbles-setup \
  --dns=1.1.1.1 \
  --device /dev/kvm \
  -p 5999:5999 \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v /home/scott/osx/maindisk.qcow2:/image \
  -e IMAGE_PATH="/image" \
  -e EXTRA="-display none -vnc 0.0.0.0:99,password-secret=secvnc0 -object secret,id=secvnc0,data=vncpass" \
  -e DISPLAY=:99 \
  -e WIDTH=1920 \
  -e HEIGHT=1080 \
  -e GENERATE_UNIQUE=true \
  sickcodes/docker-osx:latest
