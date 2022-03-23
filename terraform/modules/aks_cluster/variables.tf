variable "aks_cluster_name" {
  description = "The name of the AKS cluster to create"
  type        = string
}

variable "aks_location" {
  description = "The azure region, the cluster will be created in"
  type = string
}

variable "aks_resource_group" {
  description = "The resource group, the cluster will be created in"
  type = string
}

variable "k8s_cluster_node_count" {
  description = "The number of kubernetes nodes to create for the k8s cluster"
  type        = number
}

variable "k8s_vm_size" {
  description = "The Azure VM Size string i.e. Standard_D2_v2 or Standard_D8s_v3"
  type        = string
  default     = "Standard_D8s_v3"
}

variable "aks_service_principal_client_id" {
  description = "USE TF_VAR_service_principal_client_id! The client ID of the service principal that will be used to create the AKS cluster."
  type        = string
}

variable "aks_service_principal_client_secret" {
  description = "USE TF_VAR_service_principal_client_secret! The secret of the service principal that will be used to create the AKS cluster."
  type = string
}

variable "aks_dns_prefix" {
  description = "The DNS prefix used for the AKS cluster"
  type = string
}