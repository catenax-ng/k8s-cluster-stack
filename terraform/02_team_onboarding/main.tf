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
      "description" : ""
    }
  }

  github_repositories = {
    "product-bpdm" : {
      "name" : "product-bpdm"
      "team_name" : "product-bpdm"
      "description" : ""
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
      }
      is_template : false
      uses_template : false
      template : null
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
      }
      is_template : false
      uses_template : false
      template : null
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
      }
      is_template : false
      uses_template : false
      template : null
    },
    "product-portal-frontend" : {
      name : "product-portal-frontend"
      team_name : "product-portal"
      description : "Catena-X Portal Frontend"
      visibility : "public"
      homepage_url : "https://portal.dev.demo.catena-x.net"
      topics : ["catena-x", "docker", "portal", "react", "typescript"]
      pages : {
        enabled : false
      }
      is_template : false
      uses_template : false
      template : null
    },
    "product-portal-iam" : {
      name : "product-portal-iam"
      team_name : "product-portal"
      description : ""
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
      }
      is_template : false
      uses_template : false
      template : null
    },
    "product-portal-backend" : {
      name : "product-portal-backend"
      team_name : "product-portal"
      description : ""
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
      }
      is_template : false
      uses_template : false
      template : null
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
      }
      is_template : false
      uses_template : false
      template : null
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
      }
      is_template : false
      uses_template : false
      template : null
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
      }
      is_template : false
      uses_template : false
      template : null
    },
    "product-portal-cd" : {
      name : "product-portal-cd"
      team_name : "product-portal"
      description : ""
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
      }
      is_template : false
      uses_template : false
      template : null
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
      }
      is_template : false
      uses_template : false
      template : null
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
      }
      is_template : false
      uses_template : false
      template : null
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
      }
      is_template : false
      uses_template : false
      template : null
    },
    "product-dft-backend" : {
      name : "product-dft-backend"
      team_name : "product-dft"
      description : ""
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
      }
      is_template : false
      uses_template : false
      template : null
    },
    "product-dft-frontend" : {
      name : "product-dft-frontend"
      team_name : "product-dft"
      description : ""
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
      }
      is_template : false
      uses_template : false
      template : null
    },
    "product-sd-hub" : {
      name : "product-sd-hub"
      team_name : "product-essential-services"
      description : ""
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
      }
      is_template : false
      uses_template : false
      template : null
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
      }
      is_template : false
      uses_template : false
      template : null
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
      }
      is_template : false
      uses_template : false
      template : null
    },
    "product-item-relationship-service" : {
      name : "product-item-relationship-service"
      team_name : "product-traceability-irs"
      description : ""
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
      }
      is_template : false
      uses_template : false
      template : null
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
      }
      is_template : false
      uses_template : false
      template : null
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
      }
      is_template : false
      uses_template : false
      template : null
    },
    "product-esc-backbone" : {
      name : "product-esc-backbone"
      team_name : "product-esc-backbone"
      description : ""
      visibility : "private"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
      }
      is_template : false
      uses_template : false
      template : null
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
      }
      is_template : false
      uses_template : false
      template : null
    },
    "product-traceability-foss-backend" : {
      name : "product-traceability-foss-backend"
      team_name : "product-traceability-foss"
      description : "Repo for the Backend of the Traceability FOSS Application in Catena-X"
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
      }
      is_template : false
      uses_template : false
      template : null
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
      }
      is_template : false
      uses_template : false
      template : null
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
      }
      is_template : false
      uses_template : false
      template : null
    },
    "product-core-managed-identity-wallets-cd" : {
      name : "product-core-managed-identity-wallets-cd"
      team_name : "product-managed-identity-wallets"
      description : ""
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
      }
      is_template : false
      uses_template : false
      template : null
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
      }
      is_template : false
      uses_template : false
      template : null
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
      }
      is_template : false
      uses_template : false
      template : null
    },
    "product-value-added-service" : {
      name : "product-value-added-service"
      team_name : "product-value-added-service"
      description : ""
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
      }
      is_template : false
      uses_template : false
      template : null
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
      }
      is_template : false
      uses_template : false
      template : null
    }
    "k8s-cluster-stack" : {
      name : "k8s-cluster-stack"
      team_name : "argocdadmins"
      description : "Bootstrapping k8s clusters with ready to use ArgoCD for k8s management."
      visibility : "public"
      homepage_url : ""
      topics : ["internal"]
      pages : {
        enabled : false
      }
      is_template : false
      uses_template : false
      template : null
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
      }
      is_template : false
      uses_template : false
      template : null
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
      }
      is_template : false
      uses_template : false
      template : null
    }
    "catenax-ng.github.io" : {
      name : "catenax-ng.github.io"
      team_name : "team-foss"
      description : "https://catenax-ng.github.io"
      visibility : "public"
      homepage_url : "https://catenax-ng.github.io"
      topics : ["internal"]
      pages : {
        enabled : true
      }
      is_template : false
      uses_template : false
      template : null
    }
    "product-test-data-generator" : {
      name : "product-test-data-generator"
      team_name : "product-test-data-generator"
      description : "Catena-X Testdata Generator"
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : true
      }
      is_template : false
      uses_template : false
      template : null
    }
    "product-portal-hello-helm" : {
      name : "product-portal-hello-helm"
      team_name : "product-portal"
      description : "A minimal project template with a CI pipeline for docker"
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
      }
      is_template : true
      uses_template : false
      template : null
    }
    "product-portal-frontend-registration" : {
      name : "product-portal-frontend-registration"
      team_name : "product-portal"
      description : "Catena-X Portal Frontend Registration"
      visibility : "public"
      homepage_url : "https://portal.demo.catena-x.net/registration/"
      topics : ["catena-x", "frontend", "portal", "registration"]
      pages : {
        enabled : false
      }
      is_template : false
      uses_template : true
      template : {
        owner : "catenax-ng"
        repository : "product-portal-hello-helm"
      }
    }
    "product-vas-country-risk-frontend" : {
      name : "product-vas-country-risk-frontend"
      team_name : "product-value-added-service"
      description : ""
      visibility : "public"
      homepage_url : ""
      topics : []
      pages : {
        enabled : false
      }
      is_template : false
      uses_template : false
      template : null
    }
  }

  github_repositories_teams = {
    "product-bpdm-product-bpdm" : {
      team_name : "product-bpdm"
      repository : "product-bpdm"
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
      permission : "maintain"
    },
    "product-portal-iam-product-portal" : {
      team_name : "product-portal"
      repository : "product-portal-iam"
      permission : "maintain"
    },
    "product-portal-backend-product-portal" : {
      team_name : "product-portal"
      repository : "product-portal-backend"
      permission : "maintain"
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
    "product-core-schemas-cx-core-schemas" : {
      team_name : "cx-core-schemas"
      repository : "product-core-schemas"
      permission : "maintain"
    },
    "product-portal-cd-product-portal" : {
      team_name : "product-portal"
      repository : "product-portal-cd"
      permission : "maintain"
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
    "product-item-relationship-service-product-traceability-irs" : {
      team_name : "product-traceability-irs"
      repository : "product-item-relationship-service"
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
    }
    "k8s-cluster-stack-argocdadmins" : {
      team_name : "argocdadmins"
      repository : "k8s-cluster-stack"
      permission : "admin"
    }
    "product-portal-frontend-registration-product-portal" : {
      team_name : "product-portal"
      repository : "product-portal-frontend-registration"
      permission : "maintain"
    }
    "product-edc-product-edc" : {
      team_name : "product-edc"
      repository : "product-edc"
      permission : "maintain"
    }
    "k8s-helm-example-product-team-example" : {
      team_name : "product-team-example"
      repository : "k8s-helm-example"
      permission : "maintain"
    }
    "catenax-ng.github.io-team-foss" : {
      team_name : "team-foss"
      repository : "catenax-ng.github.io"
      permission : "maintain"
    }
    "catenax-ng.github.io-argocdadmins" : {
      team_name : "argocdadmins"
      repository : "catenax-ng.github.io"
      permission : "admin"
    }
    "product-test-data-generator-product-test-data-generator" : {
      team_name : "product-test-data-generator"
      repository : "product-test-data-generator"
      permission : "maintain"
    }
    "product-vas-country-risk-frontend-product-value-added-service" : {
      team_name : "product-value-added-service"
      repository : "product-vas-country-risk-frontend"
      permission : "maintain"
    }
  }
}
