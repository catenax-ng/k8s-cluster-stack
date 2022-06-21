terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.26.0"
    }
  }
}

# Configure the GitHub Provider
provider "github" {
  token = var.github_token
  owner = var.github_owner
}