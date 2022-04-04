# Hashicorp vault

## Deployment

### In case you don't have a service principal yet, create it with this command:
`az ad sp create-for-rbac --name "vault-sp" --role owner --scopes /subscriptions/899135fc-19c6-47cb-82f1-0230af7b99b5/resourceGroups/cx-vault-rg --sdk-auth`

### Copy the output of the previous command to either a secret for github actions workflow or declare a variable for manual run:
```
  AZURE_CREDENTIALS=$(cat <<-END
  {
    "clientId": "",
    "clientSecret": "",
    "subscriptionId": "",
    "tenantId": "",
    "activeDirectoryEndpointUrl": "",
    "resourceManagerEndpointUrl": "",
    "activeDirectoryGraphResourceId": "",
    "sqlManagementEndpointUrl": "",
    "galleryEndpointUrl": "",
    "managementEndpointUrl": ""
  }
  END
  )
```
### Create these variables as well (needed for the automatic unseal with Azure keyvault):
```
AZURE_TENANT_ID=""
AZURE_AD_CLIENT_ID=""
AZURE_AD_CLIENT_SECRET=""
AZUREVAULTNAME=""
AZUREVAULTKEYNAME=""
AZURE_SUBSCRIPTION_ID=""
```

### Get the kubeconfig from both central argocd and vault clusters:
`az aks get-credentials --resource-group cx-vault-rg --name cx-vault-aks-services --admin --file $HOME/.kube/cx-vault-admin`
`az aks get-credentials --resource-group cx-core-rg --name cx-core-aks --admin --file $HOME/.kube/cx-core-admin`

### Deploy the argocd app to the central argocd cluster:
```
helm --kubeconfig=$HOME/.kube/cx-core-admin upgrade vault . \
--namespace argocd \
--install \
--wait \
--atomic \
--set vault.seal.tenantid=${AZURE_TENANT_ID} \
--set vault.seal.clientid=${AZURE_AD_CLIENT_ID} \
--set vault.seal.clientsecret=${AZURE_AD_CLIENT_SECRET} \
--set vault.seal.azurevaultname=${AZUREVAULTNAME} \
--set vault.seal.azurevaultkeyname=${AZUREVAULTKEYNAME} \
--set vault.seal.subscriptionid=${AZURE_SUBSCRIPTION_ID}
```

### Initialize and unseal vault for the first time:
(azure keyvault cannot initialize vault, therefore manual action)
```
kubectl --kubeconfig=$HOME/.kube/cx-vault-admin -n vault exec -it pod/vault-0 -- /bin/sh

vault operator init

vault operator unseal
vault status
exit

kubectl --kubeconfig=$HOME/.kube/cx-vault-admin -n vault exec -it pod/vault-1 -- /bin/sh

vault operator raft join "http://vault-0.vault-internal:8200"
exit

kubectl --kubeconfig=$HOME/.kube/cx-vault-admin -n vault exec -it pod/vault-2 -- /bin/sh

vault operator raft join "http://vault-0.vault-internal:8200"
exit
```
### Alternatively, you can run the actions workflow for vault deployment
(still need to initialize manually)

## Configure GitHub authentication

### Login to Azure and download kubeconfig
```
az login --tenant 495463c3-0991-4659-9cc5-94b4a3f7b1d6 --use-device-code
az account set --subscription 899135fc-19c6-47cb-82f1-0230af7b99b5
az aks get-credentials --resource-group cx-vault-rg --name cx-vault-aks-services --admin --file .kube/cx-vault-admin
```
### Get prompt to vault sevice
```
kubectl --kubeconfig=.kube/cx-vault-admin -n vault exec -it service/vault 8200:8200 -- /bin/sh
```
### Login to vault via cli
```
vault login
```
enter token when prompted

### List current authentication providers
```
vault auth list
```
### Enable github authentication provider
```
vault auth enable github
```
### Configure github organization for authentication provider
```
vault write auth/github/config organization=catenax-ng
```
#### Create a vault policy with the desired access rights for the team
#### https://www.vaultproject.io/docs/concepts/policies
#### vault-admins policy:
#### WARNING! this policy grants basically root access
####path "*" {
####  capabilities = ["create","read","update","delete","list"]
####}

### Map the vault policy to the github team
```
vault write auth/github/map/teams/argocdadmins value=vault_admins
```

# Configure APPROLE authentication
Access API using kubectl port-forward to localhost in this example
## List approles:
```
curl \
    --header "X-Vault-Token: " \
    --request LIST \
    http://localhost:8200/v1/auth/approle/role \
	| jq '.'
```
## Create approle:

### create.json:
```
{
  "token_ttl": "10m",
  "token_max_ttl": "15m",
  "token_policies": ["default"],
  "period": 0,
  "bind_secret_id": true
}
```
```
curl \
    --header "X-Vault-Token: " \
    --request POST \
    --data @create.json \
    http://127.0.0.1:8200/v1/auth/approle/role/devsecops \
	| jq '.'
```
## Show approle:
```
curl \
    --header "X-Vault-Token: " \
    http://127.0.0.1:8200/v1/auth/approle/role/devsecops \
	| jq '.'
```
## Show approle role id:
```
curl \
    --header "X-Vault-Token: " \
    http://127.0.0.1:8200/v1/auth/approle/role/devsecops/role-id \
	| jq '.data.role_id'
```
## Add secretid:
```
curl \
    --header "X-Vault-Token: " \
    --request POST \
    http://127.0.0.1:8200/v1/auth/approle/role/devsecops/secret-id \
	| jq '.'
```
## Show approle secret id:

### secretid1.json:
```
{
  "secret_id": "9ada82bf-7b8b-8d95-2cf3-2878e78c730d"
}
```
```
curl \
    --header "X-Vault-Token: " \
    --request POST \
    --data @secretid1.json \
    http://127.0.0.1:8200/v1/auth/approle/role/application1/secret-id/lookup
```
## List secret id accessors
```
curl \
    --header "X-Vault-Token: " \
    --request LIST \
    http://127.0.0.1:8200/v1/auth/approle/role/devsecops/secret-id \
	| jq '.'
```
## Login with approle

### login.json:
```
{
  "role_id": "",
  "secret_id": ""
}
```
```
curl \
    --request POST \
    --data @login.json \
    http://127.0.0.1:8200/v1/auth/approle/login \
	| jq '.'
```
