# # Kubernetes Manifest Resource
# # https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest

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
        name  = "selfsigned"
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

# resource "kubernetes_manifest" "istio_gateway_ca_certificate" {
#   manifest = {
#     apiVersion = "cert-manager.io/v1"
#     kind       = "Certificate"

#     metadata = {
#       name      = "istio-gateway-ca"
#       namespace = "istio-ingress"
#     }

#     spec = {
#       commonName = "istio-gateway-ca"
#       duration   = "2160h"
#       isCA       = true

#       issuerRef = {
#         name  = "selfsigned"
#         kind  = "Issuer"
#         group = "cert-manager.io"
#       }

#       secretName = "istio-gateway-ca"

#       subject = {
#         organizations = ["istio.osinfra.io"]
#       }
#     }
#   }
# }

# resource "kubernetes_manifest" "istio_gateway_ca_issuer" {
#   manifest = {
#     apiVersion = "cert-manager.io/v1"
#     kind       = "Issuer"

#     metadata = {
#       name      = "istio-gateway-ca"
#       namespace = "istio-ingress"
#     }

#     spec = {
#       ca = {
#         secretName = "istio-gateway-ca"
#       }
#     }
#   }
# }

# resource "kubernetes_manifest" "istio_gateway_tls" {
#   manifest = {
#     apiVersion = "cert-manager.io/v1"
#     kind       = "Certificate"

#     metadata = {
#       name      = "istio-gateway-tls"
#       namespace = "istio-ingress"
#     }

#     spec = {
#       commonName = "istio-gateway.osinfra.io"
#       dnsNames   = ["*"]
#       duration   = "2160h"
#       isCA       = false

#       issuerRef = {
#         name  = "istio-gateway-ca"
#         kind  = "Issuer"
#         group = "cert-manager.io"
#       }

#       renewBefore = "360h"
#       secretName  = "istio-gateway-tls"

#       usages = [
#         "client auth",
#         "server auth"
#       ]
#     }
#   }
# }

# resource "kubernetes_manifest" "istio_gateway_selfsigned_issuer" {
#   manifest = {
#     apiVersion = "cert-manager.io/v1"
#     kind       = "Issuer"

#     metadata = {
#       name      = "selfsigned"
#       namespace = "istio-ingress"
#     }

#     spec = {
#       selfSigned = {}
#     }
#   }
# }

# resource "kubernetes_manifest" "opa_gatekeeper_ca_certificate" {
#   manifest = {
#     apiVersion = "cert-manager.io/v1"
#     kind       = "Certificate"

#     metadata = {
#       labels = {
#         "gatekeeper.sh/system" = "yes"
#       }

#       name      = "gatekeeper-ca"
#       namespace = "gatekeeper-system"
#     }

#     spec = {
#       commonName = "gatekeeper-ca.osinfra.io"
#       duration   = "2160h"
#       isCA       = true

#       issuerRef = {
#         name  = "selfsigned"
#         kind  = "Issuer"
#         group = "cert-manager.io"
#       }

#       secretName = "gatekeeper-ca"

#       subject = {
#         organizations = ["gatekeeper.osinfra.io"]
#       }
#     }
#   }
# }

# resource "kubernetes_manifest" "opa_gatekeeper_ca_issuer" {
#   manifest = {
#     apiVersion = "cert-manager.io/v1"
#     kind       = "Issuer"

#     metadata = {
#       labels = {
#         "gatekeeper.sh/system" = "yes"
#       }

#       name      = "gatekeeper-ca"
#       namespace = "gatekeeper-system"
#     }

#     spec = {
#       ca = {
#         secretName = "gatekeeper-ca"
#       }
#     }
#   }
# }

# resource "kubernetes_manifest" "opa_gatekeeper_selfsigned_issuer" {
#   manifest = {
#     apiVersion = "cert-manager.io/v1"
#     kind       = "Issuer"

#     metadata = {
#       labels = {
#         "gatekeeper.sh/system" = "yes"
#       }

#       name      = "selfsigned"
#       namespace = "gatekeeper-system"
#     }

#     spec = {
#       selfSigned = {}
#     }
#   }
# }

# resource "kubernetes_manifest" "opa_gatekeeper_server_cert" {
#   manifest = {
#     apiVersion = "cert-manager.io/v1"
#     kind       = "Certificate"

#     metadata = {
#       labels = {
#         "gatekeeper.sh/system" = "yes"
#       }

#       name      = "gatekeeper-webhook-server-cert"
#       namespace = "gatekeeper-system"
#     }

#     spec = {
#       commonName = "gatekeeper-webhook-service.osinfra.io"

#       dnsNames = [
#         "gatekeeper-webhook-service",
#         "gatekeeper-webhook-service.gatekeeper-system",
#         "gatekeeper-webhook-service.gatekeeper-system.svc"
#       ]

#       duration = "2160h"
#       isCA     = false

#       issuerRef = {
#         name  = "gatekeeper-ca"
#         kind  = "Issuer"
#         group = "cert-manager.io"
#       }

#       renewBefore = "360h"
#       secretName  = "gatekeeper-webhook-server-cert"

#       usages = [
#         "client auth",
#         "digital signature",
#         "key encipherment",
#         "server auth"
#       ]
#     }
#   }
# }
