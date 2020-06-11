# Case Study
Provision AWS VPC using Terraform



## Questions qui se posent
- Bloque storage ?  EBS ...? EFS ... ? avoir avec l'utilité de CloudFront
- Certificat ARN ->
- route53  une domaine valide 
- CloudFront ?

## Ansible (RAF)
- Configurer/installer WP & Apache/Nginx --> configuration reverse proxy vers WP
- Utilitaire : PlugIn Terraform pour recuperer invotory depuis state
## Route 53 (RAF)
- procedure pour porter le domaine vers AWS

## RAF
- Provisionning des VM WP
- RDS avec Memcached
- SSL certificate in AWS Certificate Manager
- ALB : SG, TG
- CloudFront
- Route53

## Actions
- Hosted Zone for the domain name to point a terraform subdomain at the load balancer that distributes traffic to our web application
-- Hosted Zone ID:Z02175581AEUKFPLOTBDL


## Set Up a key pair to control access to front ec2 instance

From a terminal :
```shell
$ ssh-keygen -t rsa -b 4096 -C "email@example.com"
```
You will be prompted to enter a file in which to save the key. Enter a new filename, e.g. idrsaterraform_lab.

Generating public/private rsa key pair.
Enter file in which to save the key (/home/you/.ssh/id_rsa):
Optionally, enter a secure passphrase for the SSH key.

## Grant User permissions required for Terraform actions
TODO: PowerUserAccess is not ideal.

Navigate to the IAM console at https://console.aws.amazon.com/iam/.
Navigate to 'Groups' and then click the 'Create New Group' button.
Enter a group name, e.g. TerraformUsers and then click the 'Next Step' button.
In the list of policies, select the AWS Managed policy 'PowerUserAccess'. Click the 'Next Step' button.
Click the 'Create Group' button.
Open the group. From the 'Users' tab add the Terraform IAM user that we created earlier.

## Create Terraform variables

variable "access_key" {}
variable "secret_key" {}
variable "region" {}
variable "public_key_path" {}   # e.g /home/toto/.ssh/id_rsa_terraform_usecase.pub
variable "certificate_arn" {}   # e.g arn:aws:acm:eu-west-1:123456789012:certificate/12345678-1234-1234-1234-123456789012
variable "route53_hosted_zone_name" {}  # e.g melbeied.net
