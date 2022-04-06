#resource "vault_mount" "devsecops" {
#    path        = "devsecops"
#    type        = "kv-v2"
#    description = "Secret engine for DevSecOps team"
#}

resource "vault_mount" "bpdm" {
    path        = "bpdm"
    type        = "kv-v2"
    description = "Secret engine for team BPDM"
}

resource "vault_mount" "data_format_transformer" {
    path        = "data-format-transformer"
    type        = "kv-v2"
    description = "Secret engine for team DataFormatTransformer"
}

resource "vault_mount" "data_integrity_demonstrator" {
    path        = "data-integrity-demonstrator"
    type        = "kv-v2"
    description = "Secret engine for team DataIntegrityDemonstrator"
}

resource "vault_mount" "edc" {
    path        = "edc"
    type        = "kv-v2"
    description = "Secret engine for team EDC"
}

resource "vault_mount" "essential_services" {
    path        = "essential-services"
    type        = "kv-v2"
    description = "Secret engine for team Essential Services"
}

resource "vault_mount" "managed_identity_wallets" {
    path        = "managed-identity-wallets"
    type        = "kv-v2"
    description = "Secret engine for team Managed Identity Wallets"
}

resource "vault_mount" "material_pass" {
    path        = "material-pass"
    type        = "kv-v2"
    description = "Secret engine for team Material Pass"
}

resource "vault_mount" "portal" {
    path        = "portal"
    type        = "kv-v2"
    description = "Secret engine for team Portal"
}

resource "vault_mount" "semantics" {
    path        = "semantics"
    type        = "kv-v2"
    description = "Secret engine for team Semantics"
}

resource "vault_mount" "traceability_irs" {
    path        = "traceability-irs"
    type        = "kv-v2"
    description = "Secret engine for team Material Pass. Requested by ds-jkreutzfeld"
}