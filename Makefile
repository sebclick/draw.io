NS = sebclick
NAME = draw.io
VERSION ?= latest
INSTANCE = default
PORTS = 8080:80

.PHONY: build run start stop rm

build:
	docker build -t $(NS)/$(NAME):$(VERSION) .

run:
	docker run --rm --name $(NAME)-$(INSTANCE) -p $(PORTS) $(NS)/$(NAME):$(VERSION)
	open 'http://localhost:8080/index.html?offline=1&https=0'

start:
	docker run -d --name $(NAME)-$(INSTANCE) -p $(PORTS) $(NS)/$(NAME):$(VERSION)

stop:
	docker stop $(NAME)-$(INSTANCE)

rm:
	docker rm $(NAME)-$(INSTANCE)

default: build
