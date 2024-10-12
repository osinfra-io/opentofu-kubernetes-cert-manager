# Helm Release
# https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release

resource "helm_release" "cert_manager" {
  chart      = "cert-manager"
  name       = "cert-manager"
  namespace  = "cert-manager"
  repository = var.chart_repository

  set {
    name  = "cainjector.podLabels.tags\\.datadoghq\\.com/service"
    value = "cert-manager-cainjector"
  }

  set {
    name  = "global.commonLabels.tags\\.datadoghq\\.com/env"
    value = var.environment
  }

  set {
    name  = "global.commonLabels.tags\\.datadoghq\\.com/version"
    value = var.cert_manager_version
  }

  set {
    name  = "podLabels.tags\\.datadoghq\\.com/service"
    value = "cert-manager"
  }

  set {
    name  = "startupapicheck.podLabels.tags\\.datadoghq\\.com/service"
    value = "cert-manager-startupapicheck"
  }

  set {
    name  = "webhook.podLabels.tags\\.datadoghq\\.com/service"
    value = "cert-manager-webhook"
  }

  values = [
    file("${path.module}/helm/cert-manager.yml")
  ]

  version = var.cert_manager_version
}
