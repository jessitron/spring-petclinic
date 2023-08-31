#!/bin/bash

set -e
set -x

# only needs to be done once/hr or so, but it's SO PAINFUL when I forget
aws ecr get-login-password | docker login --username AWS --password-stdin 414852377253.dkr.ecr.us-west-2.amazonaws.com

# Done once:
# aws ecr create-repository --repository-name demo-otel-operator/petclinic

# do the build
./build.sh

# push to ECR
sha=$(git rev-parse HEAD)
whole_docker_id=414852377253.dkr.ecr.us-west-2.amazonaws.com/demo-otel-operator/petclinic:$sha
docker tag demo-otel-operator/petclinic $whole_docker_id
docker push $whole_docker_id

cat k8s/deployment.yaml | sed "s/TAGGYDOOBER/$sha/" | kubectl apply -f -
