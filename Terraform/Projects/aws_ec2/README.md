# EC2 instance creation using Terraform:

This will create all the configuraiton required to make an ec2 instance on AWS

-  key-pair
-  VPC
-  security gorups
-  ec2-instance

## 1) AWS configure

## 2) Key-Pair file generaiton

```
ssh-keygen -f terra-key-ec2
```
## Vaiables

In `Variable.tf` change the ami-id and other variables according to your requirment.

## Finally

Run the basic command to run the terraform file.

```
terraform init
terraform validate
terraform plan
terraform apply -auto-approve
```
