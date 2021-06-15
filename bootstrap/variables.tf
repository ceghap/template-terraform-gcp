variable "project_id" {
  type    = string
  default = "terraformed-project-id"
}
variable "project_number" {
  type    = string
  default = "111111111111"
}
variable "region" {
  type    = string
  default = "europe-west1"
}

variable "users" {
  type    = list(string)
  default = ["user_1"]
}