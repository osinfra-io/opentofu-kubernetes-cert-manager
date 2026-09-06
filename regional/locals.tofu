# Local Values
# https://opentofu.org/docs/language/values/locals

locals {
  helm_values = {
    cainjector = {
      podLabels = {
        "tags.datadoghq.com/service" = "cert-manager-cainjector"
      }

      replicaCount = var.cainjector_replicas

      resources = {
        limits = {
          cpu    = var.cainjector_resources_limits_cpu
          memory = var.cainjector_resources_limits_memory
        }

        requests = {
          cpu    = var.cainjector_resources_requests_cpu
          memory = var.cainjector_resources_requests_memory
        }
      }
    }

    global = {
      commonLabels = {
        "tags.datadoghq.com/env"     = module.core_helpers.environment
        "tags.datadoghq.com/version" = var.cert_manager_version
      }
    }

    podLabels = {
      "tags.datadoghq.com/service" = "cert-manager"
    }

    replicaCount = var.replicas

    resources = {
      limits = {
        cpu    = var.resources_limits_cpu
        memory = var.resources_limits_memory
      }

      requests = {
        cpu    = var.resources_requests_cpu
        memory = var.resources_requests_memory
      }
    }

    startupapicheck = {
      podLabels = {
        "tags.datadoghq.com/service" = "cert-manager-startupapicheck"
      }

      resources = {
        limits = {
          cpu    = var.startupapicheck_resources_limits_cpu
          memory = var.startupapicheck_resources_limits_memory
        }

        requests = {
          cpu    = var.startupapicheck_resources_requests_cpu
          memory = var.startupapicheck_resources_requests_memory
        }
      }
    }

    webhook = {
      podLabels = {
        "tags.datadoghq.com/service" = "cert-manager-webhook"
      }

      replicaCount = var.webhook_replicas

      resources = {
        limits = {
          cpu    = var.webhook_resources_limits_cpu
          memory = var.webhook_resources_limits_memory
        }

        requests = {
          cpu    = var.webhook_resources_requests_cpu
          memory = var.webhook_resources_requests_memory
        }
      }
    }
  }
}
