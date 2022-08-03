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
    pages        = object({
      enabled = bool
      branch = string
    })
    is_template   = bool
    uses_template = bool
    template      = object({
      owner      = string
      repository = string
    })
    codeowners_available = bool
    codeowners = object({
      pattern = string
      review_count = number
    })
  }))
}

variable "github_teams" {
  description = "Github team definition with its repositories for all product teams to use as local variable"
  type        = map(object({
    name        = string
    description = string
  }))
}

variable "github_repositories_teams" {
  description = "Github repository access definition with its teams to use as local variable"
  type        = map(object({
    team_name  = string
    repository = string
    permission = string
  }))
}
