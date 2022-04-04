resource "vault_policy" "project_bpdm" {
  name = "project_bpdm"

  policy = <<EOT
path "bpdm" {
  capabilities = ["create", "read", "update", "delete", "list"]
}
EOT
}

resource "vault_policy" "project_data_format_transformer" {
  name = "data-format-transformer"

  policy = <<EOT
path "data-format-transformer" {
  capabilities = ["create", "read", "update", "delete", "list"]
}
EOT
}

resource "vault_policy" "project_data_integrity_demonstrator" {
  name = "data-integrity-demonstrator"

  policy = <<EOT
path "data-integrity-demonstrator" {
  capabilities = ["create", "read", "update", "delete", "list"]
}
EOT
}

resource "vault_policy" "project_edc" {
  name = "edc"

  policy = <<EOT
path "edc" {
  capabilities = ["create", "read", "update", "delete", "list"]
}
EOT
}

resource "vault_policy" "project_essential_services" {
  name = "essential-services"

  policy = <<EOT
path "essential-services" {
  capabilities = ["create", "read", "update", "delete", "list"]
}
EOT
}

resource "vault_policy" "project_managed_identity_wallets" {
  name = "managed-identity-wallets"

  policy = <<EOT
path "managed-identity-wallets" {
  capabilities = ["create", "read", "update", "delete", "list"]
}
EOT
}

resource "vault_policy" "project_material_pass" {
  name = "material-pass"

  policy = <<EOT
path "material-pass" {
  capabilities = ["create", "read", "update", "delete", "list"]
}
EOT
}

resource "vault_policy" "project_portal" {
  name = "portal"

  policy = <<EOT
path "portal" {
  capabilities = ["create", "read", "update", "delete", "list"]
}
EOT
}

resource "vault_policy" "project_semantics" {
  name = "semantics"

  policy = <<EOT
path "semantics" {
  capabilities = ["create", "read", "update", "delete", "list"]
}
EOT
}

resource "vault_policy" "project_traceability_irs" {
  name = "traceability-irs"

  policy = <<EOT
path "traceability-irs" {
  capabilities = ["create", "read", "update", "delete", "list"]
}
EOT
}