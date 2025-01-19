# Ansible-Playbook

A Playbook is a YAML file that defines a series of actions to be executed on managed nodes. It contains one or more "plays" that map groups of hosts to roles.

### Example 

This ansible playbook contain two tasks. one is installation of apache server and second is copy a html file from control node to mannage node.

```
---
- hosts: all
  become: true
  tasks:
    - name: instal apache httpd
      ansible.builtin.apt:
        name: apache2
        state: present
        update_cache: yes
    - name: Copy file with owner and permissions
      ansible.builtin.copy:
        src: index.html
        dest: /var/www/html
        owner: root
        group: root
        mode: '0644'

```

To run a playbook 

```
ansible-playbook -i inventory.ini install_apache_server.yml
```

## Ansible Colections

### AWS Collecions

Pre-requisit install AWS collections on Ansible-mannage mode

```
ansible-galaxy collection install amazon.aws
```


#### AWS EC2 Deployment

conside control node as aws-ec2 isntance
- Create aws ec2 instance
- Attach AMI role: full Ec2 acress
-  Install
-  ```
   sudo apt install ansible
   sudo apt install python-pip
   sudo amazon-linux-extras install ansible
   pip instal boto3
   ```

- Creat a yml file
```
--- 
- hosts: localhost
  connection: local
  tasks:
  - name: start an instance with a public IP address
    amazon.aws.ec2_instance:
      name: "ansible-instance"
      # key_name: "prod-ssh-key"
      # vpc_subnet_id: subnet-013744e41e8088axx
      instance_type: t2.micro
      security_group: default
      region: us-east-1
      aws_access_key: "{{ec2_access_key}}"  # From vault as defined
      aws_secret_key: "{{ec2_secret_key}}"  # From vault as defined      
      network:
        assign_public_ip: true
      image_id: ami-04b70fa74e45c3917
      tags:
        Environment: Testing
```
- Check the syntax of file by
```
  ansible-playbook --syntax-chexk file_name.yml
  
```
- Check locally the playbook

```
  ansible-playbook -C file_name.yml
```
- To Run the playbook
```
  ansible-playbook file_name.yml
  
```
  
