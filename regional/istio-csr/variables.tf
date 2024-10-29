# Input Variables
# https://www.terraform.io/language/values/variables

variable "artifact_registry" {
  description = "The registry to pull the images from"
  type        = string
  default     = "us-docker.pkg.dev/plt-lz-services-tf79-prod/plt-docker-virtual"
}

variable "cert_manager_istio_csr_version" {
  description = "The version to install for the Istio CSR, this is used for the chart as well as the image tag"
  type        = string
  default     = "0.12.0"
}

variable "cluster_prefix" {
  description = "Prefix for your cluster name, region, and zone (if applicable) will be added to the end of the cluster name"
  type        = string
}

variable "chart_repository" {
  description = "The repository to pull the cert-manager Helm chart from"
  type        = string
  default     = "https://charts.jetstack.io"
}

variable "helpers_cost_center" {
  description = "The cost center the resources will be billed to, must start with 'x' followed by three or four digits"
  type        = string
}

variable "helpers_data_classification" {
  description = "The data classification of the resources can be public, internal, or confidential"
  type        = string
}

variable "helpers_email" {
  description = "The email address of the team responsible for the resources"
  type        = string
}

variable "helpers_repository" {
  description = "The repository name (should be in the format 'owner/repo' containing only lowercase alphanumeric characters or hyphens)"
  type        = string
}

variable "helpers_team" {
  description = "The team name (should contain only lowercase alphanumeric characters and hyphens)"
  type        = string
}

variable "resources_limits_cpu" {
  description = "The CPU limit for the Istio CSR container"
  type        = string
  default     = "50m"
}

variable "resources_limits_memory" {
  description = "The memory limit for the Istio CSR container"
  type        = string
  default     = "64Mi"
}

variable "resources_requests_cpu" {
  description = "The CPU request for the Istio CSR container"
  type        = string
  default     = "25m"
}

variable "resources_requests_memory" {
  description = "The memory request for the Istio CSR container"
  type        = string
  default     = "32Mi"
}
