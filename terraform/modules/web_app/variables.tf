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

variable "registry" {
  type = object({
    image_name = string
    url        = string
    username   = string
    password   = string
  })
  sensitive   = false
  description = "Image registry details"
}

variable "redis" {
  type = object({
    hostname   = string
    port       = number
    access_key = string
  })
  sensitive   = true
  description = "Redis details"
}
