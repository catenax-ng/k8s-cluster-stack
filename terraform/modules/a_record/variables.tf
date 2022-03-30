variable "record_name" {
  description = "The name of the A record. I.e. argo"
  type        = string
}

variable "zone_name" {
  description = "The name of the DNS zone, where the A record belongs to. I.e. demo.catena-x.net"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group this A Record belongs to"
  type        = string
}

variable "target_resource_id" {
  description = "The id of the resource this A record should point to. I.e. a public IP resource id"
  type        = string
}

variable "ttl" {
  description = "The time to live (ttl) value in seconds"
  type        = number
  default     = 0
}