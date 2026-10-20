variable "account_id" {
  type     = string
  nullable = false
  validation {
    condition     = can(regex("^[0-9]{12}$", var.account_id))
    error_message = "account_id must contain exactly 12 digits."
  }
}

variable "region_name" {
  type     = string
  nullable = false
}

variable "profile" {
  type    = string
  default = null
}

variable "assume_role" {
  type = object({
    role_arn     = string
    session_name = optional(string)
    external_id  = optional(string)
  })
  default = null
}
