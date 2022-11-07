locals {
  codeowners_repos                 = {for k, v in var.github_repositories : k => v if v.codeowners_available}
  product_team_repos_with_template = {for k, v in var.github_repositories : k => v if v.uses_template == true && (try(v.template.repository, "") == "k8s-helm-example")}
}

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
  is_template            = each.value.is_template
  homepage_url           = each.value.homepage_url
  topics                 = each.value.topics

  merge_commit_message        = "PR_TITLE"
  merge_commit_title          = "MERGE_MESSAGE"
  squash_merge_commit_message = "COMMIT_MESSAGES"
  squash_merge_commit_title   = "COMMIT_OR_PR_TITLE"

  dynamic "template" {
    for_each = each.value.uses_template ? [true] : []
    content {
      owner      = each.value.template.owner
      repository = each.value.template.repository
    }
  }

  dynamic "pages" {
    for_each = each.value.pages.enabled ? [true] : []
    content {
      source {
        branch = each.value.pages.branch
      }
    }
  }
}

resource "github_branch" "gh-pages" {
  for_each = local.product_team_repos_with_template

  repository = each.value.name
  branch     = "gh-pages"

  depends_on = [
    github_repository.repositories
  ]
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
  for_each = var.github_repositories_teams

  team_id    = github_team.teams[each.value.team_name].id
  repository = each.value.repository
  permission = each.value.permission
}

# This resource allows you to create and manage files within a GitHub repository.
#@url: https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_file
resource "github_repository_file" "codeowners" {
  for_each = local.codeowners_repos

  repository = each.value.name

  branch              = github_repository.repositories[each.value.name].default_branch
  file                = ".github/CODEOWNERS"
  content             = <<EOT
# You can use a CODEOWNERS file to define individuals or teams that are responsible for code in a repository.
# Learn more about it: https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners
# Example of CODEOWNER file: https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners#example-of-a-codeowners-file
*        @catenax-ng/${each.value.team_name}
EOT
  commit_message      = "Add CODEOWNERS file as default repository configuration"
  commit_author       = "Catena-X DevSecOps"
  commit_email        = "devsecops@catena-x.net"
  overwrite_on_create = false
}

resource "github_branch_protection" "branch_protection" {
  for_each = {for k, v in local.codeowners_repos : k => v if v.visibility == "public"}

  repository_id                   = each.value.name
  pattern                         = each.value.codeowners.pattern
  enforce_admins                  = false
  require_conversation_resolution = true
  require_signed_commits          = false

  required_pull_request_reviews {
    dismiss_stale_reviews           = true
    require_code_owner_reviews      = true
    required_approving_review_count = each.value.codeowners.review_count
  }

  required_status_checks {
    strict = true
  }
}
