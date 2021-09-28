#!/bin/sh
set -e

REGISTRY_URL=$1
REGISTRY_NAMESPACE=$2
IMAGE_NAME=$3
BUILD_NUMBER=$4
DIR=$5
DOCKERFILE=$6


echo -e "Variables de entorno de compilación:"
echo "REGISTRY_URL=${REGISTRY_URL}"
echo "REGISTRY_NAMESPACE=${REGISTRY_NAMESPACE}"
echo "IMAGE_NAME=${IMAGE_NAME}"
echo "BUILD_NUMBER=${BUILD_NUMBER}"
echo "DIR=${DIR}"
echo "DOCKERFILE=${DOCKERFILE}"


cd $DIR
echo "ls ..."
ls

echo -e "Comprobando el Dockerfile en la raíz de repositorio"
if [ -f Dockerfile ]; then 
   echo "Se ha encontrado el Dockerfile"
else
    echo "No se ha encontrado el Dockerfile"
    exit 1
fi

aws ecr get-login-password  | docker login --username AWS --password-stdin $REGISTRY_URL

docker build -f $DOCKERFILE -t $REGISTRY_URL/$REGISTRY_NAMESPACE/$IMAGE_NAME:$BUILD_NUMBER .

docker push $REGISTRY_URL/$REGISTRY_NAMESPACE/$IMAGE_NAME:$BUILD_NUMBER
