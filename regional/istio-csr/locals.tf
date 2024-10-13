# Local Values
# https://www.terraform.io/docs/language/values/locals.html

locals {
  cluster_id = local.zone != null ? "${var.cluster_prefix}-${local.region}-${local.zone}-${local.env}" : "${var.cluster_prefix}-${local.region}-${local.env}"
  env        = lookup(local.env_map, local.environment, "none")

  environment = (
    terraform.workspace == "default" ?
    "mock-environment" :
    regex(".*-(?P<environment>[^-]+)$", terraform.workspace)["environment"]
  )

  env_map = {
    "non-production" = "nonprod"
    "production"     = "prod"
    "sandbox"        = "sb"
  }

  helm_values = {
    "app.server.clusterID"                     = local.cluster_id
    "podLabels.tags\\.datadoghq\\.com/env"     = local.environment
    "podLabels.tags\\.datadoghq\\.com/version" = var.cert_manager_istio_csr_version
    "resources.limits.cpu"                     = var.resources_limits_cpu
    "resources.limits.memory"                  = var.resources_limits_memory
    "resources.requests.cpu"                   = var.resources_requests_cpu
    "resources.requests.memory"                = var.resources_requests_memory
  }

  region = (
    terraform.workspace == "default" ?
    "mock-region" :
    regex("^(?P<region>[^-]+-[^-]+)", terraform.workspace)["region"]
  )


  zone = (
    terraform.workspace == "default" ?
    "mock-zone" :
    (
      regex("^(?P<region>[^-]+-[^-]+)(?:-(?P<zone>[^-]+))?-.*$", terraform.workspace)["zone"] != "" ?
      regex("^(?P<region>[^-]+-[^-]+)(?:-(?P<zone>[^-]+))?-.*$", terraform.workspace)["zone"] :
      null
    )
  )
}
