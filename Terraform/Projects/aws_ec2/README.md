# EC2 instance creation with automated Nginx installation:

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
# Multiple instances

In aws_instance block use attribute `count` suppose count=2 to make multiple instances.
For the output variable make chanes in line :

```
values = aws_instance.instance_name[*].value

```
## Use of for_each

```
for-each = tomap{
key1 = "value1"
key2 = "value2"
}
```
to use them just use `each.key` where you have to put key and `each.value` where you have to use value.
