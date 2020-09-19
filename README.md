# Push docker image to ECR.

This action pushes a docker image to ECR.

## Variables

| Key | Value | Suggested Type | Required |
| ------------- | ------------- | ------------- | ------------- |
| `BUILD_IMAGE_DIR` | Directory to build the images | `with` | **Yes** |
| `DOCKER_IMG_TAG` | Docker Image tag | `with` | **Yes** |
| `AWS_ACCESS_KEY_ID` | AWS KEY ID  | `secret` | **Yes** |
| `AWS_SECRET_ACCESS_KEY` | AWS SECRET ACCESS KEY| `secret` | **Yes** |
| `AWS_REGION` | AWS REGION | `secret` | **Yes** |
| `URI_REPO` | Your ECR URI  | `secret` | **Yes** |


**note: you must specify a directory to build your image or create a dir named my_building_directory** 

## Example usage

```
on: [push]

jobs:
  ecr-push-job:
    runs-on: ubuntu-latest
    name: A job to push an image to ecr.
    steps:

      - name: Checkout
        uses: actions/checkout@v2

      - name: Pass parameters to the action.yml
        uses: danzarov/ecr-push-action@v1.2
        id: ecr-push
        with:
          BUILD_IMAGE_DIR: 'my_building_directory'          
          DOCKER_IMG_TAG: '1.0'
        env:          
          AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
          AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          AWS_REGION: ${{ secrets.AWS_REGION }}
          URI_REPO: ${{ secrets.URI_REPO }}
```