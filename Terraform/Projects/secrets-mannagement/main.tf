provider "aws" {
    region = "us-east-1"
  
}
provider "vault" {
    address = "http://23.20.152.241:8200"
    skip_child_token = true

    auth_login {
      path = "auth/approle/login"
      parameters = {
        role_id = "82dc2c7c-b8f7-ac85-b1ad-8e0e5d27b7bb"
        secret_id = "82ccdfc1-a65e-c2cb-45be-f84eb26354b7"
      }
    }
}
data "vault_kv_secret_v2" "example" {
  mount = "kv"
  name  = "test-secrets"
  }

resource "aws_instance" "vault-instance" {
    ami = "ami-04b4f1a9cf54c11d0"
    instance_type = "t2.micro"

    tags = {
      secret = data.vault_kv_secret_v2.example.data["username"]

    }
}
resource "aws_s3_bucket" "name" {
    bucket = data.vault_kv_secret_v2.example.data["s3-name"]
  
}
