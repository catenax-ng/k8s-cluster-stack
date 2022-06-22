variable "vault_address" {
  description = "URL of the vault instance to configure"
  type        = string
  default     = "https://vault.demo.catena-x.net"
}

variable "vault_oidc_client_id" {
  description = "Vault OIDC Client ID for Dex"
  type        = string
}

variable "vault_oidc_client_secret" {
  description = "Vault OIDC Client Secret for Dex"
  type        = string
}
