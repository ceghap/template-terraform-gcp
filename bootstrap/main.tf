# Locals
locals {
  services = [
    "cloudbuild.googleapis.com",
    "compute.googleapis.com",
    "vpcaccess.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "servicenetworking.googleapis.com",
    "sqladmin.googleapis.com",
    "run.googleapis.com",
    "pubsub.googleapis.com",
    "logging.googleapis.com",
    "containeranalysis.googleapis.com",
    "iam.googleapis.com",
    "servicenetworking.googleapis.com"
  ]
}

locals {
  terraform_accounts = var.users
}

locals {
  terraform_account_roles = [
    "roles/cloudsql.admin",
    "roles/compute.networkAdmin",
    "roles/iam.serviceAccountAdmin",
    "roles/iam.serviceAccountKeyAdmin",
    "roles/iap.admin",
    "roles/pubsub.admin",
    "roles/run.admin",
    "roles/run.serviceAgent",
    "roles/storage.admin",
    "roles/vpcaccess.admin"
  ]
}

resource "google_project_service" "enabled_service" {
  for_each = toset(local.services)
  project  = var.project_id
  service  = each.key

  provisioner "local-exec" {
    command = "sleep 60"
  }
  provisioner "local-exec" {
    when    = destroy
    command = "sleep 15"
  }
}

# Service account
resource "google_service_account" "my_project_service_account" {
  for_each = toset(local.terraform_accounts)

  account_id   = "${each.key}-${var.project_id}-terraform"
  display_name = "${each.key}'s terraform account"
}

resource "google_service_account_key" "my_project_service_account_key" {
  for_each = toset(local.terraform_accounts)

  service_account_id = google_service_account.my_project_service_account[each.key].name
}

resource "google_project_iam_binding" "terraform_service_account_roles" {
  project = var.project_id
  depends_on = [
    google_service_account.my_project_service_account
  ]
  for_each = toset(local.terraform_account_roles)

  role = each.key

  members = [for service_account in values(google_service_account.my_project_service_account)[*].email : "serviceAccount:${service_account}"]
}