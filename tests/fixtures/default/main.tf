terraform {
  required_providers {
    tls = {
      source = "hashicorp/tls"
    }
  }
}

module "test" {
  source = "../../../"
}
