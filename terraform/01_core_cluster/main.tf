module "resource_group" {
  source = "../modules/resource_group"

  resource_group_name = var.environment_name
}

module "aks" {
  source = "../modules/aks_cluster"

  aks_cluster_name   = "cx-${var.environment_name}-aks"
  aks_location       = module.resource_group.resource_location
  aks_resource_group = module.resource_group.resource_group_name

  aks_service_principal_client_id     = var.service_principal_client_id
  aks_service_principal_client_secret = var.service_principal_client_secret
  aks_dns_prefix                      = "cx-${var.environment_name}-aks"
}

module "public_ip" {
  source = "../modules/public_ip"

  public_ip_name      = "cx-${var.environment_name}-public-ip"
  resource_location   = module.resource_group.resource_location
  resource_group_name = module.resource_group.resource_group_name
}
