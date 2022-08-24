terraform {
  required_providers {
    azurerm = {
      source                = "hashicorp/azurerm"
      version               = ">= 2.99.0"
      configuration_aliases = [azurerm.speedboat-sub]
    }
  }
}
