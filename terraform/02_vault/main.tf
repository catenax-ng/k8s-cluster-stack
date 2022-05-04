locals {
  teams = [
    "bpdm",
    "catenax-at-home",
    "dft",
    "edc",
    "esc-backbone",
    "essential-services",
    "integrity-demonstrator",
    "managed-identity-wallets",
    "material-pass",
    "portal",
    "semantics",
    "team-example",
    "test-data-generator",
    "traceability-foss",
    "traceability-irs"
  ]
}


resource "vault_mount" "devsecops-secret-engine" {
  path        = "devsecops"
  type        = "kv-v2"
  description = "Secret engine for DevSecOps team"
}

resource "vault_mount" "product-team-secret-engines" {

  for_each = toset( local.teams )

  path        = each.key
  type        = "kv-v2"
  description = "Secret engine for team ${each.key}"
}

resource "vault_policy" "product-team-policies" {

  for_each = toset(local.teams)

  name   = each.key
  policy = <<EOT
path "${each.key}/*" {
  capabilities = [ "create", "read", "update", "delete", "list" ]
}
EOT
}

resource "vault_policy" "product-approle-read-only-policies" {

  for_each = toset(local.teams)

  name   = "${each.key}-ro"
  policy = <<EOT
path "${each.key}/*" {
  capabilities = [ "read" ]
}
EOT
}

# https://www.vaultproject.io/docs/auth/jwt
resource "vault_jwt_auth_backend" "github-oidc-provider" {
  description        = "Configuration for GitHub as OIDC provider"
  path               = "github"
  type               = "oidc"
  # https://docs.github.com/en/actions/deployment/security-hardening-your-deployments/configuring-openid-connect-in-hashicorp-vault
  oidc_discovery_url = "https://token.actions.githubusercontent.com"
  oidc_client_id     = var.oidc_client_id
  oidc_client_secret = var.oidc_client_secret
  default_role       = "default"
  bound_issuer       = "https://token.actions.githubusercontent.com"
  tune {
    listing_visibility = "unauth"
  }
}

resource "vault_jwt_auth_backend_role" "default" {

  backend        = vault_jwt_auth_backend.github-oidc-provider.path
  role_name      = "default"
  token_policies = ["default"]
  oidc_scopes    = ["groups"]

  user_claim            = "email"
  groups_claim          = "groups"
  role_type             = "oidc"
  allowed_redirect_uris = [
    "${var.vault_address}/ui/vault/auth/${vault_jwt_auth_backend.github-oidc-provider.path}/oidc/callback",
    "http://localhost:8200/ui/vault/auth/oidc/oidc/callback"
  ]
}