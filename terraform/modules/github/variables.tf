
variable "github_token" {
  description = "The Github Token"
  type        = string
}

variable "github_owner" {
  description = "The Github Owner"
  type        = string
}

variable "github" {
  description = "Github team definitions for all product teams to use as local variable"
  type = map(object({
    name        = string
    description = string
  }))
  default = {
    "example" : {
      name : "product-team-example"
      description : "Product team example"
    },
  }
}

variable "github_repositories" {
  description = "Github repository definitions for all product teams to use as local variable."
  type = map(object({
    name         = string
    description  = string
    has_issues   = bool
    has_projects = bool
    has_wiki     = bool
  }))

  default = {
    "example" : {
      name : "product-team-example",
      description : "product team example description",
      has_issues : false,
      has_projects : false,
      has_wiki : false,
    }
  }
}