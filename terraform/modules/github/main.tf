# Define desired state of all repositories
# @url: https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository
resource "github_repository" "repositories" {
  for_each = var.github_repositories

  name        = each.value.name
  description = each.value.description

  has_issues             = false
  has_projects           = false
  has_wiki               = false
  visibility             = each.value.visibility
  auto_init              = true
  has_downloads          = true
  vulnerability_alerts   = true
  delete_branch_on_merge = true
  homepage_url           = each.value.homepage_url
  topics                 = each.value.topics
}

# Define desired state of all teams to the organization
# @url: https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team
resource "github_team" "teams" {
  for_each = var.github_teams

  name        = each.value.name
  description = each.value.description
  privacy     = "closed"
}

resource "github_team_repository" "team-repository-access" {
  for_each = var.github_repositories

  team_id    = github_team.teams[each.value.team_name].id
  repository = each.value.name
  permission = "maintain"
}
/*
# This resource allows you to configure branch protection for repositories in your organization. When applied, the branch will be protected from forced pushes and deletion. Additional constraints, such as required status checks or restrictions on users, teams, and apps, can also be configured.
# @url: https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_protection_v3
resource "github_branch_protection_v3" "cx-github-repositories-branch-protection-main" {
  for_each = var.github_repositories

  repository                      = each.value.name
  branch                          = "main"
  enforce_admins                  = true
  require_conversation_resolution = true
  require_signed_commits          = false

  required_pull_request_reviews {
    dismiss_stale_reviews           = true
    require_code_owner_reviews      = true
    required_approving_review_count = 1
  }
  required_status_checks {
    strict = true
  }
}

# This resource allows you to create and manage files within a GitHub repository.
#@url: https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_file
resource "github_repository_file" "cx-github-repositroy-file-codeowners" {
  for_each = var.github_repositories

  repository = each.value.name

  branch              = "main"
  file                = "CODEOWNERS"
  content             = <<EOT
# You can use a CODEOWNERS file to define individuals or teams that are responsible for code in a repository.
# Learn more about it: https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners
# Example of CODEOWNER file: https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners#example-of-a-codeowners-file
EOT
  commit_message      = "Add CODEOWNERS file as default repository configuration"
  commit_author       = "Catena-X DevSecOps"
  commit_email        = "devsecops@catena-x.net"
  overwrite_on_create = false
}
*/
