BRIDGE_NET="192.168.0."
DOMAIN="tst"
RAM = 512

servers=[
  {
    :hostname => "rabbitmq1." + DOMAIN,
    :ip => BRIDGE_NET + "2",
    :ip_int => "1",
  },
  {

    :hostname => "rabbitmq2." + DOMAIN,
    :ip => BRIDGE_NET + "3",
    :ip_int => "2"
  },
  {
    :hostname => "rabbitmq3." + DOMAIN,
    :ip => BRIDGE_NET + "4",
    :ip_int => "3"
  }
]


Vagrant.configure(2) do |config|
    config.vm.synced_folder ".", "/vagrant", disabled: true
    servers.each do |machine|
        config.vm.define machine[:hostname] do |node|
            node.vm.box = "centos/7"
            node.vm.hostname = machine[:hostname]
            node.vm.network "public_network", ip: machine[:ip], bridge: "wlp3s0"

            node.vm.provision "shell", inline: <<-SHELL
              sudo su 
              sed -i 's/^#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
              timedatectl set-timezone America/Sao_Paulo
            SHELL
            node.vm.provider "virtualbox" do |vb|
                vb.customize ["modifyvm", :id, "--memory", RAM]
                vb.name = machine[:hostname]
            end
        end
    end
end
