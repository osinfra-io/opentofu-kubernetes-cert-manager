# Terraform Documentation

> A child module automatically inherits default (un-aliased) provider configurations from its parent. The provider versions below are informational only and do **not** need to align with the provider configurations from its parent.

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.15.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.cert_manager_istio_csr](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_artifact_registry"></a> [artifact\_registry](#input\_artifact\_registry) | The registry to pull the images from | `string` | `"us-docker.pkg.dev/plt-lz-services-tf79-prod/plt-docker-virtual"` | no |
| <a name="input_cert_manager_istio_csr_version"></a> [cert\_manager\_istio\_csr\_version](#input\_cert\_manager\_istio\_csr\_version) | The version to install for the Istio CSR, this is used for the chart as well as the image tag | `string` | `"0.12.0"` | no |
| <a name="input_cert_manager_version"></a> [cert\_manager\_version](#input\_cert\_manager\_version) | The version to install, this is used for the chart as well as the image tag | `string` | `"1.15.3"` | no |
| <a name="input_chart_repository"></a> [chart\_repository](#input\_chart\_repository) | The repository to pull the cert-manager Helm chart from | `string` | `"https://charts.jetstack.io"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment must be one of `sandbox`, `non-production`, `production` | `string` | `"sandbox"` | no |
| <a name="input_node_location"></a> [node\_location](#input\_node\_location) | The zone in which the cluster's nodes should be located. If not specified, the cluster's nodes are located across zones in the region | `string` | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | The region in which the resource belongs | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
