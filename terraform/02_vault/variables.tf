variable "vault_address" {
  description = "URL of the vault instance to configure"
  type        = string
  default     = "https://vault.vault.catena-x.net"
}

variable login_approle_role_id {
  description = "The role_id of the approle, terraform uses to authenticate in vault"
  type        = string
}

variable login_approle_secret_id {
  description = "The secret_id of the approle, terraform uses to authenticate in vault"
  type        = string
}

variable "oidc_client_id" {
  description = "The client ID used for GitHub OIDC"
  type        = string
}

variable "oidc_client_secret" {
  description = "The client secret used for GitHub OIDC"
  type        = string
}
