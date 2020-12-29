# variables.tf
variable "name" {
  default = "testdb"
}

variable "user" {
  default = "serverless"
}

resource "random_string" "password" {
  length  = 16
  special = false
}
