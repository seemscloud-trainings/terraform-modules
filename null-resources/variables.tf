variable "name" {
  type = string
}

variable "prefix" {
  type    = string
  default = "demo"
}

variable "labels" {
  type    = map(string)
  default = {}
}

variable "account_id" {
  type    = string
  default = null
}

variable "account_name" {
  type    = string
  default = null
}

variable "subscription_id" {
  type    = string
  default = null
}

variable "subscription_name" {
  type    = string
  default = null
}

variable "compartment_id" {
  type    = string
  default = null
}

variable "compartment_name" {
  type    = string
  default = null
}

variable "project_id" {
  type    = string
  default = null
}

variable "project_name" {
  type    = string
  default = null
}

variable "region_name" {
  type    = string
  default = null
}

variable "environment_name" {
  type    = string
  default = null
}
