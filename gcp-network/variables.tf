variable "project_id" {
  description = "Default GCP project ID. Authentication uses Application Default Credentials."
  type        = string
  nullable    = false
}
variable "region_name" {
  description = "Default subnet region; the VPC network itself is global. Individual subnetworks may override region."
  type        = string
  default     = null
}
variable "impersonate_service_account" {
  description = "Optional service account email to impersonate using ADC."
  type        = string
  default     = null
}
