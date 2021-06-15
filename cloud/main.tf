module "staging_environment" {
  source      = "../modules/staging"
  project_id  = var.project_id
  environment = "staging"
  region      = var.region
  tier        = "db-f1-micro"
  db_user     = "awesome_staging_user"
  db_password = "st4g1ngs3cr3t"
  db_name     = "my_staging_project_db"
}

module "production_environment" {
  source      = "../modules/production"
  project_id  = var.project_id
  environment = "production"
  region      = var.region
  tier        = "db-f1-micro"
  db_user     = "awesome_user"
  db_password = "wH4t4s3cr3t"
  db_name     = "my_project_db"
}

// add anther module below