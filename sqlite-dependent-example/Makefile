EXE_IMAGE_NAME = sqlite-dependent-example-exe
BUILDER_IMAGE_NAME = sqlite-dependent-example-builder

build:
	stack install --local-bin-path=./bin

builder:
	docker build -t ${BUILDER_IMAGE_NAME} ./docker/builder

exe:
	docker build -t ${EXE_IMAGE_NAME} -f ./docker/executable/app.dockerfile .

run:
	docker run --rm --init ${EXE_IMAGE_NAME}

remove-images:
	docker rmi ${EXE_IMAGE_NAME} ${BUILDER_IMAGE_NAME}
