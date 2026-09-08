include ../../../make.inc

build_docker_image:
	docker build --platform linux/amd64 --network=host -t $(DOCKER_IMAGE_NAME) .

run_docker_image:
	docker run -p 8000:$(PORT) -e PORT=$(PORT) $(DOCKER_IMAGE_NAME)

push_docker_image:
	docker push $(DOCKER_IMAGE_NAME)

deploy_docker_image:
	gcloud run deploy fastapi-deployment \
	  --image $(DOCKER_IMAGE_NAME) \
	  --region $(LOCATION) \
	  --allow-unauthenticated \
	  --platform managed
