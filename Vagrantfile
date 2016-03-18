# -*- mode: ruby -*-
# vi: set ft=ruby :

system("
    if [ #{ARGV[0]} = 'up' ]; then
        echo 'You are doing vagrant up and can execute your script'
        ansible-galaxy install -r requirements.yml --force
    fi
")

Vagrant.configure(2) do |config|

	config.vm.define "server" do |server|
		server.vm.box = "hashicorp/precise64"
		server.vm.hostname = "server"
		server.vm.provider "vmware_fusion" do |v|
			v.vmx["memsize"] = "1024"
		end
		server.vm.network "private_network", ip: "192.168.50.9"

		server.vm.provision :ansible do |ansible|
			ansible.playbook = "test.yml"
		end
	end

end
