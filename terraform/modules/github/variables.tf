variable "github_repositories" {
  description = "Github"
  type = map(object({
    name         = string
    description  = string
    has_issues   = bool
    has_projects = bool
    has_wiki     = bool
    team_name    = string
  }))
  default = {
    "product-bpdm" : {
      "name" : "product-bpdm",
      "team_name" : "product-bpdm",
      "description" : "",
      "has_issues" : false,
      "has_projects" : false,
      "has_wiki" : false
    },
    "product-idses-frontend-apps" : {
      "name" : "product-idses-frontend-apps",
      "team_name" : "product-essential-services",
      "description" : "",
      "has_issues" : false,
      "has_projects" : false,
      "has_wiki" : false
    },
    "product-test-data-generator" : {
      "name" : "product-test-data-generator",
      "team_name" : "product-test-data-generator",
      "description" : "Catena-X Testdata Generator",
      "has_issues" : false,
      "has_projects" : false,
      "has_wiki" : false
    },
    "cluster-bootstrapping" : {
      "name" : "cluster-bootstrapping",
      "team_name" : "argocdadmins", # NO TEAM ASSIGNED
      "description" : "",
      "has_issues" : false,
      "has_projects" : false,
      "has_wiki" : false
    },
    "devops-apps" : {
      "name" : "devops-apps",
      "team_name" : "argocdadmins", # NO TEAM ASSIGNED
      "description" : "",
      "has_issues" : false,
      "has_projects" : false,
      "has_wiki" : false
    },
    "environment-documentation" : {
      "name" : "environment-documentation",
      "team_name" : "argocdadmins", # NO TEAM ASSIGNED
      "description" : "",
      "has_issues" : false,
      "has_projects" : false,
      "has_wiki" : false
    },
    "product-semantics" : {
      "name" : "product-semantics",
      "team_name" : "product-semantics",
      "description" : "",
      "has_issues" : false,
      "has_projects" : false,
      "has_wiki" : false
    },
    "k8s-cluster-stack" : {
      "name" : "k8s-cluster-stack",
      "team_name" : "argocdadmins",
      "description" : "Bootstrapping k8s clusters with ready to use ArgoCD for k8s management.",
      "has_issues" : false,
      "has_projects" : false,
      "has_wiki" : false
    },
    "acme" : {
      "name" : "acme",
      "team_name" : "argocdadmins", #NO TEAM ASSIGNED
      "description" : "Landing page including documentations.",
      "has_issues" : false,
      "has_projects" : false,
      "has_wiki" : false
    },
    "github" : {
      "name" : "github",
      "team_name" : "argocdadmins", # NO TEAM ASSIGNED
      "description" : "",
      "has_issues" : false,
      "has_projects" : false,
      "has_wiki" : false
    },
    "product-portal-frontend" : {
      "name" : "product-portal-frontend",
      "team_name" : "product-portal",
      "description" : "Catena-X Portal Frontend",
      "has_issues" : false,
      "has_projects" : false,
      "has_wiki" : false
    },
    "product-edc" : {
      "name" : "product-edc",
      "team_name" : "product-edc",
      "description" : "Repository for Catena-X specific eclipse dataspace connector apps",
      "has_issues" : false,
      "has_projects" : false,
      "has_wiki" : false
    },
    "product-portal-iam" : {
      "name" : "product-portal-iam",
      "team_name" : "product-portal",
      "description" : "",
      "has_issues" : false,
      "has_projects" : false,
      "has_wiki" : false
    },
    "product-portal-backend" : {
      "name" : "product-portal-backend",
      "team_name" : "product-portal",
      "description" : "",
      "has_issues" : false,
      "has_projects" : false,
      "has_wiki" : false
    },
    "k8s-helm-example" : {
      "name" : "k8s-helm-example",
      "team_name" : "product-team-example",
      "description" : "Example project for Argo CD integration",
      "has_issues" : false,
      "has_projects" : false,
      "has_wiki" : false
    },
    "catenax-ng.github.io" : {
      "name" : "catenax-ng.github.io",
      "team_name" : "team-foss",
      "description" : "https://catenax-ng.github.io",
      "has_issues" : false,
      "has_projects" : false,
      "has_wiki" : false
    },
    "product-data-integrity-demonstrator" : {
      "name" : "product-data-integrity-demonstrator",
      "team_name" : "product-data-integrity-demonstrator",
      "description" : "",
      "has_issues" : false,
      "has_projects" : false,
      "has_wiki" : false
    },
    "catenax-at-home" : {
      "name" : "catenax-at-home",
      "team_name" : "product-catenax-at-home",
      "description" : "",
      "has_issues" : false,
      "has_projects" : false,
      "has_wiki" : false
    },
    "product-portal-hello-helm" : {
      "name" : "product-portal-hello-helm",
      "team_name" : "product-portal",
      "description" : "A minimal project template with a CI pipeline for docker",
      "has_issues" : false,
      "has_projects" : false,
      "has_wiki" : false
    },
    "product-traceability-dft-ui" : {
      "name" : "product-traceability-dft-ui",
      "team_name" : "argocdadmins", # NO TEAM ASSIGNED
      "description" : "",
      "has_issues" : false,
      "has_projects" : false,
      "has_wiki" : false
    },
    "product-core-schemas" : {
      "name" : "product-core-schemas",
      "team_name" : "cx-core-schemas",
      "description" : "",
      "has_issues" : false,
      "has_projects" : false,
      "has_wiki" : false
    },
    "product-portal-frontend-registration" : {
      "name" : "product-portal-frontend-registration",
      "team_name" : "product-portal",
      "description" : "Catena-X Portal Frontend Registration",
      "has_issues" : false,
      "has_projects" : false,
      "has_wiki" : false
    },
    "product-portal-cd" : {
      "name" : "product-portal-cd",
      "team_name" : "product-portal",
      "description" : "",
      "has_issues" : false,
      "has_projects" : false,
      "has_wiki" : false
    },
    "DataSpaceConnector" : {
      "name" : "DataSpaceConnector",
      "team_name" : "product-managed-identity-wallets",
      "description" : "DataspaceConnector project",
      "has_issues" : false,
      "has_projects" : false,
      "has_wiki" : false
    },
    "product-portal-common-assets" : {
      "name" : "product-portal-common-assets",
      "team_name" : "product-portal",
      "description" : "Assets used by the Catena-X Portal",
      "has_issues" : false,
      "has_projects" : false,
      "has_wiki" : false
    },
    "product-core-managed-identity-wallets" : {
      "name" : "product-core-managed-identity-wallets",
      "team_name" : "product-managed-identity-wallets",
      "description" : "",
      "has_issues" : false,
      "has_projects" : false,
      "has_wiki" : false
    },
    "product-dft-backend" : {
      "name" : "product-dft-backend",
      "team_name" : "product-dft",
      "description" : "",
      "has_issues" : false,
      "has_projects" : false,
      "has_wiki" : false
    },
    "product-dft-frontend" : {
      "name" : "product-dft-frontend",
      "team_name" : "product-dft",
      "description" : "",
      "has_issues" : false,
      "has_projects" : false,
      "has_wiki" : false
    },
    "product-sd-hub" : {
      "name" : "product-sd-hub",
      "team_name" : "product-essential-services",
      "description" : "",
      "has_issues" : false,
      "has_projects" : false,
      "has_wiki" : false
    },
    "product-omejdn-server" : {
      "name" : "product-omejdn-server",
      "team_name" : "product-essential-services",
      "description" : "",
      "has_issues" : false,
      "has_projects" : false,
      "has_wiki" : false
    },
    "product-DAPS" : {
      "name" : "product-DAPS",
      "team_name" : "product-essential-services",
      "description" : "",
      "has_issues" : false,
      "has_projects" : false,
      "has_wiki" : false
    },
    "product-item-relationship-service" : {
      "name" : "product-item-relationship-service",
      "team_name" : "product-traceability-irs",
      "description" : "",
      "has_issues" : false,
      "has_projects" : false,
      "has_wiki" : false
    },
    "IDS-Ess-FE" : {
      "name" : "IDS-Ess-FE",
      "team_name" : "argocdadmins", # NON TEAM ASSIGNED!
      "description" : "",
      "has_issues" : false,
      "has_projects" : false,
      "has_wiki" : false
    },
    "product-testdata-2-edc" : {
      "name" : "product-testdata-2-edc",
      "team_name" : "product-data-integrity-demonstrator",
      "description" : "",
      "has_issues" : false,
      "has_projects" : false,
      "has_wiki" : false
    },
    "product-traceability-foss" : {
      "name" : "product-traceability-foss",
      "team_name" : "product-traceability-foss",
      "description" : "",
      "has_issues" : false,
      "has_projects" : false,
      "has_wiki" : false
    },
    "product-esc-backbone" : {
      "name" : "product-esc-backbone",
      "team_name" : "product-esc-backbone",
      "description" : "",
      "has_issues" : false,
      "has_projects" : false,
      "has_wiki" : false
    },
    "product-traceability-foss-frontend" : {
      "name" : "product-traceability-foss-frontend",
      "team_name" : "product-traceability-foss",
      "description" : "Repo for the Frontend of the Traceability FOSS Application in Catena-X",
      "has_issues" : false,
      "has_projects" : false,
      "has_wiki" : false
    },
    "product-traceability-foss-backend" : {
      "name" : "product-traceability-foss-backend",
      "team_name" : "product-traceability-foss",
      "description" : "Repo for the Backend of the Traceability FOSS Application in Catena-X",
      "has_issues" : false,
      "has_projects" : false,
      "has_wiki" : false
    },
    "product-esc-backbone-code" : {
      "name" : "product-esc-backbone-code",
      "team_name" : "product-esc-backbone",
      "description" : "",
      "has_issues" : false,
      "has_projects" : false,
      "has_wiki" : false
    },
    "product-explorer" : {
      "name" : "product-explorer",
      "team_name" : "product-explorer",
      "description" : "",
      "has_issues" : false,
      "has_projects" : false,
      "has_wiki" : false
    },
    "product-core-managed-identity-wallets-cd" : {
      "name" : "product-core-managed-identity-wallets-cd",
      "team_name" : "product-managed-identity-wallets",
      "description" : "",
      "has_issues" : false,
      "has_projects" : false,
      "has_wiki" : false
    },
    "product-behaviour-twin-pilot" : {
      "name" : "product-behaviour-twin-pilot",
      "team_name" : "product-behaviour-twin-pilot",
      "description" : "PLEASE ADD DESCRIPTION",
      "has_issues" : false,
      "has_projects" : false,
      "has_wiki" : false
    },
    "product-behaviour-twin-pilot-private" : {
      "name" : "product-behaviour-twin-pilot-private",
      "team_name" : "product-behaviour-twin-pilot",
      "description" : "",
      "has_issues" : false,
      "has_projects" : false,
      "has_wiki" : false
    },
    "product-value-added-service" : {
      "name" : "product-value-added-service",
      "team_name" : "product-value-added-service",
      "description" : "",
      "has_issues" : false,
      "has_projects" : false,
      "has_wiki" : false
    },
    "foss-example" : {
      "name" : "foss-example",
      "team_name" : "team-foss",
      "description" : "",
      "has_issues" : false,
      "has_projects" : false,
      "has_wiki" : false
    }
  }
}
variable "github_teams" {
  description = "Github team definition with its repositories for all product teams to use as local variable"
  type = map(object({
    name        = string
    description = string
  }))
  default = {
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
    "product-bpdm-vas" : {
      "name" : "product-bpdm-vas",
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
    }
  }
}
