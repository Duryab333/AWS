# EC2 Instance
Elastic Compute Cloud (EC2), A web service offers the ablitiy to run application on public cloud. It provides secure, resizable compute capacity in the cloud

## Creating EC2 instance

- By web UI
- By CLI

### Create EC2 instance by CLI:
 
First create IAM role and attach policy to it(Attach EC2 instance with IAM role), then configure in CLI:
```
aws configure
```
Run this command in CLI:
```
aws ec2 run-instances --image-id ami-0a628e1e89aaedf80 --instance-type t2.micro --key-name "window-demo" --region eu-central-1
```

- Print ec2 isntances
```
aws ec2 describe-instances
```
- Print ec2 instnces IDs
```
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId'
```


