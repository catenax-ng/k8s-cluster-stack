variable "vault_address" {
  description = "URL of the vault instance to configure"
  type        = string
  default     = "https://vault.vault.demo.catena-x.net"
}

variable login_approle_role_id {
  description = "The role_id of the approle, terraform uses to authenticate in vault"
  type        = string
}

variable login_approle_secret_id {
  description = "The secret_id of the approle, terraform uses to authenticate in vault"
  type        = string
}

variable "product_teams" {
  description = "Variable definition for all product teams to use as local variable for policy and secret engine creation"
  type        = map(object({
    name                = string
    secret_engine_name  = string
    ui_policy_name      = string
    approle_policy_name = string
    github_team         = string
  }))
  default = {
    "example": {
      name : "product-team-example"
      secret_engine_name : "product-team-example"
      ui_policy_name : "product-team-example-rw"
      approle_policy_name : "product-team-example-ro"
      github_team : "product-team-example"
    },
    "bpdm": {
      name : "bpdm",
      secret_engine_name : "bpdm"
      ui_policy_name : "bpdm-rw"
      approle_policy_name : "bpdm-ro"
      github_team : "product-bpdm"
    },
    "catenax-at-home": {
      name : "catenax-at-home"
      secret_engine_name : "catenax-at-home"
      ui_policy_name : "catenax-at-home-rw"
      approle_policy_name : "catenax-at-home-ro"
      github_team : "product-catenax-at-home"
    },
    "data-integrity-demonstrator": {
      name : "data-integrity-demonstrator"
      secret_engine_name : "data-integrity-demonstrator"
      ui_policy_name : "data-integrity-demonstrator-rw"
      approle_policy_name : "data-integrity-demonstrator-ro"
      github_team : "product-data-integrity-demonstrator"
    },
    "dft": {
      name : "dft",
      secret_engine_name : "dft"
      ui_policy_name : "dft-rw"
      approle_policy_name : "dft-ro"
      github_team : "product-dft"
    },
    "edc": {
      name : "edc",
      secret_engine_name : "edc"
      ui_policy_name : "edc-rw"
      approle_policy_name : "edc-ro"
      github_team : "product-edc"
    },
    "essential-services": {
      name : "essential-services",
      secret_engine_name : "essential-services"
      ui_policy_name : "essential-services-rw"
      approle_policy_name : "essential-services-ro"
      github_team : "product-essential-services"
    },
    "managed-identity-wallets": {
      name : "managed-identity-wallets"
      secret_engine_name : "managed-identity-wallets"
      ui_policy_name : "managed-identity-wallets-rw"
      approle_policy_name : "managed-identity-wallets-ro"
      github_team : "product-managed-identity-wallets"
    },
    "material-pass": {
      name : "material-pass",
      secret_engine_name : "material-pass"
      ui_policy_name : "material-pass-rw"
      approle_policy_name : "material-pass-ro"
      github_team : "product-material-pass"
    },
    "portal": {
      name : "portal",
      secret_engine_name : "portal"
      ui_policy_name : "portal-rw"
      approle_policy_name : "portal-ro"
      github_team : "product-portal"
    },
    "traceability-foss": {
      name : "traceability-foss",
      secret_engine_name : "traceability-foss"
      ui_policy_name : "traceability-foss-rw"
      approle_policy_name : "traceability-foss-ro"
      github_team : "product-traceability-foss"
    },
    "semantics": {
      name : "semantics",
      secret_engine_name : "semantics"
      ui_policy_name : "semantics-rw"
      approle_policy_name : "semantics-ro"
      github_team : "product-semantics"
    },
    "test-data-generator": {
      name : "test-data-generator",
      secret_engine_name : "test-data-generator"
      ui_policy_name : "test-data-generator-rw"
      approle_policy_name : "test-data-generator-ro"
      github_team : "product-test-data-generator"
    },
    "traceability-irs": {
      name : "traceability-irs",
      # product- prefix does not comply with naming convention but is already in use
      secret_engine_name : "product-traceability-irs"
      ui_policy_name : "traceability-irs-rw"
      approle_policy_name : "traceability-irs-ro"
      github_team : "product-traceability-irs"
    },
    "explorer": {
      name : "explorer",
      secret_engine_name : "explorer"
      ui_policy_name : "explorer-rw"
      approle_policy_name : "explorer-ro"
      github_team : "product-explorer"
    },
    "esc-backbone": {
      name : "esc-backbone",
      secret_engine_name : "esc-backbone"
      ui_policy_name : "esc-backbone-rw"
      approle_policy_name : "esc-backbone-ro"
      github_team : "product-esc-backbone"
    }
  }
}
# Weired config or missing teams configurations
# "product-idses-frontend-apps"  -->  no secret engine yet
# "traceability-dft"             --> maybe duplicate, since team renamed to just 'dft' or 'data-format-transformer
# "data-format-transformer",     --> maybe duplicate
