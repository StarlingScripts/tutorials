# Instructions

## Required
1. Account in Pilvio: https://pilvio.com
2. Pilio account's API key;
3. Terraform CLI. See instructions for installation [here](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli).

## Initialise the project
Files:
- [init.tf](./init.tf): Describes Pilvio provider as required provider and initialises it's parameters;
- [variables.tf](./variables.tf): Describes variables to be used. Variables are object type.
- .terraform.lock.hcl: a lock file that represents terraform project state after initialisation

To initialise the project, run:
```bash
terraform init
```