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

