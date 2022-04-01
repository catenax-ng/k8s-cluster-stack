resource "vault_generic_secret" "example" {
  path = "secret/project-bpdm"

  data_json = <<EOT
{
  "foo":   "bar",
  "pizza": "cheese"
}
EOT
}

resource "vault_generic_secret" "example" {
  path = "secret/project-data-format-transformer"

  data_json = <<EOT
{
  "foo":   "bar",
  "pizza": "cheese"
}
EOT
}

resource "vault_generic_secret" "example" {
  path = "secret/project-data-integrity-demonstrator"

  data_json = <<EOT
{
  "foo":   "bar",
  "pizza": "cheese"
}
EOT
}

resource "vault_generic_secret" "example" {
  path = "secret/project-edc"

  data_json = <<EOT
{
  "foo":   "bar",
  "pizza": "cheese"
}
EOT
}

resource "vault_generic_secret" "example" {
  path = "secret/project-essential-services"

  data_json = <<EOT
{
  "foo":   "bar",
  "pizza": "cheese"
}
EOT
}

resource "vault_generic_secret" "example" {
  path = "secret/project-managed-identity-wallets"

  data_json = <<EOT
{
  "foo":   "bar",
  "pizza": "cheese"
}
EOT
}

resource "vault_generic_secret" "example" {
  path = "secret/project-material-pass"

  data_json = <<EOT
{
  "foo":   "bar",
  "pizza": "cheese"
}
EOT
}

resource "vault_generic_secret" "example" {
  path = "secret/project-portal"

  data_json = <<EOT
{
  "foo":   "bar",
  "pizza": "cheese"
}
EOT
}

resource "vault_generic_secret" "example" {
  path = "secret/project-semantics"

  data_json = <<EOT
{
  "foo":   "bar",
  "pizza": "cheese"
}
EOT
}

resource "vault_generic_secret" "example" {
  path = "secret/project-traceability-irs"

  data_json = <<EOT
{
  "foo":   "bar",
  "pizza": "cheese"
}
EOT
}