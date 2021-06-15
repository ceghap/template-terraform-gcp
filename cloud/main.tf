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