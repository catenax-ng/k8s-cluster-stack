resource "azurerm_public_ip" "public_ip" {
  name                = var.public_ip_name
  location            = var.resource_location
  resource_group_name = var.resource_group_name

  allocation_method = "Static"
  sku               = "Standard"

  zones = ["1", "2", "3"]

  ddos_protection_mode = "Disabled"
}