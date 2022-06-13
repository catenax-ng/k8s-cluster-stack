##
#   auth related resources
##

resource "vault_github_auth_backend" "github_login" {
  organization = "catenax-ng"
}

resource "vault_auth_backend" "approle" {
  type = "approle"
}


##
#   DevSecOps team related resources
##

resource "vault_mount" "devsecops-secret-engine" {
  path        = "devsecops"
  type        = "kv"
  description = "Secret engine for DevSecOps team"
  options     = {
    "version" = "2"
  }
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
  team     = "argocdadmins"
  policies = [vault_policy.vault_admin_policy.name]
}


##
#   product team related resources
##

resource "vault_mount" "product-team-secret-engines" {
  for_each = var.product_teams

  path        = each.value.secret_engine_name
  type        = "kv"
  description = "Secret engine for team ${each.value.name}"
  options     = {
    "version" = "2"
  }
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
  team     = each.value.github_team
  policies = [each.value.ui_policy_name]
}

##
#   product team approles
##

resource "vault_approle_auth_backend_role" "product-team-approles" {
  for_each = var.product_teams

  backend        = vault_auth_backend.approle.path
  role_name      = each.value.approle_name
  token_policies = [each.value.approle_policy_name]

  # values taken from the existing resources, while initially importing to the tf state
  secret_id_num_uses = 0
  secret_id_ttl      = 0
  token_max_ttl      = 1800
  token_num_uses     = 10
  token_ttl          = 1200
}

# existing ones cannot be imported, so new ones will be created
resource "vault_approle_auth_backend_role_secret_id" "product-teams-approle-ids" {
  for_each = var.product_teams

  backend   = vault_auth_backend.approle.path
  role_name = vault_approle_auth_backend_role.product-team-approles[each.key].role_name

  # change will be done outside of terraform if not
  cidr_list = []
}

# existing ones cannot be imported, so new ones will be created
resource "vault_approle_auth_backend_login" "approle-logins" {
  for_each = var.product_teams

  backend   = vault_auth_backend.approle.path
  role_id   = vault_approle_auth_backend_role.product-team-approles[each.key].role_id
  secret_id = vault_approle_auth_backend_role_secret_id.product-teams-approle-ids[each.key].secret_id
}

resource "vault_generic_secret" "product-team-avp-secrets" {
  for_each = var.product_teams

  path = "${vault_mount.devsecops-secret-engine.path}/avp-config/${each.value.avp_secret_name}"

  data_json = <<EOT
{
  "role_id":   "${vault_approle_auth_backend_role.product-team-approles[each.key].role_id}",
  "secret_id": "${vault_approle_auth_backend_role_secret_id.product-teams-approle-ids[each.key].secret_id}"
}
EOT
}

## VAULT OIDC Config + Role mapping to Github Teams
# @url: https://jira.catena-x.net/browse/A1ODT-518
#resource "vault_jwt_auth_backend" "oidc_auth_backend" {
#    oidc_discovery_url  = "https://dex.vault.demo.catena-x.net"
#    oidc_client_id      = var.vault_oidc_client_id
#    oidc_client_secret  = var.vault_oidc_client_secret
#    bound_issuer        = "https://dex.vault.demo.catena-x.net "
#    description         = "Vault Authen Method OIDC"
#    path                = "oidc"
#    type                = "oidc"
#    tune {
#        listing_visibility = "unauth"
#    }
#}
#resource "vault_jwt_auth_backend_role" "oidc_auth_roles" {
#  for_each = var.product_teams
#
#  backend               = vault_jwt_auth_backend.oidc_auth_backend.path
#  allowed_redirect_uris = ["http://localhost:8250/oidc/callback","https://vault.demo.catena-x.net/ui/vault/auth/oidc/oidc/callback"]
#  role_type             = "oidc"
#  user_claim            = "email"
#  token_ttl             = "1h"
#  oidc_scopes           = ["openid", "email", "groups"]
#  token_policies        = [each.value.ui_policy_name]
#  role_name             = each.value.github_team
#  bound_claims          = {"groups":"catenax-ng:${each.value.github_team}"}
#}
