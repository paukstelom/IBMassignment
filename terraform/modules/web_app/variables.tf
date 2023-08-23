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
  sensitive   = true
  description = "Docker registry password"
}

variable "redis_hostname" {
  type        = string
  description = "Redis hostname"
}

variable "redis_port" {
  type        = number
  description = "Redis port"
}
  
variable "redis_access_key" {
  type        = string
  description = "Redis access key"
}
  
