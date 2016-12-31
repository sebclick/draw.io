DATE := $(shell date '+%Y%m%d')
IMAGETAG := 'sebclick/draw.io'

run:
	docker build -t $(IMAGETAG) .
	docker tag $(IMAGETAG) $(IMAGETAG):latest
	docker run -d -p 8080:80 --name draw.io $(IMAGETAG)
	open 'http://localhost:8080/index.html?offline=1&https=0'
