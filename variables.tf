variable "db_admin_username" {
  type        = string
  description = "The admin username for the PostgreSQL server"
}

variable "db_admin_password" {
  type        = string
  description = "The admin password for the PostgreSQL server"
  sensitive   = true
}
