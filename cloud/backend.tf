terraform {
  backend "gcs"{
    bucket      = "${var.project_id}-terraform-state"
    prefix      = "instances"
    credentials = "creds.json"
  }
}