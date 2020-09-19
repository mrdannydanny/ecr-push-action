#!/bin/bash
set -e

for item in AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_REGION ; do
    if [ -z "${!item}" ]; then
        echo "$item is required."
        exit 1
    fi
done

aws ecr get-login --region "$AWS_REGION" --no-include-email | bash

cd $1 

docker build -t $URI_REPO:$2 .

docker push $URI_REPO:$2