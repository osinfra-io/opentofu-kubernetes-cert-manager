# Terraform Tests
# https://developer.hashicorp.com/terraform/language/tests

# Terraform Mock Providers
# https://developer.hashicorp.com/terraform/language/tests/mocking

mock_provider "google" {}
mock_provider "helm" {}
mock_provider "kubernetes" {}
mock_provider "terraform" {}

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

variables {
  helpers_cost_center         = "mock-cost-center"
  helpers_data_classification = "mock-data-classification"
  helpers_email               = "mock-team@osinfra.io"
  helpers_repository          = "mock-owner/mock-repository"
  helpers_team                = "mock-team"
}
