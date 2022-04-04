resource "vault_policy" "project_bpdm" {
  name = "project_bpdm"

  policy = <<EOT
path "project-bpdm" {
  capabilities = ["update"]
}
EOT
}

resource "vault_policy" "project_data_format_transformer" {
  name = "project_data_format_transformer"

  policy = <<EOT
path "project-data-format-transformer" {
  capabilities = ["update"]
}
EOT
}

resource "vault_policy" "project_data_integrity_demonstrator" {
  name = "project_data_integrity_demonstrator"

  policy = <<EOT
path "project-data-integrity-demonstrator" {
  capabilities = ["update"]
}
EOT
}

resource "vault_policy" "project_edc" {
  name = "project_edc"

  policy = <<EOT
path "project-edc" {
  capabilities = ["update"]
}
EOT
}

resource "vault_policy" "project_essential_services" {
  name = "project_essential_services"

  policy = <<EOT
path "project-essential-services" {
  capabilities = ["update"]
}
EOT
}

resource "vault_policy" "project_managed_identity_wallets" {
  name = "project_managed_identity_wallets"

  policy = <<EOT
path "project-managed-identity-wallets" {
  capabilities = ["update"]
}
EOT
}

resource "vault_policy" "project_material_pass" {
  name = "project_material_pass"

  policy = <<EOT
path "project-material-pass" {
  capabilities = ["update"]
}
EOT
}

resource "vault_policy" "project_portal" {
  name = "project_portal"

  policy = <<EOT
path "project-portal" {
  capabilities = ["update"]
}
EOT
}

resource "vault_policy" "project_semantics" {
  name = "project_semantics"

  policy = <<EOT
path "project-semantics" {
  capabilities = ["update"]
}
EOT
}

resource "vault_policy" "project_traceability_irs" {
  name = "project_traceability_irs"

  policy = <<EOT
path "project-traceability-irs" {
  capabilities = ["update"]
}
EOT
}