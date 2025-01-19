# Tasks:

## Task 1
Create three(3) EC2 instances on AWS using Ansible loops
- 2 Instances with Ubuntu Distribution
- 1 Instance with Centos Distribution
Hint: Use connection: local on Ansible Control node.

## Task 2
Set up passwordless authentication between Ansible control node and newly created instances.

## Task 3
Automate the shutdown of Ubuntu Instances only using Ansible Conditionals

Hint: Use when condition on ansible gather_facts

Solutions:
## Task 1
- create IAM user with polocy ec2 full access.
 - Security credentials > create access key for that user 
