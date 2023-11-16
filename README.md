# Encrypted control planes
This repo is meant to deploy the underlying infrastructure to support encrypted control planes with HCP

## Stages of demo build 
### 1: HCP is assumed configured
Just need the underlying encryption tech to be deployed

### 1: HCP needs to be configured
Deploy onto a bare OCP cluster.

### 2: Automated cluster as a service
Here we goet 


## What is all this code?

This repo is based on the [multicloud-gitops validated pattern](https://github.com/validatedpatterns/multicloud-gitops).


## cluster bootstrap.

required secrets
1. AWS API KEY / SECRET KEY
2. Cred file equivalent of above
3. htpassword file