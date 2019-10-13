# Ansible-Centos-Vagrant

# Create rabbitmq vm's
$ vagrant up 

# Upgrade all vm's rabbitmq
$ ansible-playbook basic-setup.yml -i roles/rabbitmq/inventories

# Install rabbitmq in all vm's
$ ansible-playbook rabbitmq.yml -i roles/rabbitmq/inventories