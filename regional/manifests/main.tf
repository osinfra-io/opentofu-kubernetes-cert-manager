# Kubernetes Manifest Resource
# https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest

# resource "kubernetes_manifest" "istio_ca_certificate" {
#   manifest = {
#     apiVersion = "cert-manager.io/v1"
#     kind       = "Certificate"

#     metadata = {
#       name      = "istio-ca"
#       namespace = "istio-system"
#     }

#     spec = {
#       commonName = "istio-ca"
#       duration   = "2160h"
#       isCA       = true

#       issuerRef = {
#         name  = "selfsigned"
#         kind  = "Issuer"
#         group = "cert-manager.io"
#       }

#       privateKey = {
#         algorithm = "ECDSA"
#         size      = 256
#       }

#       secretName = "istio-ca"

#       subject = {
#         organizations = ["istio.osinfra.io"]
#       }
#     }
#   }
# }

# resource "kubernetes_manifest" "istio_ca_issuer" {
#   manifest = {
#     apiVersion = "cert-manager.io/v1"
#     kind       = "Issuer"

#     metadata = {
#       name      = "istio-ca"
#       namespace = "istio-system"
#     }

#     spec = {
#       ca = {
#         secretName = "istio-ca"
#       }
#     }
#   }
# }

# resource "kubernetes_manifest" "ingress_gateway_tls" {
#   manifest = {
#     apiVersion = "cert-manager.io/v1"
#     kind       = "Certificate"

#     metadata = {
#       name      = "ingress-cert"
#       namespace = "istio-ingress"
#     }

#     spec = {
#       secretName = "istio-gateway-tls"
#       commonName = "istio.osinfra.io"
#       dnsNames   = ["istio.osinfra.io"]
#     }
#   }
# }

# resource "kubernetes_manifest" "selfsigned_issuer" {
#   manifest = {
#     apiVersion = "cert-manager.io/v1"
#     kind       = "Issuer"

#     metadata = {
#       name      = "selfsigned"
#       namespace = "istio-system"
#     }

#     spec = {
#       selfSigned = {}
#     }
#   }
# }
