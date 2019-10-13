BRIDGE_NET="192.168.0."
DOMAIN="tst"
RAM = 512

servers=[
  {
    :hostname => "rabbitmq1." + DOMAIN,
    :ip => BRIDGE_NET + "2"
  },
  {

    :hostname => "rabbitmq2." + DOMAIN,
    :ip => BRIDGE_NET + "3"
  },
  {
    :hostname => "rabbitmq3." + DOMAIN,
    :ip => BRIDGE_NET + "4"
  }
]

Vagrant.configure(2) do |config|
    config.vm.synced_folder ".", "/vagrant", disabled: true
    servers.each do |machine|
        config.vm.define machine[:hostname] do |node|
            node.vm.box = "centos/7"
            node.vm.hostname = machine[:hostname]
            node.vm.network "public_network", ip: machine[:ip], bridge: "wlp3s0"
            node.vm.provision "shell", path:"ansible.sh"
            node.vm.provider "virtualbox" do |vb|
                vb.memory = RAM
                vb.name = machine[:hostname]
            end
        end
    end
end
