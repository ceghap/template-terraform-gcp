# Cloud SQL - MySQL
resource "google_sql_database_instance" "mysql" {
  name                = "mysql-instance-${var.environment}-${var.project_id}"
  database_version    = "MYSQL_5_6"
  region              = var.region
  deletion_protection = false

  settings {
    tier = var.tier
  }
}

resource "google_sql_database" "database" {
  depends_on = [google_sql_database_instance.mysql]
  name       = var.db_name
  instance   = google_sql_database_instance.mysql.name
}

resource "google_sql_user" "users" {
  depends_on = [google_sql_database_instance.mysql, google_sql_database.database]
  name       = var.db_user
  instance   = google_sql_database_instance.mysql.name
  password   = var.db_password
}
