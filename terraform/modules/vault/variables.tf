variable "vault_oidc_client_id" {
  description = "Vault OIDC Client ID for Dex"
  type        = string
}

variable "vault_oidc_client_secret" {
  description = "Vault OIDC Client Secret for Dex"
  type        = string
}

variable "product_teams" {
  description = "Variable definition for all product teams to use as local variable for policy and secret engine creation"
  type        = map(object({
    name                = string
    secret_engine_name  = string
    ui_policy_name      = string
    approle_name        = string
    approle_policy_name = string
    github_team         = string
    avp_secret_name     = string
  }))
}
