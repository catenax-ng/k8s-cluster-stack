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

variable "k8s_vm_size" {
  description = "The Azure VM Size string i.e. Standard_D2_v2 or Standard_D8s_v3"
  type        = string
  default     = "Standard_D8s_v3"
}

variable "k8s_cluster_node_count" {
  description = "The number of kubernetes nodes to create for the k8s cluster"
  type        = number
  default     = 3
}