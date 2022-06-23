variable "github_token" {}

variable "github_repositories" {
  description = "Description of the repositories that should exist in the organization. 'team_name' has to match one of the entries in 'github_teams' variable"
  type        = map(object({
    name         = string
    description  = string
    team_name    = string
    visibility   = string
    homepage_url = string
    topics       = set(string)
  }))
}

variable "github_teams" {
  description = "Github team definition with its repositories for all product teams to use as local variable"
  type        = map(object({
    name        = string
    description = string
  }))
}
