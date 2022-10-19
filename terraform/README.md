# Terraform

Terraform uses ['state'](https://www.terraform.io/language/state) to track status and differences of your real world
resources and your configuration. We define it for every part in the `providers.tf`
(e.g. `terraform/02_devsecops-testing_cluster/providers.tf`)

## Initialize Terraform

Terraform is run by CLI on your local machine. We are not using any Pipelines for that. Therefore you need to install the
terraform CLI for your operating system either by package manager for your OS, or by downloadable installer
from [https://www.terraform.io/downloads](https://www.terraform.io/downloads).
You can verify your installation by running the command `terraform --version` from your terminal.

Make sure you've cloned the [k8s_cluster_stack](https://github.com/catenax-ng/k8s-cluster-stack)
repository and **navigate to the repository where you want to run terraform**
e.g. `cd terraform/02_devsecops-testing_cluster`, `cd terraform/100_team_onboarding`.

You have to [initialize](https://www.terraform.io/cli/commands/init)
terraform in the current working directory by running `terraform init`.
This will initialize the necessary modules and download plugins for the used providers.

### Creating and applying the terraform plan

A terraform [plan](https://www.terraform.io/cli/commands/plan) is an execution plan that will give you a preview about
the changes to your infrastructure. As input for the plan, you'll need to specify a set of variable values depending
on the scope. If variables are not preset, terraform will ask for them in the CLI.

Let terraform check the plan:

```shell
terraform plan
```

After the `terraform plan` step, you'll see a listing of all the resources that will be created, changed or destroyed.
Review that list carefully, to see if the proposed changes match your expectation before you apply:

```shell
terraform apply
```
