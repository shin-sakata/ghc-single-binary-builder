NAME = shinsakata
IMAGE_NAME = ghc-single-binary-builder
VERSION = v1.1.0
GHC_VERSION = ghc8.10.1

full_image_name = ${NAME}/${IMAGE_NAME}:${GHC_VERSION}-${VERSION}

build:
	docker build . -t ${full_image_name}

remove:
	docker rmi ${full_image_name}

push:
	docker push ${full_image_name}

debug:
	docker run -it --rm ${full_image_name} /bin/ash
