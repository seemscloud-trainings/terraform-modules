variable "project_id" {
  type     = string
  nullable = false
}

variable "region_name" {
  type    = string
  default = null
}

variable "impersonate_service_account" {
  type    = string
  default = null
}
