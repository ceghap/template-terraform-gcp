# Cloud SQL - MySQL
resource "google_sql_database_instance" "staging_mysql" {
  name                = "mysql-instance-${var.environment}-${var.project_id}"
  database_version    = "MYSQL_5_6"
  region              = var.region
  deletion_protection = false

  settings {
    tier = var.tier
  }
}

resource "google_sql_database" "staging_database" {
  depends_on = [google_sql_database_instance.staging_mysql]
  name       = var.db_name
  instance   = google_sql_database_instance.staging_mysql.name
}

resource "google_sql_user" "users" {
  depends_on = [google_sql_database_instance.staging_mysql, google_sql_database.staging_database]
  name       = var.db_user
  instance   = google_sql_database_instance.staging_mysql.name
  password   = var.db_password
}
