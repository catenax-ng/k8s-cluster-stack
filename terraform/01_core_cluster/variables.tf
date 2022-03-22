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

# azruerm provider variables
variable "azure_subscription_id" {
  description = "Subscription ID. Used for the azure provider"
}
variable "azure_client_id" {
  default = "Client ID of the service principal used in azure provider"
}
variable "azure_client_secret" {
  description = "Client secret of the used service principal for azrue provider"
}
variable "azure_tenant_id" {
  default = "Tenant ID that should be used in azure provider"
}