BRIDGE_NET="192.168.0."
DOMAIN="tst"
RAM = 512
ANSIBLESH ="https://gist.githubusercontent.com/alexdefreitas99/2789e981fd8173cb353a563bc3f6ece1/raw/dbbbb67a2e0468f2d990289d9ffd74d393d123a9/ansible.sh";

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
            node.vm.provision "shell", path:"ansible.sh"
            node.vm.provider "virtualbox" do |vb|
                vb.memory = RAM
                vb.name = machine[:hostname]
            end
        end
    end
end
