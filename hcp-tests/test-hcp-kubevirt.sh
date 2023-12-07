#!/bin/zsh
export NAME=$1
export PULL_SECRET="${HOME}/pull-secret"
export MEM="6Gi"
export CPU="2"
export WORKER_COUNT="1"

hypershift create cluster kubevirt \
--name $NAME \
--node-pool-replicas $WORKER_COUNT \
--pull-secret $PULL_SECRET \
--memory $MEM \
--cores $CPU \
--release-image quay.io/openshift-release-dev/ocp-release:4.13.4-x86_64 \
--namespace local-cluster
