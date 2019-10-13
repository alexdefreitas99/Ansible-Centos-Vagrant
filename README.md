# Ansible-Centos-Vagrant

# Create rabbitmq vm's
$ vagrant up 

# Upgrade all vm's rabbitmq
$ ansible-playbook rabbitmq.yml -i roles/rabbitmq/inventories/hosts

# Install rabbitmq in all vm's
$ ansible-playbook rabbitmq.yml