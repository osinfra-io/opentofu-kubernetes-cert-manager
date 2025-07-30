# OpenTofu Tests
# https://opentofu.org/docs/cli/commands/test

# OpenTofu Mock Providers
# https://opentofu.org/docs/cli/commands/test/#the-mock_provider-blocks

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
