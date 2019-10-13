if ! grep -Fq "^ansible" /etc/passwd
  then
    echo "Adicionando o usuario ansible"
    useradd -rmU -G wheel -s /bin/bash ansible
    mkdir -m 700 /home/ansible/.ssh
    echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCnzBoIHM1jCMYqnHuo5JnK8BWVrulNZDU4UAxJUdLXRLY2FpfU3uPUrveGS2k8nWsB5vqnbjFZ1eIjHaZWCMyUZaQsquDXtPrFqrmCA7rklPrJE7PWLMihwLB5Zns+nw7J+eRDHhzzGTJTR9KLvxIVQPfxy/pU6nLIoD9hLrFmoSK/m7qVV63yREzbrnMCEKCC8ANzax9aR87zo207ifnTA4ZP7RsPoyB1fbHW/CQ54IkyxjzQO+99QADyEYCi3OjybHOeqU0T9mvVhc3VeeCpsbrqo1ovp1W2/0Bq6qPvz5nNtDiQQXnR9umhMI8PkaXC9gQ82xnWU+r+ddwYgQo5HMbBoTZUas09P2zIOdUvlnMjJ7966ssyU/eNxXCWfDnRZPd82sPiJWCENR0hCs+8CrF8aAbrndsjsjLfZVk3Tjhk8ZQ3P7WkxVPI4v/VKr4mrQ3PRshGbcYJ3/STKWbxVoTZerr0wasEZY68PjMovd2Fpj/OrBLdk4+StvJKmVE= alex@archlinux' >> /home/ansible/.ssh/authorized_keys
    chmod 600 /home/ansible/.ssh/authorized_keys
    chown -R ansible. /home/ansible/.ssh
    echo ansible ALL=NOPASSWD:ALL > /etc/sudoers.d/ansible
fi