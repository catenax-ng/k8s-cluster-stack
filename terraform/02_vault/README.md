# Configure Vault via terraform

Following are some instructions and hints, when configuring Vault with terraform

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

# All the team secret engines are placed in the 'product-team-secret-engines' resource
terraform import vault_mount.product-team-secret-engines product-team-example
terraform import vault_policy.product-team-policies product-team-example
```

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

