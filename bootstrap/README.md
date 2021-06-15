# Getting started

- Run `terraform init`

## Updating terraform accounts

- Update `terraform_accounts` in `main.tf` variable with YOUR_USERNAME' ('E.g. ptsa ') refer variables.tf `sa_username`
- Apply terraform `terraform apply`
- Save your own creds to json file (you need [jq](https://stedolan.github.io/jq/) or similar)

### Save credentials file

```
terraform output -json service_account_creds |jq -r .YOUR_USERNAME | base64 -d > ../cloud/creds.json
```
