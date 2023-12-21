# Instructions

## Required
1. Account in Pilvio: https://pilvio.com
2. Pilio account's API key;
3. Terraform CLI. See instructions for installation [here](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli).

## Initialise the project
### files
- [init.tf](./init.tf): Describes Pilvio provider as required provider and initialises it's parameters;
- [variables.tf](./variables.tf): Describes variables to be used. Variables are object type.
- .terraform.lock.hcl: a lock file that represents terraform project state after initialisation

### commands
To initialise the project, run:
```bash
terraform init
```

## Create resources
### files
- [server.tf](./server.tf) that creates 3 resources:
  - virtual machine (VM) that installs Nginx package with cloud-init;
  - public IP (called floating IP);
  - a resource that assings that IP to VM
- [outputs.rf](./outputs.tf) that creates website address as an output;
- terraform.tfvars **NOTE**: you must create it yourself, see the example contents below.

### terraform.tfstate
```hcl
pilvio = {
    api_key = ""
    billing_account_id = ""
}

vm = {
    username = ""
    password = ""
}
```
Make sure that `terraform.tfstate` is gitignored (see example in .gitignore file).

You must replace empty values with your own correct ones. **NOTE**: the password must contain lower and upper-case charachter and a number.

### commands
To see if everything works as planned, run:
```bash
terraform plan
```

If everything is fine, run:
```bash
terraform apply
```

You must accept the plan by entering "yes". Then resources will be created. Once created, the output will give the address of the webserver. Visit it and you should see Nginx welcome page.

## cleanup
To clean everything up and take resources down, run:
```bash
terraform destroy
```
Accept the plan and then everything will be taken down, making sure that you will not pay for the resources unless you want to.