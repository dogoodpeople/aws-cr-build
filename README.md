# CR BUILD Action IBMCloud

This action is to build an image into AWS Cloud

## Entradas

### `url`

**Mandatory** url of the server like: 500664183679.dkr.ecr.eu-west-3.amazonaws.com

### `namespace`

**Mandatory** namspace to build the image

### `imagename`

**Mandatory** image name

### `buildnr`

**Mandatory** build nr: typically commit nr

### `dir`

**Mandatory** dir to find Dockerfile into the repository


## Ejemplo de uso

docker build -t ibm-cr-build .
docker run -ti ibm-cr-build 500664183679.dkr.ecr.eu-west-3.amazonaws.com dgp-reg postservice buildNrTest ../Dgp-Micros/PostService/postservice/

```yaml
# File: .github/workflows/workflow.yml
on: [push]

name: example

jobs:

  devflow:
    runs-on: ubuntu-latest
    steps:
    
    - uses: mnevadom/aws-cr-build@v1
      with:
        url: 500664183679.dkr.ecr.eu-west-3.amazonaws.com
        namespace: dgp-reg
        imagename: postservice
        buildnr: c76d5f032667da9326bb8df7e96f06a4e3362044
        dir: postservice

```
