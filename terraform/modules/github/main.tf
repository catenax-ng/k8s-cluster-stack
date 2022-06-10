# Define desired state of all repositories
# @url: https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository
resource "github_repository" "cx-github-repositories" {
  for_each = var.github_repositories
  
  name        = each.value.name
  description = each.value.description

  has_issues   = each.value.has_issues
  has_projects = each.value.has_projects
  has_wiki     = each.value.has_wiki
  visibility   = "public"
  auto_init    = true
}

# Define desired state of all teams to the organization
# @url: https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team
resource "github_team" "cx-github-teams" {
  for_each = var.github_teams

  name        = each.value.name
  description = each.value.description
  privacy     = "closed"
}
resource "github_team_repository" "cx-github-team-repository" {
  for_each = var.github_repositories

  team_id    = github_team.cx-github-teams[each.value.team_name].id
  repository = each.value.name  
  permission = "maintain"
}
#@url: https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_file
# resource "github_repository_file" "foo" {
#   repository          = github_repository.foo.name
#   branch              = "main"
#   file                = ".gitignore"
#   content             = "**/*.tfstate"
#   commit_message      = "Managed by Terraform"
#   commit_author       = "Terraform User"
#   commit_email        = "terraform@example.com"
#   overwrite_on_create = true
# }
data "github_organization" "catenax_ng" {
  name = "catenax-ng"
}
