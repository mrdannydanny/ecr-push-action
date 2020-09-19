# Push docker image to ECR.

This action pushes a docker image to ECR.

## Inputs

### `BUILD_IMAGE_DIR` => The directory you build your docker images.

### `DOCKER_IMG_TAG` => The tag you want to give to your docker image.

## Secrets (Don't forget to create your secrets, otherwise it will fail.)

### `AWS_ACCESS_KEY_ID`

### `AWS_SECRET_ACCESS_KEY`

### `AWS_REGION`

### `URI_REPO` 

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
        uses: danzarov/ecr-push-action 
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