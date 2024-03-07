# Nextcloud setup in Pilvio using Terraform

This code sets up a vm running Nextcloud and a S3 bucket to connect it to, both in Pilvio.

Here, DNS is managed with Route 53 and it's assumed a hosted zone is already set up there (in other words, you have a domain yourdomain.com set up).

## Usage:
1. Rename `terraform.tfvars.template` to `terraform.tfvars`, fill in and change the values according to your information.

2. Run `terraform init` and `terraform apply` in the project directory. This creates a vm, its public ip and an object storage to Pilvio and a subdomain record to Route 53.

3. Wait for the vm to come up and the initial Nexcloud container to start. Visit the outputted address to finish the installation.

4. Check the status of the Nextcloud container from the UI. If it's green, or the logs say "ready to handle connections", you should be able to access Nextcloud from the address you specified during the install.

5. To connect the S3 instance, follow these steps:
    1. click your profile icon in the upper right corner and select "Apps";

    2. enable "External storage support";

    3. from the menu under the profile icon again, select "Administration settings" and then "External storage" under "Administration" from the sidebar;

    4. insert a folder name and under "Add storage", select "Amazon S3";

    5. fill in the rest of the fields:
        - Authentication: Access key
        - Access key and Secret key: find them from Pilvio dashboard under "Storage" when clicking on the created bucket
        - Bucket: nextcloud (the name specified in `bucket.tf`)
        - Hostname: s3.pilw.io
        - tick "Enable SSL" and "Enable Path Style"
        - Available for: configure to your needs.

    6. Click the tick on the right side to save the config. You should see a green tick on the left. If it's red, hover on it to see the error.

6. The external storage should show up under your files as a new folder.

## Using Pilvio S3 as Terraform backend

Create a bucket to Pilvio to be used for holding the state. In ```init.tf```, comment in the "backend" block and adjust values for the bucket and key accordingly.

Export the environment variables

```export AWS_ACCESS_KEY_ID=```

and 

```export AWS_SECRET_ACCESS_KEY=```

containing the credentials of the bucket you created.