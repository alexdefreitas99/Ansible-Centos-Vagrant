# Using vagrant to create CentOS vm's and ansible to configure them with RabbitMQ HA.


## This is a POC(Proof of Concept) to study the use of Vagrant and Ansible.

The rabbitmq structure is based in 3 nodes: 2 slaves and 1 master.

The node master has a HA policy that mirror the queues/exchanges behind all nodes.

Only durable queues are mirrored.

### Create CentOS vm's
```
$ vagrant up 
```

### Upgrade all vm's RabbitMQ
```
$ ansible-playbook basic-setup.yml -i roles/rabbitmq/inventories
```

### Install RabbitMQ in all vm's
```
$ ansible-playbook rabbitmq.yml -i roles/rabbitmq/inventories
```


## References

https://www.rabbitmq.com/clustering.html

https://www.rabbitmq.com/ha.html

https://www.rabbitmq.com/parameters.html


https://www.cloudamqp.com/blog/2018-01-09-part3-rabbitmq-best-practice-for-high-availability.html


## License

This project is licensed under the WTFPL License - see the LICENSE.md file for details
