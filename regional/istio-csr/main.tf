# Helm Release
# https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release

resource "helm_release" "cert_manager_istio_csr" {
  chart      = "cert-manager-istio-csr"
  name       = "cert-manager-istio-csr"
  namespace  = "cert-manager"
  repository = var.chart_repository

  dynamic "set" {
    for_each = local.helm_values
    content {
      name  = set.key
      value = set.value
    }
  }

  values = [
    file("${path.module}/helm/cert-manager-istio-csr.yml")
  ]

  version = var.cert_manager_istio_csr_version
}

# Kubernetes Manifest Resource
# https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest

resource "kubernetes_manifest" "istio_ca_issuer" {
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

resource "kubernetes_secret_v1" "istio_ca" {
  metadata {
    name      = "istio-ca"
    namespace = "istio-system"
  }

  data = {
    "tls.crt" = var.tls_self_signed_cert_cert_manager_root_cert
    "tls.key" = var.tls_self_signed_cert_cert_manager_root_key
  }
}
