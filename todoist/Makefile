.PHONY: build run
build:
	docker build -t todoist --build-arg TODOIST_API_TOKEN=$(token) .

run:
	docker run -it todoist /bin/bash
