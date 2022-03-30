az ad sp create-for-rbac --name "vault-sp" --role owner --scopes /subscriptions/899135fc-19c6-47cb-82f1-0230af7b99b5/resourceGroups/cx-vault-rg --sdk-auth

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
AZURE_TENANT_ID=""
AZURE_AD_CLIENT_ID=""
AZURE_AD_CLIENT_SECRET=""
AZUREVAULTNAME=""
AZUREVAULTKEYNAME=""
AZURE_SUBSCRIPTION_ID=""

az aks get-credentials --resource-group cx-vault-rg --name cx-vault-aks-services --admin --file $HOME/.kube/cx-vault-admin
az aks get-credentials --resource-group cx-core-rg --name cx-core-aks --admin --file $HOME/.kube/cx-core-admin

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
