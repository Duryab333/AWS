# Error Handling 

When you wirte a set of tasks/plays in playbook and if one of the play get not executed on mannage node it will stop executing the raste of tasks on that node.
If the next tasks are not dependent on previous tasks then you can ignore errors by using ` ignore_errors: yes ` in ansible-playbook.

Tasks are
- Install the latest versions of openssh and openssl
- Then check if the docker is not install then install the docker on mannage nodes

```
---
- hosts: all
  become: true

  tasks:
    - name: Install security updates
      ansible.builtin.apt:
        name: "{{ item }}"
        state: latest
      loop:
        - openssl
        - openssh
      ignore_errors: yes 
    - name: Check if docker is installed
      ansible.builtin.command: docker --version
      register: output
      ignore_errors: yes    
    - ansible.builtin.debug:
        var: output
    - name: Install docker
      ansible.builtin.apt:
        name: docker.io
        state: present
      when: output.failed
        
```
