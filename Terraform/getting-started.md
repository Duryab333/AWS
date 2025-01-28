# Start with Terraform

1- Install AWS CLI (Command Line Interface)

2- Create an AWS IAM User

3- Configure AWS CLI Credentials:

```
aws configure
```

## Setup Terraform for AWS
configure with aws using command ` aws configure `
create terraform file : main.tf
- This is to create an ec2-instance on aws
- change ami

`main.tf`
```
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform_Demo"
  }
}

```
Then to run script use
```
terraform init
terraform plan
terraform apply
```


`terraform init` : to initalize the terraform
`terraform plan` : to dry run terraform , for debug purpose
`terraform apply` : to run the terraform script


this will create ec2-instance in your aws region.

- To destroy what you have created resources using terraform 

```
terraform destroy
```
