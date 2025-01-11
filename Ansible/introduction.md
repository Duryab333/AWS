# Introduction to Ansible

## What is Ansible?

Ansible is an open-source IT automation engine that automates:
- provisioning
- configuration management
- application deployment
 orchestration

and many other IT processes. It is free to use and benefits from the collective experience and contributions of thousands of contributors.

## How Ansible Works

Ansible is agentless, meaning you don't need to install any software on the managed nodes.
For automating Linux and Windows systems, Ansible connects to managed nodes and pushes out small programs—called Ansible modules—to them. These modules are designed to represent the desired state of the system. Ansible executes these modules (over SSH by default) and removes them once the tasks are completed. These modules are typically idempotent, meaning they only make changes when necessary.
For automating network devices and other IT appliances where modules cannot be executed, Ansible runs on the control node. Since Ansible is agentless, it can communicate with these devices without requiring an application or service to be installed on the managed node.

# Passowrdless Authenticaiton 

Both instances on cloud

## Mannage node 

First do PasswordAuthenticaion on by:

`sudo vim /etc/ssh/sshd_config.d/60-cloudimg-settings.conf` 
 
Restart ssh by:

`sudo systemctl restart ssh`

Set the password

`sudo  passwd ubuntu`

## Control Node

First generate the key by 

`ssh-keygen -t rsa -b 4096` 

Assign the previlage to the key 

`chmod 600 /home/ubuntu/.ssh/id_rsa`

Copy key to mannage node 

`sudo ssh-copy-id -i .ssh/id_rsa  ubuntu@<Ip-Address>`

Run this 

`ssh ubuntu@<Ip-Address>`

Congratulations you are now on your node server.
