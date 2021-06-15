# Getting started

- Update project ID & Project number in all variables.tf files
  - `./bootstrap/variables.tf`
  - `./cloud/variables.tf`
- Go to bootstrap in `./bootstrap/`
- Apply terrform to create Service Account credentials. Refer the readme there.
- Go to `./cloud/` & refer readme there.

## PC requirement (Windows 10)

- Make sure you have [Google Cloud SDK](https://cloud.google.com/sdk/docs/quickstart) installed
- Make sure you have [terraform cli](https://learn.hashicorp.com/tutorials/terraform/install-cli) installed
- Make sure you have chocolatey - [THE PACKAGE MANAGER FOR WINDOWS](https://chocolatey.org/) installed.
- Download Jq `choco install jq`.
- Download base64 `choco install base64`.
