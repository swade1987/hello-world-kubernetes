IMAGE = swade1987/hello-world
PIPELINE_COUNTER?="unknown"

QUAY_USERNAME=swade1987
QUAY_PASSWORD?="unknown"

# Construct the image tag.
VERSION=0.1.$(PIPELINE_COUNTER)

run:
	docker-compose build
	docker-compose up -d

restart:
	docker-compose down && docker-compose build && docker-compose up -d

build:
	docker build -t $(IMAGE):$(VERSION)

login:
	docker login quay.io -u $(QUAY_USERNAME) -p $(QUAY_PASSWORD)

push:
	docker push $(IMAGE):$(VERSION)
	docker rmi $(IMAGE):$(VERSION)