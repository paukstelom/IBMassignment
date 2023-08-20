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

variable "location" {
  type        = string
  description = "Resources location in Azure"
}

variable "image_registry_url" {
  type        = string
  description = "Docker registry URL"
}

variable "image_name" {
  type        = string
  description = "Docker image name"
}

variable "image_registry_username" {
  type        = string
  description = "Docker registry username"
}

variable "image_registry_password" {
  type        = string
  description = "Docker registry password"
}

