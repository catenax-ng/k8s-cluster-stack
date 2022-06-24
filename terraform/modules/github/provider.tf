terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.26.0"
    }
  }
}
#/terraform/modules/github/provider.tf
provider "github" {
  token = var.github_token
  owner = "catenax-ng"
}