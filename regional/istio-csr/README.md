# Terraform Documentation

> A child module automatically inherits default (un-aliased) provider configurations from its parent. The provider versions below are informational only and do **not** need to align with the provider configurations from its parent.

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.16.1 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.33.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_helpers"></a> [helpers](#module\_helpers) | github.com/osinfra-io/terraform-core-helpers | v0.1.0 |

## Resources

| Name | Type |
|------|------|
| [helm_release.cert_manager_istio_csr](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_manifest.istio_ca_certificate](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest) | resource |
| [kubernetes_manifest.istio_ca_issuer](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest) | resource |
| [kubernetes_manifest.istio_selfsigned_issuer](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_artifact_registry"></a> [artifact\_registry](#input\_artifact\_registry) | The registry to pull the images from | `string` | `"us-docker.pkg.dev/plt-lz-services-tf79-prod/plt-docker-virtual"` | no |
| <a name="input_cert_manager_istio_csr_version"></a> [cert\_manager\_istio\_csr\_version](#input\_cert\_manager\_istio\_csr\_version) | The version to install for the Istio CSR, this is used for the chart as well as the image tag | `string` | `"0.12.0"` | no |
| <a name="input_chart_repository"></a> [chart\_repository](#input\_chart\_repository) | The repository to pull the cert-manager Helm chart from | `string` | `"https://charts.jetstack.io"` | no |
| <a name="input_cluster_prefix"></a> [cluster\_prefix](#input\_cluster\_prefix) | Prefix for your cluster name, region, and zone (if applicable) will be added to the end of the cluster name | `string` | n/a | yes |
| <a name="input_helpers_cost_center"></a> [helpers\_cost\_center](#input\_helpers\_cost\_center) | The cost center the resources will be billed to, must start with 'x' followed by three or four digits | `string` | n/a | yes |
| <a name="input_helpers_data_classification"></a> [helpers\_data\_classification](#input\_helpers\_data\_classification) | The data classification of the resources can be public, internal, or confidential | `string` | n/a | yes |
| <a name="input_helpers_email"></a> [helpers\_email](#input\_helpers\_email) | The email address of the team responsible for the resources | `string` | n/a | yes |
| <a name="input_helpers_repository"></a> [helpers\_repository](#input\_helpers\_repository) | The repository name (should be in the format 'owner/repo' containing only lowercase alphanumeric characters or hyphens) | `string` | n/a | yes |
| <a name="input_helpers_team"></a> [helpers\_team](#input\_helpers\_team) | The team name (should contain only lowercase alphanumeric characters and hyphens) | `string` | n/a | yes |
| <a name="input_resources_limits_cpu"></a> [resources\_limits\_cpu](#input\_resources\_limits\_cpu) | The CPU limit for the Istio CSR container | `string` | `"50m"` | no |
| <a name="input_resources_limits_memory"></a> [resources\_limits\_memory](#input\_resources\_limits\_memory) | The memory limit for the Istio CSR container | `string` | `"64Mi"` | no |
| <a name="input_resources_requests_cpu"></a> [resources\_requests\_cpu](#input\_resources\_requests\_cpu) | The CPU request for the Istio CSR container | `string` | `"25m"` | no |
| <a name="input_resources_requests_memory"></a> [resources\_requests\_memory](#input\_resources\_requests\_memory) | The memory request for the Istio CSR container | `string` | `"32Mi"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
