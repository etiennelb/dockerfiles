.PHONY: build run

build:
	docker build . -t boostnote

xhost:
	xhost local:docker

run:
	docker run -ti \
	-e DISPLAY=$(DISPLAY) \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-v ~/.boostnote:/home/$(USER)/Boostnote \
	-v ~/.config/Boostnote:/home/$(USER)/.config/Boostnote \
	-v ~/.fonts:/home/$(USER)/.fonts:ro \
	-v ~/.local/share/fonts:/home/$(USER)/.local/share/fonts:ro \
	-e NEWUSER=$(USER) \
	-e USERID=`id -u` \
	-w ~/Boostnote \
	--network none \
	boostnote
