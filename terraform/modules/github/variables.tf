variable "github_org" {
  description = "Name of the GitHub organization, that should be managed"
  type        = string
}

variable "github_repositories" {
  description = "Description of the repositories that should exist in the organization. 'team_name' has to match one of the entries in 'github_teams' variable"
  type        = map(object({
    name         = string
    description  = string
    has_issues   = bool
    has_projects = bool
    has_wiki     = bool
    team_name    = string
  }))
}

variable "github_teams" {
  description = "Github team definition with its repositories for all product teams to use as local variable"
  type        = map(object({
    name        = string
    description = string
  }))
}
