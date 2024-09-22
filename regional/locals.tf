# Local Values
# https://www.terraform.io/docs/language/values/locals.html

locals {
  env = lookup(local.env_map, var.environment, "none")

  env_map = {
    "non-production" = "non-prod"
    "production"     = "prod"
    "sandbox"        = "sb"

  }

  gateway_domains    = keys(var.gateway_dns)
  multi_cluster_name = "${var.cluster_prefix}-${var.region}-${local.env}"
}
