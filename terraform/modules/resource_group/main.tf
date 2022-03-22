resource "azurerm_resource_group" "default_resource_group" {
  location = var.resource_group_location
  name     = "cx-${var.environment_name}-rg"
}