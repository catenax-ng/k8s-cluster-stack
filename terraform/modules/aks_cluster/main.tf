resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = var.aks_cluster_name
  location            = var.aks_location
  resource_group_name = var.aks_resource_group

  default_node_pool {
    name       = "default"
    vm_size    = var.k8s_vm_size
    node_count = var.k8s_cluster_node_count
  }

  service_principal {
    client_id     = var.aks_service_principal_client_id
    client_secret = var.aks_service_principal_client_secret
  }

  dns_prefix = var.aks_dns_prefix
}
