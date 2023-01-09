module "vault" {
  source = "../modules/vault"

  vault_oidc_client_id     = var.vault_oidc_client_id
  vault_oidc_client_secret = var.vault_oidc_client_secret

  product_teams = {
    "example" : {
      name : "product-team-example"
      secret_engine_name : "product-team-example"
      ui_policy_name : "product-team-example-rw"
      approle_name : "product-team-example"
      approle_policy_name : "product-team-example-ro"
      avp_secret_name : "example"
      github_team : "product-team-example"
    },
    "puris" : {
      name : "puris",
      secret_engine_name : "puris"
      ui_policy_name : "puris-rw"
      approle_name : "puris"
      approle_policy_name : "puris-ro"
      avp_secret_name : "puris"
      github_team : "product-puris"
    },
    "edc" : {
      name : "edc",
      secret_engine_name : "edc"
      ui_policy_name : "edc-rw"
      approle_name : "edc"
      approle_policy_name : "edc-ro"
      avp_secret_name : "edc"
      github_team : "product-edc"
    },
    "bpdm" : {
      name : "bpdm",
      secret_engine_name : "bpdm"
      ui_policy_name : "bpdm-rw"
      approle_name : "bpdm"
      approle_policy_name : "bpdm-ro"
      github_team : "product-bpdm"
      avp_secret_name : "bpdm"
    },
    "catenax-at-home" : {
      name : "catenax-at-home"
      secret_engine_name : "catenax-at-home"
      ui_policy_name : "catenax-at-home-rw"
      approle_name : "catenax-at-home"
      approle_policy_name : "catenax-at-home-ro"
      github_team : "product-catenax-at-home"
      avp_secret_name : "catenax-at-home"
    },
    "data-integrity-demonstrator" : {
      name : "data-integrity-demonstrator"
      secret_engine_name : "data-integrity-demonstrator"
      ui_policy_name : "data-integrity-demonstrator-rw"
      approle_name : "data-integrity-demonstrator"
      approle_policy_name : "data-integrity-demonstrator-ro"
      github_team : "product-data-integrity-demonstrator"
      avp_secret_name : "data-integrity-demonstrator"
    },
    "dft" : {
      name : "dft",
      secret_engine_name : "dft"
      ui_policy_name : "dft-rw"
      approle_name : "dft"
      approle_policy_name : "dft-ro"
      github_team : "product-dft"
      avp_secret_name : "dft"
    },
    "esc-backbone" : {
      name : "esc-backbone",
      secret_engine_name : "esc-backbone"
      ui_policy_name : "esc-backbone-rw"
      approle_name : "esc-backbone"
      approle_policy_name : "esc-backbone-ro"
      github_team : "product-esc-backbone"
      avp_secret_name : "esc-backbone"
    },
    "essential-services" : {
      name : "essential-services",
      secret_engine_name : "essential-services"
      ui_policy_name : "essential-services-rw"
      approle_name : "essential-services"
      approle_policy_name : "essential-services-ro"
      github_team : "product-essential-services"
      avp_secret_name : "essential-services"
    },
    "explorer" : {
      name : "explorer",
      secret_engine_name : "explorer"
      ui_policy_name : "explorer-rw"
      approle_name : "explorer"
      approle_policy_name : "explorer-ro"
      github_team : "product-explorer"
      avp_secret_name : "product-explorer"
    },
    "innovation-radar" : {
      name : "innovation-radar",
      secret_engine_name : "innovation-radar"
      ui_policy_name : "innovation-radar-rw"
      approle_name : "innovation-radar"
      approle_policy_name : "innovation-radar-ro"
      github_team : "product-innovation-radar"
      avp_secret_name : "innovation-radar"
    },
    "managed-identity-wallets" : {
      name : "managed-identity-wallets"
      secret_engine_name : "managed-identity-wallets"
      ui_policy_name : "managed-identity-wallets-rw"
      approle_name : "managed-identity-wallets"
      approle_policy_name : "managed-identity-wallets-ro"
      github_team : "product-managed-identity-wallets"
      avp_secret_name : "managed-identity-wallets"
    },
    "material-pass" : {
      name : "material-pass",
      secret_engine_name : "material-pass"
      ui_policy_name : "material-pass-rw"
      approle_name : "material-pass"
      approle_policy_name : "material-pass-ro"
      github_team : "product-material-pass"
      avp_secret_name : "material-pass"
    },
    "portal" : {
      name : "portal",
      secret_engine_name : "portal"
      ui_policy_name : "portal-rw"
      approle_name : "portal"
      approle_policy_name : "portal-ro"
      github_team : "product-portal"
      avp_secret_name : "portal"
    },
    "traceability-irs" : {
      name : "traceability-irs",
      # product- prefix does not comply with naming convention but is already in use
      secret_engine_name : "traceability-irs" # traceability-irs also exists without any secret
      ui_policy_name : "traceability-irs-rw"  # remove product- prefix
      approle_name : "traceability-irs"
      approle_policy_name : "traceability-irs-ro"
      github_team : "product-traceability-irs"
      avp_secret_name : "traceablity-irs" # TYPO, but this is the secret that is used also in argo...
    },
    "semantics" : {
      name : "semantics",
      secret_engine_name : "semantics"
      ui_policy_name : "semantics-rw"
      approle_name : "semantics"
      approle_policy_name : "semantics-ro"
      github_team : "product-semantics"
      avp_secret_name : "semantics"
    },
    "test-data-generator" : {
      name : "test-data-generator",
      secret_engine_name : "test-data-generator"
      ui_policy_name : "test-data-generator-rw"
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
      avp_secret_name : "traceability-foss" # product-traceability-foss also exists
    },
    "behaviour-twin-pilot" : {
      name : "behaviour-twin-pilot"
      secret_engine_name : "behaviour-twin-pilot"
      ui_policy_name : "behaviour-twin-pilot-rw"
      approle_name : "behaviour-twin-pilot"
      approle_policy_name : "behaviour-twin-pilot-ro"
      github_team : "product-behaviour-twin-pilot"
      avp_secret_name : "behaviour-twin-pilot"
    },
    "value-added-service" : {
      name : "value-added-service"
      secret_engine_name : "value-added-service"
      ui_policy_name : "value-added-service-rw"
      approle_name : "value-added-service"
      approle_policy_name : "value-added-service-ro"
      github_team : "product-value-added-service"
      avp_secret_name : "value-added-service"
    },
    "knowledge" : {
      name : "knowledge",
      secret_engine_name : "knowledge"
      ui_policy_name : "knowledge-rw"
      approle_name : "knowledge"
      approle_policy_name : "knowledge-ro"
      github_team : "product-knowledge"
      avp_secret_name : "knowledge"
    },
    "registry-twin-check" : {
      name : "registry-twin-check",
      secret_engine_name : "registry-twin-check"
      ui_policy_name : "registry-twin-check-rw"
      approle_name : "registry-twin-check"
      approle_policy_name : "registry-twin-check-ro"
      github_team : "product-registry-twin-check"
      avp_secret_name : "registry-twin-check"
    },
    "business-partner-certificates" : {
      name : "business-partner-certificates",
      secret_engine_name : "business-partner-certificates"
      ui_policy_name : "business-partner-certificates-rw"
      approle_name : "business-partner-certificates"
      approle_policy_name : "business-partner-certificates-ro"
      github_team : "product-business-partner-certificates"
      avp_secret_name : "business-partner-certificates"
    },
    "et-demonstrators" : {
      name : "et-demonstrators",
      secret_engine_name : "et-demonstrators"
      ui_policy_name : "et-demonstrators-rw"
      approle_name : "et-demonstrators"
      approle_policy_name : "et-demonstrators-ro"
      github_team : "product-et-demonstrators"
      avp_secret_name : "et-demonstrators"
    },
    "item-relationship-service-frontend" : {
      name : "item-relationship-service-frontend",
      secret_engine_name : "item-relationship-service-frontend"
      ui_policy_name : "item-relationship-service-frontend-rw"
      approle_name : "item-relationship-service-frontend"
      approle_policy_name : "item-relationship-service-frontend-ro"
      github_team : "product-item-relationship-service-frontend"
      avp_secret_name : "item-relationship-service-frontend"
    },
    "r-strategy-assistant" : {
      name : "r-strategy-assistant",
      secret_engine_name : "r-strategy-assistant"
      ui_policy_name : "r-strategy-assistant-rw"
      approle_name : "r-strategy-assistant"
      approle_policy_name : "r-strategy-assistant-ro"
      github_team : "product-r-strategy-assistant"
      avp_secret_name : "r-strategy-assistant"
    }
  }
}

module "github" {
  source = "../modules/github"

  github_token = var.github_token

  github_teams = {
    "argocdadmins" : {
      "name" : "argocdadmins",
      "description" : "ArgoCD OAuth administrator team"
    },
    "product-puris" : {
      "name" : "product-puris",
      "description" : "Product Team PURIS"
    },
    "cx-core-schemas" : {
      "name" : "cx-core-schemas",
      "description" : ""
    },
    "product-behaviour-twin-pilot" : {
      "name" : "product-behaviour-twin-pilot",
      "description" : ""
    },
    "product-bpdm" : {
      "name" : "product-bpdm",
      "description" : ""
    },
    "product-catenax-at-home" : {
      "name" : "product-catenax-at-home",
      "description" : ""
    },
    "product-data-integrity-demonstrator" : {
      "name" : "product-data-integrity-demonstrator",
      "description" : ""
    },
    "product-dft" : {
      "name" : "product-dft",
      "description" : ""
    },
    "product-edc" : {
      "name" : "product-edc",
      "description" : ""
    },
    "product-esc-backbone" : {
      "name" : "product-esc-backbone",
      "description" : ""
    },
    "product-essential-services" : {
      "name" : "product-essential-services",
      "description" : ""
    },
    "product-explorer" : {
      "name" : "product-explorer",
      "description" : ""
    },
    "product-innovation-radar" : {
      "name" : "product-innovation-radar",
      "description" : ""
    },
    "product-managed-identity-wallets" : {
      "name" : "product-managed-identity-wallets",
      "description" : ""
    },
    "product-material-pass" : {
      "name" : "product-material-pass",
      "description" : ""
    },
    "product-portal" : {
      "name" : "product-portal",
      "description" : ""
    },
    "product-semantics" : {
      "name" : "product-semantics",
      "description" : ""
    },
    "product-team-example" : {
      "name" : "product-team-example",
      "description" : "this is a team for demo purpose"
    },
    "product-test-data-generator" : {
      "name" : "product-test-data-generator",
      "description" : ""
    },
    "product-traceability-foss" : {
      "name" : "product-traceability-foss",
      "description" : ""
    },
    "product-traceability-irs" : {
      "name" : "product-traceability-irs",
      "description" : ""
    },
    "product-value-added-service" : {
      "name" : "product-value-added-service",
      "description" : ""
    },
    "team-foss" : {
      "name" : "team-foss",
      "description" : "Free open source software - Catena-X mentors"
    },
    "team-hello-gitops" : {
      "name" : "team-hello-gitops",
      "description" : "only Burak"
    },
    "team-security" : {
      "name" : "team-security",
      "description" : ""
    },
    "product-knowledge" : {
      "name" : "product-knowledge"
      "description" : "Catena-X Knowledge Agents delivers a semantically-driven and state-of-the-art compute-to-data architecture for automotive use cases based on the best GAIA-X, W3C and Big Data practices."
    }
    "release-management" : {
      name : "release-management"
      description : "Members will be granted permissions to manage releases on release relevant environments"
    }
    "test-management" : {
      name : "test-management"
      description : "Members will be granted permissions to manage deployments on integration environments for testing purposes"
    },
    "product-registry-twin-check" : {
      name : "product-registry-twin-check"
      description : ""
    },
    "product-business-partner-certificates" : {
      name : "product-business-partner-certificates"
      description : ""
    },
    "product-et-demonstrators" : {
      name : "product-et-demonstrators"
      description : ""
    },
    "product-item-relationship-service-frontend" : {
      name : "product-item-relationship-service-frontend"
      description : ""
    },
    "product-r-strategy-assistant" : {
      name : "product-r-strategy-assistant"
      description : ""
    }
  }

  github_repositories = {
    "product-puris-backend" : {
      name : "product-puris-backend"
      team_name : "product-puris"
      description : ""
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : true
        branch : "gh-pages"
      }
      is_template : false
      uses_template : false
      template : {
        owner : "catenax-ng"
        repository : "k8s-helm-example"
      }
      codeowners_available : false
      codeowners : null

    },
    "product-puris-frontend" : {
      name : "product-puris-frontend"
      team_name : "product-puris"
      description : ""
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : true
        branch : "gh-pages"
      }
      is_template : false
      uses_template : false
      template : {
        owner : "catenax-ng"
        repository : "k8s-helm-example"
      }
      codeowners_available : false
      codeowners : null

    },
    "product-bpdm" : {
      name : "product-bpdm"
      team_name : "product-bpdm"
      description : ""
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : true
        branch : "gh-pages"
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null

    },
    "product-idses-frontend-apps" : {
      name : "product-idses-frontend-apps"
      team_name : "product-essential-services"
      description : ""
      visibility : "private"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
        branch : ""
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null

    },
    "product-innovation-radar" : {
      name : "product-innovation-radar"
      team_name : "product-innovation-radar"
      description : ""
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
        branch : "main"
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "product-semantics" : {
      name : "product-semantics"
      team_name : "product-semantics"
      description : ""
      visibility : "private"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
        branch : ""
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "product-portal-frontend" : {
      name : "product-portal-frontend"
      team_name : "product-portal"
      description : "Catena-X Portal Frontend - DEPRECATED"
      visibility : "public"
      homepage_url : "https://portal.dev.demo.catena-x.net"
      topics : ["catena-x", "docker", "portal", "react", "typescript"]
      pages : {
        enabled : false
        branch : ""
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "product-portal-iam" : {
      name : "product-portal-iam"
      team_name : "product-portal"
      description : "Catena-X IAM - Keycloak instances - DEPRECATED"
      visibility : "public"
      homepage_url : ""
      topics : [
        "catena-x",
        "identity-and-access-management",
        "keycloak"
      ]
      pages : {
        enabled : true
        branch : "gh-pages"
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "product-portal-backend" : {
      name : "product-portal-backend"
      team_name : "product-portal"
      description : "Catena-X Portal Backend - DEPRECATED"
      visibility : "public"
      homepage_url : ""
      topics : [
        "backend",
        "catena-x",
        "portal"
      ]
      pages : {
        enabled : true
        branch : "main"
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "product-data-integrity-demonstrator" : {
      name : "product-data-integrity-demonstrator"
      team_name : "product-data-integrity-demonstrator"
      description : ""
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
        branch : "main"
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "catenax-at-home" : {
      name : "catenax-at-home",
      team_name : "product-catenax-at-home",
      description : "",
      visibility : "public"
      homepage_url : "https://catenax-ng.github.io/docs/catenax-at-home-getting-started-guide"
      topics : []
      pages : {
        enabled : false
        branch : "main"
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "product-core-schemas" : {
      name : "product-core-schemas",
      team_name : "cx-core-schemas",
      description : "",
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
        branch : "main"
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "product-portal-cd" : {
      name : "product-portal-cd"
      team_name : "product-portal"
      description : "Catena-X Portal - Continuous Deployment - DEPRECATED"
      visibility : "public"
      homepage_url : ""
      topics : [
        "argocd",
        "catena-x",
        "continuous-deployment",
        "helm",
        "kubernetes",
        "portal"
      ]
      pages : {
        enabled : true
        branch : "gh-pages"
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "DataSpaceConnector" : {
      name : "DataSpaceConnector"
      team_name : "product-managed-identity-wallets"
      description : "DataspaceConnector project"
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
        branch : "main"
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "product-portal-common-assets" : {
      name : "product-portal-common-assets"
      team_name : "product-portal"
      description : "Assets used by the Catena-X Portal"
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
        branch : "main"
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "product-core-managed-identity-wallets" : {
      "name" : "product-core-managed-identity-wallets"
      "team_name" : "product-managed-identity-wallets"
      "description" : ""
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
        branch : "main"
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "product-dft-backend" : {
      name : "product-dft-backend"
      team_name : "product-dft"
      description : ""
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : true
        branch : "gh-pages"
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "tx-dft-backend" : {
      name : "tx-dft-backend"
      team_name : "product-dft"
      description : ""
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : true
        branch : "gh-pages"
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "product-dft-frontend" : {
      name : "product-dft-frontend"
      team_name : "product-dft"
      description : ""
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : true
        branch : "gh-pages"
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "tx-dft-frontend" : {
      name : "tx-dft-frontend"
      team_name : "product-dft"
      description : ""
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : true
        branch : "gh-pages"
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "product-sd-hub" : {
      name : "product-sd-hub"
      team_name : "product-essential-services"
      description : ""
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : true
        branch : "gh-pages"
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "product-omejdn-server" : {
      name : "product-omejdn-server"
      team_name : "product-essential-services"
      description : ""
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
        branch : "main"
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "product-DAPS" : {
      name : "product-DAPS"
      team_name : "product-essential-services"
      description : ""
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
        branch : "main"
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "product-item-relationship-service" : {
      name : "product-item-relationship-service"
      team_name : "product-traceability-irs"
      description : "DEPRECATED - use https://github.com/catenax-ng/tx-item-relationship-service"
      visibility : "public"
      homepage_url : "https://catenax-ng.github.io/product-item-relationship-service/docs/"
      topics : []
      pages : {
        enabled : true
        branch : "gh-pages"
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "product-testdata-2-edc" : {
      name : "product-testdata-2-edc"
      team_name : "product-data-integrity-demonstrator"
      description : ""
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
        branch : "main"
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "product-traceability-foss" : {
      name : "product-traceability-foss"
      team_name : "product-traceability-foss"
      description : ""
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
        branch : "main"
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "product-esc-backbone" : {
      name : "product-esc-backbone"
      team_name : "product-esc-backbone"
      description : ""
      visibility : "private"
      homepage_url : "https://argo.dev.demo.catena-x.net/"
      topics : []
      pages : {
        enabled : false
        branch : "main"
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : true
      codeowners : {
        review_count : 1
        pattern : "main"
      }
    },
    "product-traceability-foss-frontend" : {
      name : "product-traceability-foss-frontend"
      team_name : "product-traceability-foss"
      description : "Repo for the Frontend of the Traceability FOSS Application in Catena-X"
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
        branch : "main"
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "product-traceability-foss-backend" : {
      name : "product-traceability-foss-backend"
      team_name : "product-traceability-foss"
      description : "Repo for the Backend of the Traceability FOSS Application in Catena-X"
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : true
        branch : "gh-pages"
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "product-esc-backbone-code" : {
      name : "product-esc-backbone-code"
      team_name : "product-esc-backbone"
      description : ""
      visibility : "private"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
        branch : "main"
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "product-trace-cs-webapp" : {
      name : "product-trace-cs-webapp"
      team_name : "product-data-integrity-demonstrator"
      description : ""
      visibility : "private"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
        branch : "main"
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "product-explorer" : {
      name : "product-explorer"
      team_name : "product-explorer"
      description : ""
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
        branch : "main"
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "product-core-managed-identity-wallets-cd" : {
      name : "product-core-managed-identity-wallets-cd"
      team_name : "product-managed-identity-wallets"
      description : ""
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : true
        branch : "gh-pages"
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "product-behaviour-twin-pilot" : {
      name : "product-behaviour-twin-pilot"
      team_name : "product-behaviour-twin-pilot"
      description : "PLEASE ADD DESCRIPTION"
      visibility : "private"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
        branch : "main"
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "product-behaviour-twin-pilot-private" : {
      name : "product-behaviour-twin-pilot-private"
      team_name : "product-behaviour-twin-pilot"
      description : ""
      visibility : "private"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
        branch : "main"
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "product-value-added-service" : {
      name : "product-value-added-service"
      team_name : "product-value-added-service"
      description : "Repository for Value Added Service - Country Risk Backend"
      visibility : "public"
      homepage_url : ""
      topics : ["catena-x", "java", "spring-boot"]
      pages : {
        enabled : false
        branch : "main"
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "foss-example" : {
      name : "foss-example"
      team_name : "team-foss"
      description : ""
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
        branch : "main"
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "k8s-cluster-stack" : {
      name : "k8s-cluster-stack"
      team_name : "argocdadmins"
      description : "Bootstrapping k8s clusters with ready to use ArgoCD for k8s management."
      visibility : "public"
      homepage_url : ""
      topics : ["internal"]
      pages : {
        enabled : false
        branch : "main"
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "product-edc" : {
      name : "product-edc"
      team_name : "product-edc"
      description : "Repository for Catena-X specific eclipse dataspace connector apps"
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : true
        branch : "gh-pages"
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "k8s-helm-example" : {
      name : "k8s-helm-example"
      team_name : "product-team-example"
      description : "Example project for Argo CD integration and also landing pages for ArgoCD environments"
      visibility : "public"
      homepage_url : ""
      topics : ["ci-cd", "helm", "internal", "kubernetes"]
      pages : {
        enabled : true
        branch : "gh-pages"
      }
      is_template : true
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "catenax-ng.github.io" : {
      name : "catenax-ng.github.io"
      team_name : "team-foss"
      description : "https://catenax-ng.github.io"
      visibility : "public"
      homepage_url : "https://catenax-ng.github.io"
      topics : ["internal"]
      pages : {
        enabled : true
        branch : "gh-pages"
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "product-test-data-generator" : {
      name : "product-test-data-generator"
      team_name : "product-test-data-generator"
      description : "Catena-X Testdata Generator"
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
        branch : "main"
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "product-portal-hello-helm" : {
      name : "product-portal-hello-helm"
      team_name : "product-portal"
      description : "A minimal project template with a CI pipeline for docker"
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
        branch : "main"
      }
      is_template : true
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "product-portal-frontend-registration" : {
      name : "product-portal-frontend-registration"
      team_name : "product-portal"
      description : "Catena-X Portal Frontend Registration - DEPRECATED"
      visibility : "public"
      homepage_url : "https://portal.demo.catena-x.net/registration/"
      topics : ["catena-x", "frontend", "portal", "registration"]
      pages : {
        enabled : false
        branch : "main"
      }
      is_template : false
      uses_template : true
      template : {
        owner : "catenax-ng"
        repository : "product-portal-hello-helm"
      }
      codeowners_available : false
      codeowners : null
    },
    "product-vas-country-risk-frontend" : {
      name : "product-vas-country-risk-frontend"
      team_name : "product-value-added-service"
      description : "Repository for Value Added Service - Country Risk Frontend Dashboard"
      visibility : "public"
      homepage_url : ""
      topics : ["catena-x", "react"]
      pages : {
        enabled : false
        branch : "main"
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "product-knowledge" : {
      name : "product-knowledge"
      team_name : "product-knowledge"
      description : "Catena-X Knowledge Agents Architecture"
      visibility : "public"
      homepage_url : ""
      topics : ["sparql", "rdf", "ids", "edc", "catena-x"]
      pages : {
        enabled : true
        branch : "gh-pages"
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "product-battery-passport-consumer-app" : {
      name : "product-battery-passport-consumer-app"
      team_name : "product-material-pass"
      description : ""
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
        branch : "main"
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "gh-org-checks" : {
      name : "gh-org-checks"
      team_name : "argocdadmins"
      description : "GitHub workflow to compile and overview of repository defaults compliance throughout the GitHub org"
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
        branch : "main"
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : true
      codeowners : {
        review_count : 1
        pattern : "main"
      }
    },
    "maintenance-dashboard" : {
      name : "maintenance-dashboard"
      team_name : "argocdadmins"
      description : "DevSecOps team maintenance dashboard"
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
        branch : "main"
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : true
      codeowners : {
        review_count : 1
        pattern : "main"
      }
    },
    "product-simple-configurator" : {
      name : "product-simple-configurator"
      team_name : "product-essential-services"
      description : ""
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
        branch : "main"
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "product-vas-fraud-api" : {
      name : "product-vas-fraud-api"
      team_name : "product-value-added-service"
      description : ""
      visibility : "private"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
        branch : "main"
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "product-vas-fraud-workers" : {
      name : "product-vas-fraud-workers"
      team_name : "product-value-added-service"
      description : ""
      visibility : "private"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
        branch : "main"
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "product-vas-fraud-dashboard" : {
      name : "product-vas-fraud-dashboard"
      team_name : "product-value-added-service"
      description : ""
      visibility : "private"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
        branch : "main"
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "product-vas-fraud-dags" : {
      name : "product-vas-fraud-dags"
      team_name : "product-value-added-service"
      description : ""
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
        branch : "main"
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "product-vas-fraud-cd" : {
      name : "product-vas-fraud-cd"
      team_name : "product-value-added-service"
      description : ""
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
        branch : "main"
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "catena-x-release-deployment" : {
      name : "catena-x-release-deployment"
      team_name : "argocdadmins"
      description : "Consortia deployment configuration for Catena-X releases"
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : true
        branch : "gh-pages"
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : true
      codeowners : {
        review_count : 1
        pattern : "main"
      }
    },
    "product-daps-registration-service" : {
      name : "product-daps-registration-service"
      team_name : "product-essential-services"
      description : ""
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : true
        branch : "main"
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "product-registry-twin-check" : {
      name : "product-registry-twin-check"
      team_name : "product-registry-twin-check"
      description : ""
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
        branch : "main"
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "product-autosetup-backend" : {
      name : "product-autosetup-backend"
      team_name : "product-dft"
      description : ""
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
        branch : "main"
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "product-business-partner-certificates" : {
      name : "product-business-partner-certificates"
      team_name : "product-business-partner-certificates"
      description : ""
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
        branch : "main"
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "product-et-demonstrators" : {
      name : "product-et-demonstrators"
      team_name : "product-et-demonstrators"
      description : ""
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
        branch : "main"
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "product-item-relationship-service-frontend" : {
      name : "product-item-relationship-service-frontend"
      team_name : "product-item-relationship-service-frontend"
      description : ""
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : true
        branch : "main"
      }
      is_template : false
      uses_template : true
      template : {
        owner : "catenax-ng"
        repository : "k8s-helm-example"
      }
      codeowners_available : false
      codeowners : null
    },
    "product-esc-backbone-blockexplorer" : {
      name : "product-esc-backbone-blockexplorer"
      team_name : "product-esc-backbone"
      description : ""
      visibility : "private"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
        branch : ""
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "product-oem-hi-app" : {
      name : "product-oem-hi-app"
      team_name : "product-behaviour-twin-pilot"
      description : ""
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
        branch : ""
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "product-oem-rul-backend" : {
      name : "product-oem-rul-backend"
      team_name : "product-behaviour-twin-pilot"
      description : ""
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
        branch : ""
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "product-behaviour-twin-libraries" : {
      name : "product-behaviour-twin-libraries"
      team_name : "product-behaviour-twin-pilot"
      description : ""
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
        branch : ""
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "product-r-strategy-assistant" : {
      name : "product-r-strategy-assistant"
      team_name : "product-r-strategy-assistant"
      description : ""
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
        branch : ""
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "tx-sd-factory" : {
      name : "tx-sd-factory"
      team_name : "product-essential-services"
      description : ""
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
        branch : ""
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "tx-item-relationship-service" : {
      name : "tx-item-relationship-service"
      team_name : "product-traceability-irs"
      homepage_url : "https://catenax-ng.github.io/tx-item-relationship-service/docs/"
      description : ""
      visibility : "public"
      homepage_url : "https://catenax-ng.github.io/tx-item-relationship-service/docs/"
      topics : []
      pages : {
        enabled : true
        branch : "gh-pages"
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "tx-daps-registration-service" : {
      name : "tx-daps-registration-service"
      team_name : "product-essential-services"
      description : ""
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
        branch : ""
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "tx-daps-helm-chart" : {
      name : "tx-daps-helm-chart"
      team_name : "product-essential-services"
      description : ""
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
        branch : ""
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "tx-autosetup-backend" : {
      name : "tx-autosetup-backend"
      team_name : "product-essential-services"
      description : ""
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
        branch : ""
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "tx-portal-assets" : {
      name : "tx-portal-assets"
      team_name : "product-portal"
      description : "Catena-X Portal Assets"
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
        branch : ""
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "tx-portal-frontend-registration" : {
      name : "tx-portal-frontend-registration"
      team_name : "product-portal"
      description : "Catena-X Portal Frontend Registration"
      visibility : "public"
      homepage_url : "https://portal.demo.catena-x.net/registration/"
      topics : ["catena-x", "frontend", "portal", "registration"]
      pages : {
        enabled : false
        branch : ""
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "tx-portal-frontend" : {
      name : "tx-portal-frontend"
      team_name : "product-portal"
      description : "Catena-X Portal Frontend"
      visibility : "public"
      homepage_url : "https://portal.dev.demo.catena-x.net"
      topics : ["catena-x", "docker", "portal", "react", "typescript"]
      pages : {
        enabled : false
        branch : ""
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : {
        review_count : 1
        pattern : "[dm][ea][vi]*" # terrible workaround as GH provider can only create one rule and GH only supports very limited RegEx features
      }
    },
    "tx-portal-backend" : {
      name : "tx-portal-backend"
      team_name : "product-portal"
      description : "Catena-X Portal Backend"
      visibility : "public"
      homepage_url : ""
      topics : ["catena-x", "portal", "backend", "dotnet", "csharp", "docker"]
      pages : {
        enabled : false
        branch : ""
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "tractus-x-release" : {
      name : "tractus-x-release"
      team_name : ""
      description : ""
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : true
        branch : "gh-pages"
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "eclipse-tractusx.github.io" : {
      name : "eclipse-tractusx.github.io"
      team_name : ""
      description : ""
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
        branch : ""
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "product-bpdm-pool" : {
      name : "product-bpdm-pool"
      team_name : ""
      description : ""
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
        branch : ""
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "product-bpdm-gate" : {
      name : "product-bpdm-gate"
      team_name : ""
      description : ""
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
        branch : ""
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "product-bpdm-common" : {
      name : "product-bpdm-common"
      team_name : ""
      description : ""
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
        branch : ""
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
    "product-bpdm-cdq-bridge" : {
      name : "product-bpdm-cdq-bridge"
      team_name : ""
      description : ""
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
        branch : ""
      }
      is_template : false
      uses_template : false
      template : null
      codeowners_available : false
      codeowners : null
    },
  }

  github_repositories_teams = {
    # repoName-gh-teamName
    "product-puris-backend-product-puris" : {
      team_name : "product-puris"
      repository : "product-puris-backend"
      permission : "maintain"
    },
    "product-puris-frontend-product-puris" : {
      team_name : "product-puris"
      repository : "product-puris-frontend"
      permission : "maintain"
    },
    "product-bpdm-product-bpdm" : {
      team_name : "product-bpdm"
      repository : "product-bpdm"
      permission : "maintain"
    },
    "product-bpdm-pool-product-bpdm" : {
      team_name : "product-bpdm"
      repository : "product-bpdm-pool"
      permission : "maintain"
    },
    "product-bpdm-gate-product-bpdm" : {
      team_name : "product-bpdm"
      repository : "product-bpdm-gate"
      permission : "maintain"
    },
    "product-bpdm-common-product-bpdm" : {
      team_name : "product-bpdm"
      repository : "product-bpdm-common"
      permission : "maintain"
    },
    "product-bpdm-cdq-bridge-product-bpdm" : {
      team_name : "product-bpdm"
      repository : "product-bpdm-cdq-bridge"
      permission : "maintain"
    },
    "product-semantics-product-semantics" : {
      team_name : "product-semantics"
      repository : "product-semantics"
      permission : "maintain"
    },
    "product-portal-frontend-product-portal" : {
      team_name : "product-portal"
      repository : "product-portal-frontend"
      permission : "pull"
    },
    "product-portal-iam-product-portal" : {
      team_name : "product-portal"
      repository : "product-portal-iam"
      permission : "pull"
    },
    "product-innovation-radar-product-innovation-radar" : {
      team_name : "product-innovation-radar"
      repository : "product-innovation-radar"
      permission : "maintain"
    },
    "product-portal-backend-product-portal" : {
      team_name : "product-portal"
      repository : "product-portal-backend"
      permission : "pull"
    },
    "product-data-integrity-demonstrator-product-data-integrity-demonstrator" : {
      team_name : "product-data-integrity-demonstrator"
      repository : "product-data-integrity-demonstrator"
      permission : "maintain"
    },
    "catenax-at-home-catenax-at-home" : {
      team_name : "product-catenax-at-home"
      repository : "catenax-at-home"
      permission : "maintain"
    },
    "catenax-at-home-product-edc" : {
      team_name : "product-edc"
      repository : "catenax-at-home"
      permission : "maintain"
    },
    "product-core-schemas-cx-core-schemas" : {
      team_name : "cx-core-schemas"
      repository : "product-core-schemas"
      permission : "maintain"
    },
    "product-portal-cd-product-portal" : {
      team_name : "product-portal"
      repository : "product-portal-cd"
      permission : "pull"
    },
    "DataSpaceConnector-product-managed-identity-wallets" : {
      team_name : "product-managed-identity-wallets"
      repository : "DataSpaceConnector"
      permission : "maintain"
    },
    "product-portal-common-assets-product-portal" : {
      team_name : "product-portal"
      repository : "product-portal-common-assets"
      permission : "maintain"
    },
    "product-core-managed-identity-wallets-product-managed-identity-wallets" : {
      team_name : "product-managed-identity-wallets"
      repository : "product-core-managed-identity-wallets"
      permission : "maintain"
    },
    "product-dft-backend-product-dft" : {
      team_name : "product-dft"
      repository : "product-dft-backend"
      permission : "maintain"
    },
    "product-dft-frontend-product-dft" : {
      team_name : "product-dft"
      repository : "product-dft-frontend"
      permission : "maintain"
    },
    "tx-dft-backend-product-dft" : {
      team_name : "product-dft"
      repository : "tx-dft-backend"
      permission : "maintain"
    },
    "tx-dft-frontend-product-dft" : {
      team_name : "product-dft"
      repository : "tx-dft-frontend"
      permission : "maintain"
    },
    "product-sd-hub-product-essential-services" : {
      team_name : "product-essential-services"
      repository : "product-sd-hub"
      permission : "maintain"
    },
    "product-omejdn-server-product-essential-services" : {
      team_name : "product-essential-services"
      repository : "product-omejdn-server"
      permission : "maintain"
    },
    "product-DAPS-product-essential-services" : {
      team_name : "product-essential-services"
      repository : "product-DAPS"
      permission : "maintain"
    },
    "product-daps-registration-service-product-essential-services" : {
      team_name : "product-essential-services"
      repository : "product-daps-registration-service"
      permission : "maintain"
    },
    "tx-sd-factory-product-essential-services" : {
      team_name : "product-essential-services"
      repository : "tx-sd-factory"
      permission : "maintain"
    },
    "tx-autosetup-backend-product-essential-services" : {
      team_name : "product-essential-services"
      repository : "tx-autosetup-backend"
      permission : "maintain"
    },
    "tx-daps-registration-service-product-essential-services" : {
      team_name : "product-essential-services"
      repository : "tx-daps-registration-service"
      permission : "maintain"
    },
    "product-item-relationship-service-product-traceability-irs" : {
      team_name : "product-traceability-irs"
      repository : "product-item-relationship-service"
      permission : "maintain"
    },
    "tx-item-relationship-service-product-traceability-irs" : {
      team_name : "product-traceability-irs"
      repository : "tx-item-relationship-service"
      permission : "maintain"
    },
    "product-testdata-2-edc-product-data-integrity-demonstrator" : {
      team_name : "product-data-integrity-demonstrator"
      repository : "product-testdata-2-edc"
      permission : "maintain"
    },
    "product-traceability-foss" : {
      team_name : "product-traceability-foss"
      repository : "product-traceability-foss"
      permission : "maintain"
    },
    "product-esc-backbone-product-esc-backbone" : {
      team_name : "product-esc-backbone"
      repository : "product-esc-backbone"
      permission : "maintain"
    },
    "product-traceability-foss-frontend-product-traceability-foss" : {
      team_name : "product-traceability-foss"
      repository : "product-traceability-foss-frontend"
      permission : "maintain"
    },
    "product-traceability-foss-backend-product-traceability-foss" : {
      team_name : "product-traceability-foss"
      repository : "product-traceability-foss-backend"
      permission : "maintain"
    },
    "product-esc-backbone-code-product-esc-backbone" : {
      team_name : "product-esc-backbone"
      repository : "product-esc-backbone-code"
      permission : "maintain"
    },
    "product-explorer-product-explorer" : {
      team_name : "product-explorer"
      repository : "product-explorer"
      permission : "maintain"
    },
    "product-core-managed-identity-wallets-cd-product-managed-identity-wallets" : {
      team_name : "product-managed-identity-wallets"
      repository : "product-core-managed-identity-wallets-cd"
      permission : "maintain"
    },
    "product-behaviour-twin-pilot-product-behaviour-twin-pilot" : {
      team_name : "product-behaviour-twin-pilot"
      repository : "product-behaviour-twin-pilot"
      permission : "maintain"
    },
    "product-behaviour-twin-pilot-private-product-behaviour-twin-pilot" : {
      team_name : "product-behaviour-twin-pilot"
      repository : "product-behaviour-twin-pilot-private"
      permission : "maintain"
    },
    "product-value-added-service-product-value-added-service" : {
      team_name : "product-value-added-service"
      repository : "product-value-added-service"
      permission : "maintain"
    },
    "foss-example-team-foss" : {
      team_name : "team-foss"
      repository : "foss-example"
      permission : "maintain"
    },
    "product-idses-frontend-apps-product-essential-services" : {
      team_name : "product-essential-services"
      repository : "product-idses-frontend-apps"
      permission : "maintain"
    },
    "k8s-cluster-stack-argocdadmins" : {
      team_name : "argocdadmins"
      repository : "k8s-cluster-stack"
      permission : "admin"
    },
    "product-portal-frontend-registration-product-portal" : {
      team_name : "product-portal"
      repository : "product-portal-frontend-registration"
      permission : "pull"
    },
    "product-edc-product-edc" : {
      team_name : "product-edc"
      repository : "product-edc"
      permission : "maintain"
    },
    "product-edc-product-managed-identity-wallets" = {
      team_name : "product-managed-identity-wallets"
      repository : "product-edc"
      permission : "maintain"
    },
    "k8s-helm-example-product-team-example" : {
      team_name : "product-team-example"
      repository : "k8s-helm-example"
      permission : "maintain"
    },
    "catenax-ng.github.io-team-foss" : {
      team_name : "team-foss"
      repository : "catenax-ng.github.io"
      permission : "maintain"
    },
    "catenax-ng.github.io-argocdadmins" : {
      team_name : "argocdadmins"
      repository : "catenax-ng.github.io"
      permission : "admin"
    },
    "product-test-data-generator-product-test-data-generator" : {
      team_name : "product-test-data-generator"
      repository : "product-test-data-generator"
      permission : "maintain"
    },
    "product-vas-country-risk-frontend-product-value-added-service" : {
      team_name : "product-value-added-service"
      repository : "product-vas-country-risk-frontend"
      permission : "maintain"
    },
    "product-knowlege-product-knowledge" : {
      team_name : "product-knowledge"
      repository : "product-knowledge"
      permission : "maintain"
    },
    "gh-org-checks-argocdadmins" : {
      team_name : "argocdadmins"
      repository : "gh-org-checks"
      permission : "admin"
    },
    "product-battery-passport-consumer-app-product-material-pass" : {
      team_name : "product-material-pass"
      repository : "product-battery-passport-consumer-app"
      permission : "maintain"
    },
    "maintenance-dashboard-argocdadmins" : {
      team_name : "argocdadmins"
      repository : "maintenance-dashboard"
      permission : "admin"
    },
    "product-simple-configurator-product-essential-services" : {
      team_name : "product-essential-services"
      repository : "product-simple-configurator"
      permission : "maintain"
    },
    "product-vas-fraud-api-product-value-added-service" : {
      team_name : "product-value-added-service"
      repository : "product-vas-fraud-api"
      permission : "maintain"
    },
    "product-vas-fraud-workers-product-value-added-service" : {
      team_name : "product-value-added-service"
      repository : "product-vas-fraud-workers"
      permission : "maintain"
    },
    "product-vas-fraud-dashboard-product-value-added-service" : {
      team_name : "product-value-added-service"
      repository : "product-vas-fraud-dashboard"
      permission : "maintain"
    },
    "product-vas-fraud-dags-product-value-added-service" : {
      team_name : "product-value-added-service"
      repository : "product-vas-fraud-dags"
      permission : "maintain"
    },
    "product-vas-fraud-cd-product-value-added-service" : {
      team_name : "product-value-added-service"
      repository : "product-vas-fraud-cd"
      permission : "maintain"
    },
    "catena-x-release-deployment-argocdadmins" : {
      team_name : "argocdadmins"
      repository : "catena-x-release-deployment"
      permission : "admin"
    },
    "catena-x-release-deployment-release-management" : {
      team_name : "release-management"
      repository : "catena-x-release-deployment"
      permission : "maintain"
    },
    "catena-x-release-deployment-test-management" : {
      team_name : "test-management"
      repository : "catena-x-release-deployment"
      permission : "maintain"
    },
    "catena-x-release-deployment-product-portal" : {
      team_name : "product-portal"
      repository : "catena-x-release-deployment"
      permission : "push"
    },
    "tx-portal-assets-product-portal" : {
      team_name : "product-portal"
      repository : "tx-portal-assets"
      permission : "maintain"
    },
    "tx-portal-frontend-registration-product-portal" : {
      team_name : "product-portal"
      repository : "tx-portal-frontend-registration"
      permission : "maintain"
    },
    "tx-portal-frontend-product-portal" : {
      team_name : "product-portal"
      repository : "tx-portal-frontend"
      permission : "maintain"
    },
    "tx-portal-backend-product-portal" : {
      team_name : "product-portal"
      repository : "tx-portal-backend"
      permission : "maintain"
    },
    "catena-x-release-deployment-product-semantics" : {
      team_name : "product-semantics"
      repository : "catena-x-release-deployment"
      permission : "push"
    },
    "catena-x-release-deployment-product-essential-services" : {
      team_name : "product-essential-services"
      repository : "catena-x-release-deployment"
      permission : "push"
    },
    "catena-x-release-deployment-product-bpdm" : {
      team_name : "product-bpdm"
      repository : "catena-x-release-deployment"
      permission : "push"
    },
    "catena-x-release-deployment-product-managed-identity-wallets" : {
      team_name : "product-managed-identity-wallets"
      repository : "catena-x-release-deployment"
      permission : "push"
    },
    "product-data-integrity-demonstrator-product-trace-cs-webapp" : {
      team_name : "product-data-integrity-demonstrator"
      repository : "product-trace-cs-webapp"
      permission : "maintain"
    },
    "product-registry-twin-check-product-registry-twin-check" : {
      team_name : "product-registry-twin-check"
      repository : "product-registry-twin-check"
      permission : "maintain"
    },
    "product-autosetup-backend-product-dft" : {
      team_name : "product-dft"
      repository : "product-autosetup-backend"
      permission : "maintain"
    },
    "product-business-partner-certificates-product-business-partner-certificates" : {
      team_name : "product-business-partner-certificates"
      repository : "product-business-partner-certificates"
      permission : "maintain"
    },
    "product-et-demonstrators-product-et-demonstrators" : {
      team_name : "product-et-demonstrators"
      repository : "product-et-demonstrators"
      permission : "maintain"
    },
    "product-item-relationship-service-frontend-product-item-relationship-service-frontend" : {
      team_name : "product-item-relationship-service-frontend"
      repository : "product-item-relationship-service-frontend"
      permission : "maintain"
    },
    "product-esc-backbone-blockexplorer-product-esc-backbone" : {
      team_name : "product-esc-backbone"
      repository : "product-esc-backbone-blockexplorer"
      permission : "maintain"
    },
    "product-oem-hi-app-product-behaviour-twin-pilot" : {
      team_name : "product-behaviour-twin-pilot"
      repository : "product-oem-hi-app"
      permission : "maintain"
    },
    "product-oem-rul-backend-product-behaviour-twin-pilot" : {
      team_name : "product-behaviour-twin-pilot"
      repository : "product-oem-rul-backend"
      permission : "maintain"
    },
    "product-behaviour-twin-libraries-product-behaviour-twin-pilot" : {
      team_name : "product-behaviour-twin-pilot"
      repository : "product-behaviour-twin-libraries"
      permission : "maintain"
    },
    "product-r-strategy-assistant-product-r-strategy-assistant" : {
      team_name : "product-r-strategy-assistant"
      repository : "product-r-strategy-assistant"
      permission : "maintain"
    }
  }
}
