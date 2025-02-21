# Project

This short project on Terraform explains how to create an EC2 instance on AWS. It also explains how variables are used in Terraform.

## Variables
- Input variables
- Output variables

### Input variables
Input variables are defined inside the variables.tf file. We can also give them default values, but here the values are given in the terraform.tfvars file, which is the usual practice. 
-  tfvars file: is used to set specific values for input variables defined in your Terraform configuration. It allows you to separate configuration values from your Terraform code, making it easier to manage different configurations for different environments (e.g., development, staging, production) or to store sensitive information without exposing it in your code.
