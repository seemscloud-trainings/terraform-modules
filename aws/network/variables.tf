variable "account_id" {
  description = "Expected AWS account ID. Credentials come from the AWS credential chain or profile; this ID restricts the account they may access."
  type        = string
  nullable    = false
  validation {
    condition     = can(regex("^[0-9]{12}$", var.account_id))
    error_message = "account_id must contain exactly 12 digits."
  }
}

variable "region_name" {
  description = "Default AWS region for the VPC and subnets."
  type        = string
  nullable    = false
}

variable "profile" {
  description = "Optional shared AWS configuration profile."
  type        = string
  default     = null
}

variable "assume_role" {
  description = "Optional role assumed before the target account ID is checked."
  type = object({
    role_arn     = string
    session_name = optional(string)
    external_id  = optional(string)
  })
  default = null
}
