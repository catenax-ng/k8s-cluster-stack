resource "vault_policy" "project_bpdm" {
  name = "default-secret"

  policy = <<EOT
path "secret/project-bpdm" {
  capabilities = ["update"]
}
EOT
}

resource "vault_policy" "project_data_format_transformer" {
  name = "default-secret"

  policy = <<EOT
path "secret/project-data-format-transformer" {
  capabilities = ["update"]
}
EOT
}

resource "vault_policy" "project_data_integrity_demonstrator" {
  name = "default-secret"

  policy = <<EOT
path "secret/project-data-integrity-demonstrator" {
  capabilities = ["update"]
}
EOT
}

resource "vault_policy" "project_edc" {
  name = "default-secret"

  policy = <<EOT
path "secret/project-edc" {
  capabilities = ["update"]
}
EOT
}

resource "vault_policy" "project_essential_services" {
  name = "default-secret"

  policy = <<EOT
path "secret/project-essential-services" {
  capabilities = ["update"]
}
EOT
}

resource "vault_policy" "project_managed_identity_wallets" {
  name = "default-secret"

  policy = <<EOT
path "secret/project-managed-identity-wallets" {
  capabilities = ["update"]
}
EOT
}

resource "vault_policy" "project_material_pass" {
  name = "default-secret"

  policy = <<EOT
path "secret/project-material-pass" {
  capabilities = ["update"]
}
EOT
}

resource "vault_policy" "project_portal" {
  name = "default-secret"

  policy = <<EOT
path "secret/project-portal" {
  capabilities = ["update"]
}
EOT
}

resource "vault_policy" "project_semantics" {
  name = "default-secret"

  policy = <<EOT
path "secret/project-semantics" {
  capabilities = ["update"]
}
EOT
}

resource "vault_policy" "project_traceability_irs" {
  name = "default-secret"

  policy = <<EOT
path "secret/project-traceability-irs" {
  capabilities = ["update"]
}
EOT
}