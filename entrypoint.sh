#!/bin/bash
set -e

BUILD_IMAGE_DIR=$1
DOCKER_IMG_TAG=$2

for item in AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_REGION ; do
    if [ -z "${!item}" ]; then
        echo "$item is required."
        exit 1
    fi
done

aws ecr get-login --region "$AWS_REGION" --no-include-email | bash

cd $BUILD_IMAGE_DIR

docker build -t $URI_REPO:$DOCKER_IMG_TAG .

docker push $URI_REPO:$DOCKER_IMG_TAG