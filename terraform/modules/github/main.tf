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

# Define desired state of all repositories
# @url: https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository
resource "github_repository" "cx-github-repositories" {
  for_each = var.github_repositories
  
  name        = each.value.name
  description = each.value.description
  
  has_issues = each.value.has_issues
  has_projects = each.value.has_projects
  has_wiki = each.value.has_wiki
  visibility = "public"
  auto_init = true
}

# Define desired state of all teams to the organization
# @url: https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team
resource "github_team" "cx-github-teams" {
  for_each = var.github

  name        = each.value.name
  description = each.value.description
  privacy     = "closed"
}

data "github_organization" "catenax_ng" {
  name = "catenax-ng"
}