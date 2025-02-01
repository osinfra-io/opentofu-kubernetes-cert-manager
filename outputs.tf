# Output Values
# https://www.terraform.io/language/values/outputs

output "tls_private_key_cert_manager_root" {
  description = "The private key for the cert-manager root certificate"
  value       = tls_private_key.cert_manager_root.private_key_pem
  sensitive   = true
}

output "tls_self_signed_cert_cert_manager_root" {
  description = "The self-signed certificate for the cert-manager root certificate"
  value       = tls_self_signed_cert.cert_manager_root.cert_pem
}
