variable "prefix" {
  type        = string
  description = "Prefix for all resources names"
}

variable "tags" {
  type = object({
    owner       = string
    environment = string
  })
  description = "Tags for resources"
}

variable "resource_group" {
  type = object({
    name     = string
    location = string
  })
}
