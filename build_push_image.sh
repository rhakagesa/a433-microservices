#!/bin/bash

#mendefinisikan variabel image, tag dan username 
IMAGE_NAME=item-app
IMAGE_TAG=v1
DOCKER_USERNAME=rhakagesa

#melakukan build image
echo -e "Building image $IMAGE_NAME:$IMAGE_TAG"
docker build -t $IMAGE_NAME:$IMAGE_TAG .

#menampilkan daftar image
echo -e "\nList image"
docker images

#merubah nama dan membuat image baru dengan sesuai dengan format docker hub
echo -e "\nChange image and make a new image $IMAGE_NAME:$IMAGE_TAG to $DOCKER_USERNAME/$IMAGE_NAME:$IMAGE_TAG"
docker tag $IMAGE_NAME:$IMAGE_TAG $DOCKER_USERNAME/$IMAGE_NAME:$IMAGE_TAG

#menampilkan daftar image
echo -e "\nList image"
docker images

#melakukan login ke docker hub
echo -e "\nLogin to Docker Hub"
echo -e $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin

#melakukan push image
echo -e "\nPush image to Docker Hub" 
docker push $DOCKER_USERNAME/$IMAGE_NAME:$IMAGE_TAG
echo -e "\nDone"