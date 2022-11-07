# Maintaining the GitHub terraform module

This guide will help you to maintain the GitHub terraform module.

## Important links

These links might help you to identify, if there are new versions of the GitHub terraform provider available and what
changes the new version includes:

- [Terraform provider documentation](https://registry.terraform.io/providers/integrations/github/latest/docs)
- [GitHub repository](https://github.com/integrations/terraform-provider-github)

## How to upgrade

To check, if there is a newer version of the GitHub terraform provider available, you need to compare the version used
in [provider.tf](provider.tf) with the latest version listed in
the [provider docs](https://registry.terraform.io/providers/integrations/github/).

If a newer version of the provider is available, and you want to upgrade, check
the [release notes](https://github.com/integrations/terraform-provider-github/releases) for any hints on deprecations or
breaking changes.

To evaluate, if the upgrade will not cause any issues, it could be necessary, to check all the modules using this
`github` module.

The upgrade itself is quite simple. Just set the `version` property in [provider.tf](provider.tf) to your desired
version.

## Verifying upgrade

To verify, if the upgrade did not break anything, you should create a `terraform plan` in each of the modules using this
`github` module (i.e. [100_team_onboarding](terraform/100_team_onboarding)). If you did create a plan before, terraform
might complain about a mismatching dependency lock file. This just indicates, that terraform has a local copy of the old
provider version. To fix that, run `terraform init -upgrade` before creating the plan.

Should the plan creation finish without significant changes to existing resources or any other error message, the
upgrade was done successfully. In case of any errors, please follow instructions from the
provider [release notes](https://github.com/integrations/terraform-provider-github/releases) to fix the resource
configuration. 
