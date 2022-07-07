terraform {
  required_providers {
    azurerm = {
      source                = "hashicorp/azurerm"
      version               = ">= 2.99.0"
      configuration_aliases = [azurerm.speedboat-sub]
    }
  }
}

provider "azurerm" {
  client_id       = var.service_principal_client_id
  client_secret   = var.service_principal_client_secret
  tenant_id       = ""
  subscription_id = ""
  features {}
}

provider "azurerm" {
  alias           = "speedboat-sub"
  client_id       = var.service_principal_client_id
  client_secret   = var.service_principal_client_secret
  tenant_id       = ""
  subscription_id = ""
  features {}
}
