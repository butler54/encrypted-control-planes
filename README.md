# Encrypted control planes

Deploying hosted control planes together with CipherTrust Transparent Encryption to encrypt etcd.

## What is all this code?

This repository is based on the [multicloud-gitops validated pattern](https://github.com/validatedpatterns/multicloud-gitops).

## Cluster bootstrapping 

### Required secrets

1. AWS API KEY / SECRET KEY
2. Cred file equivalent of above
3. htpassword file
4. A pull secret for docker.io for the CTE containers.
