export GUID='fdjpc'
export OCP_BASE_DOMAIN=sandbox949.opentlc.com
export OCP_PULL_SECRET=${HOME}/pullsecret
export AWS_CREDS_FILE=${HOME}/.aws/credentials

  hypershift create cluster aws \
  --name production \
  --infra-id prod-${GUID} \
  --region ap-southeast-1 \
  --zones ap-southeast-1b \
  --instance-type m6a.large \
  --root-volume-type gp3 \
  --root-volume-size 100 \
  --etcd-storage-class gp3-csi \
  --control-plane-availability-policy SingleReplica \
  --infra-availability-policy SingleReplica \
  --network-type OVNKubernetes \
  --release-image quay.io/openshift-release-dev/ocp-release:4.13.4-x86_64 \
  --node-pool-replicas 1 \
  --base-domain ${OCP_BASE_DOMAIN} \
  --namespace local-cluster \
  --aws-creds ${AWS_CREDS_FILE} \
  --pull-secret '/users/chbutler/pull-secret' \
  --auto-repair \
  --generate-ssh