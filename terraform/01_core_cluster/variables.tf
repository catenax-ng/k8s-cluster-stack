variable "environment_name" {
  description = "Name of the environment to create, i.e. 'core'. Will be used in several resource names"
  type        = string
}

variable "service_principal_client_id" {
  description = "USE TF_VAR_service_principal_client_id! The client ID of the service principal that will be used to create the AKS cluster."
  type        = string
}

variable "service_principal_client_secret" {
  description = "USE TF_VAR_service_principal_client_secret! The secret of the service principal that will be used to create the AKS cluster."
}