terraform {
  required_providers {
    vault = {
      source = "hashicorp/vault"
      version = "3.5.0"
    }
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
