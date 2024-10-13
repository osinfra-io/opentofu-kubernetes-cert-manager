# Local Values
# https://www.terraform.io/docs/language/values/locals.html

locals {
  env = lookup(local.env_map, local.environment, "none")

  environment = (
    terraform.workspace == "default" ?
    "mock-environment" :
    (regex(".*-(?P<environment>[^-]+)$", terraform.workspace)["environment"])
  )

  env_map = {
    "non-production" = "nonprod"
    "production"     = "prod"
    "sandbox"        = "sb"
  }

  helm_values = {
    "cainjector.podLabels.tags\\.datadoghq\\.com/service"      = "cert-manager-cainjector"
    "cainjector.resources.limits.cpu"                          = var.cain_injector_resources_limits_cpu
    "cainjector.resources.limits.memory"                       = var.cain_injector_resources_limits_memory
    "cainjector.resources.requests.cpu"                        = var.cain_injector_resources_requests_cpu
    "cainjector.resources.requests.memory"                     = var.cain_injector_resources_requests_memory
    "cainjector.replicas"                                      = var.cain_injector_replicas
    "global.commonLabels.tags\\.datadoghq\\.com/env"           = local.environment
    "global.commonLabels.tags\\.datadoghq\\.com/version"       = var.cert_manager_version
    "podLabels.tags\\.datadoghq\\.com/service"                 = "cert-manager"
    "resources.limits.cpu"                                     = var.resources_limits_cpu
    "resources.limits.memory"                                  = var.resources_limits_memory
    "resources.requests.cpu"                                   = var.resources_requests_cpu
    "resources.requests.memory"                                = var.resources_requests_memory
    "replicas"                                                 = var.replicas
    "startupapicheck.podLabels.tags\\.datadoghq\\.com/service" = "cert-manager-startupapicheck"
    "startupapicheck.resources.limits.cpu"                     = var.startupapicheck_resources_limits_cpu
    "startupapicheck.resources.limits.memory"                  = var.startupapicheck_resources_limits_memory
    "startupapicheck.resources.requests.cpu"                   = var.startupapicheck_resources_requests_cpu
    "startupapicheck.resources.requests.memory"                = var.startupapicheck_resources_requests_memory
    "webhook.podLabels.tags\\.datadoghq\\.com/service"         = "cert-manager-webhook"
    "webhook.resources.limits.cpu"                             = var.webhook_resources_limits_cpu
    "webhook.resources.limits.memory"                          = var.webhook_resources_limits_memory
    "webhook.resources.requests.cpu"                           = var.webhook_resources_requests_cpu
    "webhook.resources.requests.memory"                        = var.webhook_resources_requests_memory
    "webhook.replicas"                                         = var.webhook_replicas
  }
}
