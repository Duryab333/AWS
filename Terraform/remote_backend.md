# s3 buckt creation
main.tf file 

```
provider "aws" {
    region = "us-east-1"
  
}

resource "aws_instance" "duryabinstance" {
    instance_type = "t2.micro"
    ami = "ami-04b4f1a9cf54c11d0"
    }

resource "aws_s3_bucket" "terraform-bucket" {
    bucket = "duryab-s3-demo"
  
}

resource "aws_dynamodb_table" "terraform_lock" {
    name = "terraform-lock"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"
    attribute {
      name = "LockID"
      type = "S"
      
    }
  
}

```

run 
```

terraform init
terraform plan
terraform apply

```
means first create the s3 bucket and dynamodb then write the backend file then again exeute with terraform init and all
then write the backend file 

```
terraform {
  backend "s3" {
    bucket = "duryab-s3-demo"
    key = "duryab/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
   
  }
}
```
