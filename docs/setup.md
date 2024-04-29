# Environment setup
This is currenly based on the experience of using Red Hat's Demo Platform (RHDP)
Optimal ordering depends on the infrastructure environment and available automation.



## Workflow

```mermaid


flowchart
  start((start))
  done((done))
  provision_cluster[Provision AWS open environment]
  configure_pattern[Configure the pattern]
  provision_pattern[Provision pattern]
  get_aws_creds[Collect AWS credentials from RHDP]
  discover_aws_environment[Discover AWS enviroment setup from console]
  provision_ciphetrust[Provision ciphertrust manager with terraform]
  get_aap_manifest[Get AAP manifest file from console.redhat.com]
  get_docker_secret[Login and get the docker.io pull secret]
  update_external_secrets[Inject secrets into the pattern]
  ciphertrust_token[Get a ciphertrust token]
  provision_hosted_clusters[Use cluster templates to provision hosted clusters]
  configure_aap[Setup AAP execution environment]
  
  start --> provision_cluster
  start --> get_aap_manifest
  start --> get_docker_secret
  start --> configure_pattern
  provision_cluster --> get_aws_creds
  provision_cluster --> discover_aws_environment
  get_aws_creds --> provision_ciphertrust
  discover_aws_environment --> provision_ciphertrust
  provision_ciphertrust --> ciphertrust_token
  configure_pattern --> provision_pattern
  provision_cluster --> provision_pattern
  provision_pattern --> update_external_secrets
  get_aws_creds --> update_external_secrets
  ciphertrust_token --> update_external_secrets
  get_aap_manifest --> update_external_secrets
  get_docker_secret --> update_external_secrets
  update_external_secrets --> configure_aap
  configure_aap --> provision_hosted_clusters
  provision_hosted_clusters --> done

```

###






## Network requirements

![](./assets/CTE-k8s-network.drawio.png)

The network environment setup for this demo varies based the underlying infrastructure on which the system is deployed.

At a conceptual level there are four components:

- The host cluster
- The hosted clusters
- The Thales CipherTrust Manager
- An Ansible Automation Platform deployment

The diagram above shows the critical network connections in an environment where each appliance is network isolated.

## AAP Deployment
The default method to deploy ansible automation platform in this pattern is deployed on the cluster.
This can easily be overriden by configuring 

```yaml

global:
    aapURL: https://my-aap.server.com 
```

in `values-global.yaml`




## Secrets injection and required secrets for pre-flight setup
This repo uses the [validated-patterns secret file](https://validatedpatterns.io/learn/workflow/#consuming-a-pattern) to inject secrets into Hashicorp Vault. The [template file](../values-secret.yaml.template) should be copied to `~/values-secret-encrypted-control-planes.yaml` and populated.

The following secrets SHOULD be pre-poplulated before deploying the validated-patterns operator into the cluster:

- aap-manifest (if deploying aap on OCP)
  - [See here](https://access.redhat.com/documentation/en-us/red_hat_ansible_automation_platform/2.3/html/red_hat_ansible_automation_platform_operations_guide/assembly-aap-obtain-manifest-files)
- Pull secret for OCP container images
  - Get from [here](https://console.redhat.com/openshift/install/pull-secret) 
- Pull secret for docker hub for CTE (public dockerhub credentials)
  - If using `podman` the file is here:  `~/.config/containers/auth.json`


