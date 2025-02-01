# Terraform Tests
# https://developer.hashicorp.com/terraform/language/tests

# Terraform Mock Providers
# https://developer.hashicorp.com/terraform/language/tests/mocking

mock_provider "google" {}
mock_provider "helm" {}
mock_provider "kubernetes" {}
mock_provider "terraform" {}

run "default" {
  command = apply

  module {
    source = "./tests/fixtures/default"
  }
}

run "default_regional" {
  command = apply

  module {
    source = "./tests/fixtures/default/regional"
  }
}

run "default_regional_istio_csr" {
  command = apply

  module {
    source = "./tests/fixtures/default/regional/istio-csr"
  }
}
