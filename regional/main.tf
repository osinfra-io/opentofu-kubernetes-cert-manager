# Terraform Core Helpers Module (osinfra.io)
# https://github.com/osinfra-io/terraform-core-helpers

module "helpers" {
  source = "github.com/osinfra-io/terraform-core-helpers?ref=v0.1.0"

  cost_center         = var.helpers_cost_center
  data_classification = var.helpers_data_classification
  email               = var.helpers_email
  repository          = var.helpers_repository
  team                = var.helpers_team
}

# Helm Release
# https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release

resource "helm_release" "cert_manager" {
  chart      = "cert-manager"
  name       = "cert-manager"
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
    file("${path.module}/helm/cert-manager.yml")
  ]

  version = var.cert_manager_version
}
