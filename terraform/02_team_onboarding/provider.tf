terraform {
   required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.99.0"
    } 
  }

  backend "azurerm" {
    resource_group_name  = "cx-devsecops-tfstates"
    storage_account_name = "cxdevsecopstfstate"
    container_name       = "vault-tfstate"
    key                  = "terraform.tfstate"
  }
}

provider "vault" {
  address = var.vault_address
}

provider "azurerm" {
  features {}
}
