output "service_account_creds" {
  sensitive = true
  value = zipmap(
    toset(local.terraform_accounts),
    values(google_service_account_key.my_project_service_account_key)[*].private_key
  )
}