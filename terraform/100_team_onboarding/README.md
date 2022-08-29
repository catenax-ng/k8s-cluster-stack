# Configure Vault via terraform

Following are some instructions and hints, when configuring Vault with terraform

## How to run this terraforming

To create a terraform plan and apply it to the vault instance you first have to initialize terraform.
Since the stage is stored in an Azure storage account, you need to define credentials for read/write access to this 
storage account. You need to set these credentials via a specific environment variable like this:

`export ARM_ACCESS_KEY=$(az storage account keys list --resource-group cx-devsecops-tfstates --account-name cxdevsecopstfstate --query '[0].value' -o tsv)`

For more details about the state, see one of the upcoming sections. 
After you defined the storage account credentials, you can initialize terraform via `terraform init`.

Besides the Azure storage account credentials, you also need to set the vault root token as a environment variable, that
terraform can use to authenticate. We use the root token, since there may be remounts of vault resources, that need
elevated permissions. Additionally, you need to specify the client_id and client_secret for OIDC configuration. 

For the `github` module, you need to specify the organization to manage, and
the personal access token to use for changes to repos and the org.
You need to set the variables as follows:

```shell
# Vault module variables
export VAULT_TOKEN=<vault-root-token>
# you can find the OIDC settings in vault: secret engine devsecops/clusters/vault/github-oauth
export TF_VAR_vault_oidc_client_id=<client-id>
export TF_VAR_vault_oidc_client_secret=<client-secret>

# GitHub module settings
# The token needs privileges to manage the org and repositories
export TF_VAR_github_token=<your-github-pat>
export TF_VAR_github_org=catenax-ng
```

You can get the root token value from the cx-vault-unseal Azure key vault in the Azure portal. 

To let terraform check, if there are config changes, you first have to create a plan, that you can afterwards
apply like this:

```shell
terraform plan -out tf.plan
terraform apply "tf.plan"
```

After the `terraform plan` step, you'll see a listing of all the resources that will be created, changed or destroyed.
Check that list carefully, to see if the proposed changes match your expectation.

## Importing existing Vault config

Configuring an already existing vault resource, like secret-engines for example, is not possible.
You'll receive an 'Object already exists at path' or similar error.
To avoid this issue, you have to manually import all the existing objects to your terraform state before.

### Importing secret-engines

Secret engines can be imported like this: `terraform import vault_mount.<my-mount> <path-of-secret-engine>`.

Here are some examples for secret engines and policies to import
```shell
# The DevSecOps secret engine is created as separate resource definition in the terraform files
terraform import vault_mount.devsecops-secret-engine devsecops

# Importing resources with for_each loop in it is slightly different. Here you have to use an additional index
# on the terraform resource at import. This then has to be quoted. 
# Current approach: use the map key of product_teams variable as index and secret_engine_name as path
# Examples: 

# Secret engines
terraform import 'vault_mount.product-team-secret-engines["example"]' product-team-example
terraform import 'vault_mount.product-team-secret-engines["bpdm"]' bpdm

# AVP secrets
terraform import 'vault_generic_secret.product-team-avp-secrets["managed-identity-wallets"]' devsecops/avp-config/managed-identity-wallets

# policies
terraform import 'vault_policy.product-team-policies["test-data-generator"]' test-data-generator
terraform import 'vault_policy.product-approle-read-only-policies["test-data-generator"]' test-data-generator-ro

# approles
terraform import 'vault_approle_auth_backend_role.product-team-approles["explorer"]' auth/approle/role/product-explorer

# github team mappings
terraform import 'vault_github_team.github-product-teams["bpdm"]' auth/github/map/teams/product-bpdm
```

## Importing existing GitHub configuration

If there were manual changes to the GitHub organization like manually added teams or repositories, you can import these
like follows:

```shell
# Import a GitHub team
terraform import 'module.github.github_team.cx-github-teams["map-key-in-github_teams-var"]' <team-id>

# Import a GitHub repository
terraform import 'module.github.github_repository.repositories["map-key-in-github_repositories-var"]' <repository-name>

# Import collaboration relation between team and repository
terraform import 'module.github.github_team_repository.team-repository-access["map-key-in-github_repositories_teams_var"]' <team-id>:<repository-name>
```

The GitHub team-id is not easy to find. You can use the following API request via curl to get a list of teams in our 
catenax-ng organization. The result list will contain information (including the ID) for all the teams:
`curl -H "Authorization: token your-githbu-pat" https://api.github.com/orgs/catenax-ng/teams`

## Handling the tfstate

There is a terraform backend configured to store the state file. The state will be uploaded to an Azure storage account.
The details are configured in the backend section of the provider config in [./provider.tf](provider.tf).
In order to upload the state file to Azure, you need to specify the storage account access key.

You can query the value for storage access key and store it in an environment variable, that terraform will use
with the following command: 
`export ARM_ACCESS_KEY=$(az storage account keys list --resource-group cx-devsecops-tfstates --account-name cxdevsecopstfstate --query '[0].value' -o tsv)`

If you did not yet initialize terraform, you'll also need the storage access key.


## 'Design' decisions

Following are some minor decisions taken, while creating the vault terraform config.

### Product team list in variable definition over local variables

The list of product teams is defined inside the [./variables.tf](variables.tf) file. This approach was chosen over
local variable definition inside [./main.tf](main.tf), because it provides us with better auto-completion.
There is no way to define variable typing for local variables.

### Product teams as list of objects instead of list of string

The configuration was created during a time, when there were a lot of inconsistencies in the naming of GitHub teams,
vault secret engines and vault policies. Specifying product teams as objects instead of strings, enabled more flexibility
to handle the inconsistent definitions.

