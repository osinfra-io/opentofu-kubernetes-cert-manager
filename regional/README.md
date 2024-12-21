# Terraform Documentation

> A child module automatically inherits default (un-aliased) provider configurations from its parent. The provider versions below are informational only and do **not** need to align with the provider configurations from its parent.

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.17.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_helpers"></a> [helpers](#module\_helpers) | github.com/osinfra-io/terraform-core-helpers//child | v0.1.2 |

## Resources

| Name | Type |
|------|------|
| [helm_release.cert_manager](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_artifact_registry"></a> [artifact\_registry](#input\_artifact\_registry) | The registry to pull the images from | `string` | `"us-docker.pkg.dev/plt-lz-services-tf79-prod/plt-docker-virtual"` | no |
| <a name="input_cain_injector_replicas"></a> [cain\_injector\_replicas](#input\_cain\_injector\_replicas) | The number of replicas to run for the cain-injector | `number` | `1` | no |
| <a name="input_cain_injector_resources_limits_cpu"></a> [cain\_injector\_resources\_limits\_cpu](#input\_cain\_injector\_resources\_limits\_cpu) | The CPU limit for the cain-injector resources | `string` | `"20m"` | no |
| <a name="input_cain_injector_resources_limits_memory"></a> [cain\_injector\_resources\_limits\_memory](#input\_cain\_injector\_resources\_limits\_memory) | The memory limit for the cain-injector resources | `string` | `"64Mi"` | no |
| <a name="input_cain_injector_resources_requests_cpu"></a> [cain\_injector\_resources\_requests\_cpu](#input\_cain\_injector\_resources\_requests\_cpu) | The CPU request for the cain-injector resources | `string` | `"10m"` | no |
| <a name="input_cain_injector_resources_requests_memory"></a> [cain\_injector\_resources\_requests\_memory](#input\_cain\_injector\_resources\_requests\_memory) | The memory request for the cain-injector resources | `string` | `"32Mi"` | no |
| <a name="input_cert_manager_version"></a> [cert\_manager\_version](#input\_cert\_manager\_version) | The version to install, this is used for the chart as well as the image tag | `string` | `"1.16.2"` | no |
| <a name="input_chart_repository"></a> [chart\_repository](#input\_chart\_repository) | The repository to pull the cert-manager Helm chart from | `string` | `"https://charts.jetstack.io"` | no |
| <a name="input_replicas"></a> [replicas](#input\_replicas) | The number of replicas to run | `number` | `1` | no |
| <a name="input_resources_limits_cpu"></a> [resources\_limits\_cpu](#input\_resources\_limits\_cpu) | The CPU limit for the resources | `string` | `"20m"` | no |
| <a name="input_resources_limits_memory"></a> [resources\_limits\_memory](#input\_resources\_limits\_memory) | The memory limit for the resources | `string` | `"64Mi"` | no |
| <a name="input_resources_requests_cpu"></a> [resources\_requests\_cpu](#input\_resources\_requests\_cpu) | The CPU request for the resources | `string` | `"10m"` | no |
| <a name="input_resources_requests_memory"></a> [resources\_requests\_memory](#input\_resources\_requests\_memory) | The memory request for the resources | `string` | `"32Mi"` | no |
| <a name="input_startupapicheck_resources_limits_cpu"></a> [startupapicheck\_resources\_limits\_cpu](#input\_startupapicheck\_resources\_limits\_cpu) | The CPU limit for the startupapicheck resources | `string` | `"20m"` | no |
| <a name="input_startupapicheck_resources_limits_memory"></a> [startupapicheck\_resources\_limits\_memory](#input\_startupapicheck\_resources\_limits\_memory) | The memory limit for the startupapicheck resources | `string` | `"64Mi"` | no |
| <a name="input_startupapicheck_resources_requests_cpu"></a> [startupapicheck\_resources\_requests\_cpu](#input\_startupapicheck\_resources\_requests\_cpu) | The CPU request for the startupapicheck resources | `string` | `"10m"` | no |
| <a name="input_startupapicheck_resources_requests_memory"></a> [startupapicheck\_resources\_requests\_memory](#input\_startupapicheck\_resources\_requests\_memory) | The memory request for the startupapicheck resources | `string` | `"32Mi"` | no |
| <a name="input_webhook_replicas"></a> [webhook\_replicas](#input\_webhook\_replicas) | The number of replicas to run for the webhook | `number` | `1` | no |
| <a name="input_webhook_resources_limits_cpu"></a> [webhook\_resources\_limits\_cpu](#input\_webhook\_resources\_limits\_cpu) | The CPU limit for the webhook resources | `string` | `"20m"` | no |
| <a name="input_webhook_resources_limits_memory"></a> [webhook\_resources\_limits\_memory](#input\_webhook\_resources\_limits\_memory) | The memory limit for the webhook resources | `string` | `"64Mi"` | no |
| <a name="input_webhook_resources_requests_cpu"></a> [webhook\_resources\_requests\_cpu](#input\_webhook\_resources\_requests\_cpu) | The CPU request for the webhook resources | `string` | `"10m"` | no |
| <a name="input_webhook_resources_requests_memory"></a> [webhook\_resources\_requests\_memory](#input\_webhook\_resources\_requests\_memory) | The memory request for the webhook resources | `string` | `"32Mi"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
