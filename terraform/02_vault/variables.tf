variable "vault_address" {
  description = "URL of the vault instance to configure"
  type        = string
  default     = "https://vault.demo.catena-x.net"
}

#variable "vault_oidc_client_id" {
#  description = "Vault OIDC Client ID for Dex"
#  type        = string
#}
#
#variable "vault_oidc_client_secret" {
#  description = "Vault OIDC Client Secret for Dex"
#  type        = string
#}

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
  default = {
    "example" : {
      name : "product-team-example"
      secret_engine_name : "product-team-example"
      ui_policy_name : "product-team-example"
      approle_name : "product-team-example"
      approle_policy_name : "product-team-example-ro"
      avp_secret_name : "example"
      github_team : "product-team-example"
    },
    "edc" : {
      name : "edc",
      secret_engine_name : "edc"
      ui_policy_name : "edc"
      approle_name : "edc"
      approle_policy_name : "edc-ro"
      avp_secret_name : "edc"
      github_team : "product-edc"
    },
    "bpdm" : {
      name : "bpdm",
      secret_engine_name : "bpdm"
      ui_policy_name : "bpdm"
      approle_name : "bpdm"
      approle_policy_name : "bpdm-ro"
      github_team : "product-bpdm"
      avp_secret_name : "bpdm"
    },
    "catenax-at-home" : {
      name : "catenax-at-home"
      secret_engine_name : "catenax-at-home"
      ui_policy_name : "catenax-at-home"
      approle_name : "catenax-at-home"
      approle_policy_name : "catenax-at-home-ro"
      github_team : "product-catenax-at-home"
      avp_secret_name : "catenax-at-home"
    },
    "data-integrity-demonstrator" : {
      name : "data-integrity-demonstrator"
      secret_engine_name : "data-integrity-demonstrator"
      ui_policy_name : "data-integrity-demonstrator"
      approle_name : "data-integrity-demonstrator"
      approle_policy_name : "data-integrity-demonstrator-ro"
      github_team : "product-data-integrity-demonstrator"
      avp_secret_name : "data-integrity-demonstrator"
    },
    "dft" : {
      name : "dft",
      secret_engine_name : "dft"
      ui_policy_name : "dft"
      approle_name : "dft"
      approle_policy_name : "dft-ro"
      github_team : "product-dft"
      avp_secret_name : "dft"
    },
    "esc-backbone" : {
      name : "esc-backbone",
      secret_engine_name : "esc-backbone"
      ui_policy_name : "esc-backbone"
      approle_name : "esc-backbone"
      approle_policy_name : "esc-backbone-ro"
      github_team : "product-esc-backbone"
      avp_secret_name : "esc-backbone"
    },
    "essential-services" : {
      name : "essential-services",
      secret_engine_name : "essential-services"
      ui_policy_name : "essential-services"
      approle_name : "essential-services"
      approle_policy_name : "essential-services-ro"
      github_team : "product-essential-services"
      avp_secret_name : "essential-services"
    },
    "explorer" : {
      name : "explorer",
      secret_engine_name : "explorer"
      ui_policy_name : "explorer"
      approle_name : "product-explorer"
      approle_policy_name : "explorer-ro"
      github_team : "product-explorer"
      avp_secret_name : "product-explorer"
    },
    "managed-identity-wallets" : {
      name : "managed-identity-wallets"
      secret_engine_name : "managed-identity-wallets"
      ui_policy_name : "managed-identity-wallets"
      approle_name : "managed-identity-wallets"
      approle_policy_name : "managed-identity-wallets-ro"
      github_team : "product-managed-identity-wallets"
      avp_secret_name : "managed-identity-wallets"
    },
    "material-pass" : {
      name : "material-pass",
      secret_engine_name : "material-pass"
      ui_policy_name : "material-pass"
      approle_name : "material-pass"
      approle_policy_name : "material-pass-ro"
      github_team : "product-material-pass"
      avp_secret_name : "material-pass"
    },
    "portal" : {
      name : "portal",
      secret_engine_name : "portal"
      ui_policy_name : "portal"
      approle_name : "portal"
      approle_policy_name : "portal-ro"
      github_team : "product-portal"
      avp_secret_name : "portal"
    },
    "traceability-irs" : {
      name : "traceability-irs",
      # product- prefix does not comply with naming convention but is already in use
      secret_engine_name : "product-traceability-irs" # traceability-irs also exists without any secret
      ui_policy_name : "product-traceability-irs" # remove product- prefix
      approle_name : "traceability-irs"
      approle_policy_name : "product-traceability-irs-ro"
      github_team : "product-traceability-irs"
      avp_secret_name : "traceablity-irs" # TYPO, but this is the secret that is used also in argo...
    },
    "semantics" : {
      name : "semantics",
      secret_engine_name : "semantics"
      ui_policy_name : "semantics"
      approle_name : "semantics"
      approle_policy_name : "semantics-ro"
      github_team : "product-semantics"
      avp_secret_name : "semantics"
    },
    "test-data-generator" : {
      name : "test-data-generator",
      secret_engine_name : "test-data-generator"
      ui_policy_name : "test-data-generator"
      approle_name : "test-data-generator"
      approle_policy_name : "test-data-generator-ro"
      github_team : "product-test-data-generator"
      avp_secret_name : "test-data-generator"
    },
    "traceability-foss" : {
      name : "traceability-foss",
      secret_engine_name : "traceability-foss"
      ui_policy_name : "traceability-foss-rw"
      approle_name : "traceability-foss" # traceability-foss-backend also exists
      approle_policy_name : "traceability-foss-ro"
      github_team : "product-traceability-foss"
      avp_secret_name: "traceability-foss" # product-traceability-foss also exists
    },
  }
}


#    "traceability-foss-backend" : {
#      name : "traceability-foss-backend",
#      secret_engine_name : "traceability-foss-backend"
#      ui_policy_name : "traceability-foss-backend-rw"
#      approle_policy_name : "traceability-foss-backend-ro"
#      github_team : "product-traceability-foss"
#    }
#  }

# Weired config or missing teams configurations
# catenax-at-home                --> no secret engine yet
# traceability-irs               --> secret engine imported with product- prefix. The one without is not imported and has no secrets
# "traceability-dft"             --> maybe duplicate, since team renamed to just 'dft' or 'data-format-transformer
# traceability-foss-backend      --> in use, but no github team with that name. Mabe just traceability-foss

# potentially unnecessary policies
# product-idses-frontend-apps    --> no github team nor a secret engine
# product-traceability-foss      --> should not have prefix
# product-traceability-irs       --> should not have prefix
# project-bpdm                   --> not needed. wrong prefix
# terraform-test                 --> just a test
# traceability-dft               --> duplicate. dft exists

# unnecessary github team mappings
# bpdm                           --> product-bpdm


# unnecessary approles
# traceablity-irs                 --> typo and duplicate
# data-format-transformer         --> duplicate with dft and traceability-dft
# traceability-dft                --> dft
# traceablity-dft                 --> typo and duplicate

# careful on approles
# explorer -> imported with key explorer but approle name is product-explorer
# traceability-foss -> imported with key traceability-foss but role name product-traceability-foss
