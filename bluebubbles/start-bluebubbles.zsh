#!/bin/zsh

docker run \
  --rm \
  --name bluebubbles \
  --dns=1.1.1.1 \
  --device /dev/kvm \
  -p 5999:5999 \
  -p 1234:1234 \
  -p 50922:10022 \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v /home/scott/osx/maindisk.qcow2:/image \
  -v /home/scott/osx/bootdisk.qcow2:/bootdisk \
  -e IMAGE_PATH="/image" \
  -e BOOTDISK="/bootdisk" \
  -e EXTRA="-display none -vnc 0.0.0.0:99,password-secret=secvnc0 -object secret,id=secvnc0,data=vncpass" \
  -e ADDITIONAL_PORTS="hostfwd=tcp::1234-:1234," \
  -e DISPLAY=:99 \
  -e WIDTH=1920 \
  -e HEIGHT=1080 \
  -e NOPICKER=true \
  sickcodes/docker-osx:naked
