#!/usr/bin/env sh

xhost +SI:localuser:$(id -un)

# add docker to X server
xhost local:docker

docker run -ti -d \
  -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v ~/.boostnote:/root/Boostnote \
  -v ~/.config/Boostnote:/root/.config/Boostnote \
  -v ~/.fonts:/root/.fonts \
  -v ~/.local/share/fonts:/root/.local/share/fonts \
  --network none \
  boostnote boostnote
