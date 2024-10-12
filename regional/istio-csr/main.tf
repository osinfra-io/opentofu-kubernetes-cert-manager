# Helm Release
# https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release

resource "helm_release" "cert_manager_istio_csr" {
  chart      = "cert-manager-istio-csr"
  name       = "cert-manager-istio-csr"
  namespace  = "cert-manager"
  repository = var.chart_repository

  set {
    name  = "app.server.clusterID"
    value = var.cluster_id
  }

  set {
    name  = "podLabels.tags\\.datadoghq\\.com/env"
    value = var.environment
  }

  set {
    name  = "podLabels.tags\\.datadoghq\\.com/version"
    value = var.cert_manager_istio_csr_version
  }

  set {
    name  = "podLabels.tags\\.datadoghq\\.com/service"
    value = "cert-manager-istio-csr"
  }

  set {
    name  = "resources.limits.cpu"
    value = var.resources_limits_cpu
  }

  set {
    name  = "resources.limits.memory"
    value = var.resources_limits_memory
  }

  set {
    name  = "resources.requests.cpu"
    value = var.resources_requests_cpu
  }

  set {
    name  = "resources.requests.memory"
    value = var.resources_requests_memory
  }

  values = [
    file("${path.module}/helm/cert-manager-istio-csr.yml")
  ]

  version = var.cert_manager_istio_csr_version
}

# Kubernetes Manifest Resource
# https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest

resource "kubernetes_manifest" "istio_ca_certificate" {
  manifest = {
    apiVersion = "cert-manager.io/v1"
    kind       = "Certificate"

    metadata = {
      name      = "istio-ca"
      namespace = "istio-system"
    }

    spec = {
      commonName = "istio-ca"
      duration   = "2160h"
      isCA       = true

      issuerRef = {
        name  = kubernetes_manifest.istio_selfsigned_issuer.manifest.metadata.name
        kind  = "Issuer"
        group = "cert-manager.io"
      }

      secretName = "istio-ca"

      subject = {
        organizations = ["istio.osinfra.io"]
      }
    }
  }
}

resource "kubernetes_manifest" "istio_ca_issuer" {
  depends_on = [
    kubernetes_manifest.istio_ca_certificate
  ]
  manifest = {
    apiVersion = "cert-manager.io/v1"
    kind       = "Issuer"

    metadata = {
      name      = "istio-ca"
      namespace = "istio-system"
    }

    spec = {
      ca = {
        secretName = "istio-ca"
      }
    }
  }
}

resource "kubernetes_manifest" "istio_selfsigned_issuer" {
  manifest = {
    apiVersion = "cert-manager.io/v1"
    kind       = "Issuer"

    metadata = {
      name      = "selfsigned"
      namespace = "istio-system"
    }

    spec = {
      selfSigned = {}
    }
  }
}
