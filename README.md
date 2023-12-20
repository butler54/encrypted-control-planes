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


## Network connectivity requirements
The ciphertrust manager is currently being configured via ansible (via the api). So 443 is required from the cluster to the ciphertrust manager.


## Ansible approach
Interactions with the CipherTrust Manager are run by ansible. For this ansible jobs need to be triggered per cluster created.
Ansible Automation Platform defines a number of custom resource definitions:
```bash
oc get crd -o name | grep ansible
customresourcedefinition.apiextensions.k8s.io/ansiblecredentials.tower.ansible.com
customresourcedefinition.apiextensions.k8s.io/ansibleinstancegroups.tower.ansible.com
customresourcedefinition.apiextensions.k8s.io/ansibleinventories.tower.ansible.com
customresourcedefinition.apiextensions.k8s.io/ansiblejobs.tower.ansible.com
customresourcedefinition.apiextensions.k8s.io/ansibleprojects.tower.ansible.com
customresourcedefinition.apiextensions.k8s.io/ansibleschedules.tower.ansible.com
customresourcedefinition.apiextensions.k8s.io/ansibleworkflows.tower.ansible.com
customresourcedefinition.apiextensions.k8s.io/automationcontrollerbackups.automationcontroller.ansible.com
customresourcedefinition.apiextensions.k8s.io/automationcontrollerrestores.automationcontroller.ansible.com
customresourcedefinition.apiextensions.k8s.io/automationcontrollers.automationcontroller.ansible.com
customresourcedefinition.apiextensions.k8s.io/automationhubbackups.automationhub.ansible.com
customresourcedefinition.apiextensions.k8s.io/automationhubrestores.automationhub.ansible.com
customresourcedefinition.apiextensions.k8s.io/automationhubs.automationhub.ansible.com
customresourcedefinition.apiextensions.k8s.io/edabackups.eda.ansible.com
customresourcedefinition.apiextensions.k8s.io/edarestores.eda.ansible.com
customresourcedefinition.apiextensions.k8s.io/edas.eda.ansible.com
customresourcedefinition.apiextensions.k8s.io/jobtemplates.tower.ansible.com
customresourcedefinition.apiextensions.k8s.io/workflowtemplates.tower.ansible.com                                    
```

In par








## Cluster bootstrapping

### Required secrets

1. AWS API KEY / SECRET KEY
2. Cred file equivalent of above
3. htpassword file
4. A pull secret for docker.io for the CTE containers.
