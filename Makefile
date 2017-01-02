IMAGE = quay.io/swade1987/hello-world
SNAP_PIPELINE_COUNTER?="unknown"

QUAY_USERNAME=swade1987
QUAY_EMAIL=steven@stevenwade.co.uk
QUAY_PASSWORD?="unknown"

# Construct the image tag.
VERSION=0.1.$(SNAP_PIPELINE_COUNTER)

run:
	docker-compose build
	docker-compose up -d

restart:
	docker-compose down && docker-compose build && docker-compose up -d

build:
	docker build -t $(IMAGE):$(VERSION) .

login:
	docker login -e $(QUAY_EMAIL) -u $(QUAY_USERNAME) -p $(QUAY_PASSWORD) quay.io

push:
	docker push $(IMAGE):$(VERSION)
	docker rmi $(IMAGE):$(VERSION)