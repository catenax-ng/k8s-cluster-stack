## Run terraform providing variables values
  - login_approle_role_id
  - login_approle_secret_id

### e.g:
```
terraform init
terraform plan -var='login_approle_role_id=${APPROLE_ID}' -var='login_approle_secret_id=${APPROLE_SECRET_ID}' -out .terraform/vault.tfplan
terraform apply ".terraform/vault.tfplan"
```