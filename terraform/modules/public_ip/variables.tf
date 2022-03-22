variable "public_ip_name" {
  description = "The name of the public IP resource"
  type        = string
}

variable "resource_location" {
  description = "The Azure location for the public IP resource"
  type = string
}

variable "resource_group_name" {
  description = "The Azure resource group for the public IP resource"
  type = string
}