#!/bin/zsh
export NAME=$1
export PULL_SECRET="${HOME}/pull-secret"
export MEM="6Gi"
export CPU="2"
export WORKER_COUNT="1"
export OCP_BASE_DOMAIN=sandbox949.opentlc.com

hypershift create cluster none \
--name $CLUSTER_NAME \
--node-pool-replicas $WORKER_COUNT \
--pull-secret $PULL_SECRET \
--etcd-storage-class gp3-csi \
--release-image quay.io/openshift-release-dev/ocp-release:4.13.4-x86_64 \
--control-plane-availability-policy HighlyAvailable \
--base-domain ${OCP_BASE_DOMAIN} \
--generate-ssh \
--namespace local-cluster
