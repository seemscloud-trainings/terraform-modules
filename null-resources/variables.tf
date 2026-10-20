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
