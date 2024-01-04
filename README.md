# Encrypted control planes

Red Hat OpenShift has released a feature called [Hosted Control Planes](https://docs.openshift.com/container-platform/4.14/hosted_control_planes/index.html) which decouples control planes from worker nodes. This architecture allows organisations to more efficiently run a large number of OpenShift clusters and makes smaller clusters more cost effective (due to the decreased infrastructure footprint of a 'hosted' clusters control plane). 

The consolidation does allow platform teams to more easily manage the infrastructure, however, does consolidate multiple control plane's worth of data into a single cluster.

This repository is a demonstration of how fine grained access control and encryption can be maintained over the control plane data within each of the hosted clusters. 

[Thales CipherTrust Transparent Encryption for Kubernetes](https://thalesdocs.com/ctp/cte-con/cte-k8s/latest/index.html) together with [CipherTrust Manager](https://cpl.thalesgroup.com/encryption/ciphertrust-manager) are being used to encrypt the etcd datastore for each hosted cluster - to maintain the security of Kubernetes secrets.

## Current status
This project is currently a work in progress.

## What is all this code?

This repository is based on the [multicloud-gitops validated pattern](https://github.com/validatedpatterns/multicloud-gitops).

Today this pattern has CipherTrust Manager deployed outside of the pattern and connected up after the fact.


## Setup and pre-requisites
This setup assumes that you have both a openshift cluster and a ciphertrust manager pre-deployed and that the worker nodes of you cluster can reach the ciphertrust manager over `443`. More detailed information is in [docs](./docs).


### Required secrets

1. AWS API KEY / SECRET KEY for s3 storage.
2. Cred file equivalent of above at ~/.aws/credentials
3. htpassword file (for local users in lieu of reconfiguring)
4. A pull secret for docker.io for the CTE containers.
5. A manifest file for AAP
6. A user / password for ciphertrust manager
7. A registration token for ciphetrust manager (hopefully automatible).

