variable "environment_name" {
  description = "Name of the environment to create, i.e. 'core'. Will be used in several resource names"
  type        = string
}

variable "resource_group_location" {
  description = "The Azure region location for the resource group. Should also be used to set the location of all other resources"
  type        = string
  default     = "germanywestcentral"
}