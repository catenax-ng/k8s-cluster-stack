terraform {
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "3.5.0"
    }
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
  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id   = var.login_approle_role_id
      secret_id = var.login_approle_secret_id
    }
  }
}

provider "azurerm" {
  features {}
}
