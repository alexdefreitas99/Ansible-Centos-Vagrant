if ! grep -Fq "^ansible" /etc/passwd
  then
    echo "Adding ansible user"
    useradd -rmU -G wheel -s /bin/bash ansible
    mkdir -m 700 /home/ansible/.ssh
    echo 'Your local public rsa key' >> /home/ansible/.ssh/authorized_keys
    chmod 600 /home/ansible/.ssh/authorized_keys
    chown -R ansible. /home/ansible/.ssh
    echo ansible ALL=NOPASSWD:ALL > /etc/sudoers.d/ansible
fi
echo "Initializing full system update"
timedatectl set-timezone America/Sao_Paulo
apt upgrade -y && apt update -y