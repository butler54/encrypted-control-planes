#!/bin/zsh

export GUID='fdjpc'
export OCP_BASE_DOMAIN=sandbox949.opentlc.com
export OCP_PULL_SECRET=${HOME}/pullsecret
export AWS_CREDS_FILE=${HOME}/.aws/credentials
NAME=$1

hypershift destroy cluster aws \
  --name ${NAME} \
  --infra-id ${NAME}-${GUID} \
  --region ap-southeast-1 \
  --aws-creds ${AWS_CREDS_FILE} \
  --namespace local-cluster