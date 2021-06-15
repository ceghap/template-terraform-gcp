variable "project_id" {
  type        = string
  description = "Project Id"
}

variable "region" {
  type        = string
  description = "region of server"
}

variable "environment" {
  type        = string
  description = "instance environment"
}

variable "tier" {
  type        = string
  description = "sql instance tier"
}

variable "db_user" {
  type        = string
  description = "Database username"
}

variable "db_password" {
  type        = string
  description = "Datababse password"
}

variable "db_name" {
  type        = string
  description = "Database name"
}
