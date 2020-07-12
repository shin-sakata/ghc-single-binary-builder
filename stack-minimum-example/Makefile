EXE_IMAGE_NAME = sqlite-dependent-example

build:
	stack install --local-bin-path=./bin

build-image:
	docker build . -t ${EXE_IMAGE_NAME}

run:
	docker run --rm --init ${EXE_IMAGE_NAME}

remove-image:
	docker rmi ${EXE_IMAGE_NAME}
