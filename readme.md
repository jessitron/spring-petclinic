# Spring PetClinic Sample Application

Forked for my own purposes, of running in k8s and instrumenting with the OTel Operator.

Official repo: https://github.com/spring-projects/spring-petclinic/

## what i did

OK. There's a build.sh and a Dockerfile for building the project, taken from a blog post (referenced in commit)

The terraform for setting up the cluster, including an ALB, is at jessitron/infra/terraform-operator-example

There's some yaml in k8s/ . I applied each of these once by hand. Now, they're all documentation except deployment.yaml, which gets run in the deploy script.

There's a deploy script in deploy.sh

I ran the ECR repo creation once.

The deploy script uses the current git tag to build a new container, push it to ECR, and update the deployment to use it.

This is public right now at http://k8s-default-petclini-96595c905f-1799266048.us-west-2.elb.amazonaws.com

I pulled that URL from k9s; describe the ingress resource.
