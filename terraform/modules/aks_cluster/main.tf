resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = var.aks_cluster_name
  location            = var.aks_location
  resource_group_name = var.aks_resource_group

  default_node_pool {
    name       = var.default_node_pool_name
    vm_size    = var.k8s_vm_size
    node_count = var.k8s_cluster_node_count
    orchestrator_version = var.k8s_version
    
    enable_auto_scaling = var.enable_auto_scaling
    max_count = var.max_count
    min_count = var.min_count
  }

  identity {
    type         = "SystemAssigned"
  }

  dns_prefix         = var.aks_dns_prefix
  kubernetes_version = var.k8s_version
}
