# Helm Release
# https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release

resource "helm_release" "cert_manager" {
  chart      = "cert-manager"
  name       = "cert-manager"
  namespace  = kubernetes_namespace_v1.cert_manager.metadata.0.name
  repository = var.chart_repository

  set {
    name  = "acmesolver.podLabels.tags\\.datadoghq\\.com/service"
    value = "cert-manager-acmesolver"
  }

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
    value = "cert-manager-controller"
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


# Kubernetes Namespace Resource
# https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace_v1

resource "kubernetes_namespace_v1" "cert_manager" {
  metadata {
    name = "cert-manager"
  }
}
