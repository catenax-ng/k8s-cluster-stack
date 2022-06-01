##
#   auth related resources
##

resource "vault_github_auth_backend" "github_login" {
  organization = "catenax-ng"
}

##
#   DevSecOps team related resources
##

resource "vault_mount" "devsecops-secret-engine" {
  path        = "devsecops"
  type        = "kv"
  description = "Secret engine for DevSecOps team"
}

resource "vault_policy" "vault_admin_policy" {
  name   = "vault_admins"
  policy = <<EOT
path "*" {
  capabilities = [ "create", "read", "update", "delete", "list" ]
}
EOT
}

resource "vault_github_team" "dev-sec-ops" {
  backend  = vault_github_auth_backend.github_login.id
  team = "argocdadmins"
  policies = [ vault_policy.vault_admin_policy.name ]
}


##
#   product team related resources
##

resource "vault_mount" "product-team-secret-engines" {
  for_each = var.product_teams

  path        = each.value.secret_engine_name
  type        = "kv"
  description = "Secret engine for team ${each.value.name}"
}

resource "vault_policy" "product-team-policies" {
  for_each = var.product_teams

  name   = each.value.ui_policy_name
  policy = <<EOT
path "${each.value.secret_engine_name}/*" {
  capabilities = [ "create", "read", "update", "delete", "list" ]
}
EOT
}

resource "vault_policy" "product-approle-read-only-policies" {
  for_each = var.product_teams

  name   = each.value.approle_policy_name
  policy = <<EOT
path "${each.value.secret_engine_name}/*" {
  capabilities = [ "read" ]
}
EOT
}

resource "vault_github_team" "github-product-teams" {
  for_each = var.product_teams

  backend  = vault_github_auth_backend.github_login.id
  team = each.value.github_team
  policies = [ each.value.ui_policy_name ]
}

##
#   OIDC config
##

# https://www.vaultproject.io/docs/auth/jwt
#resource "vault_jwt_auth_backend" "github-oidc-provider" {
#  description        = "Configuration for GitHub as OIDC provider"
#  path               = "github"
#  type               = "oidc"
#  # https://docs.github.com/en/actions/deployment/security-hardening-your-deployments/configuring-openid-connect-in-hashicorp-vault
#  oidc_discovery_url = "https://token.actions.githubusercontent.com"
#  oidc_client_id     = var.oidc_client_id
#  oidc_client_secret = var.oidc_client_secret
#  default_role       = "default"
#  bound_issuer       = "https://token.actions.githubusercontent.com"
#  tune {
#    listing_visibility = "unauth"
#  }
#}
#
#resource "vault_jwt_auth_backend_role" "default" {
#
#  backend        = vault_jwt_auth_backend.github-oidc-provider.path
#  role_name      = "default"
#  token_policies = ["default"]
#  oidc_scopes    = ["groups"]
#
#  user_claim            = "email"
#  groups_claim          = "groups"
#  role_type             = "oidc"
#  allowed_redirect_uris = [
#    "${var.vault_address}/ui/vault/auth/${vault_jwt_auth_backend.github-oidc-provider.path}/oidc/callback",
#    "http://localhost:8200/ui/vault/auth/oidc/oidc/callback"
#  ]
#}
