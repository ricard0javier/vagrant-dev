# -*- mode: ruby -*-

VAGRANTFILE_API_VERSION = "2"
Vagrant.require_version ">= 1.7.2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define "dev" do |dev|

    dev.vm.box = "ubuntu/trusty64"

    # dev.vm.network "private_network", ip: "192.168.33.20"

    dev.vm.network "forwarded_port", guest: 80, host: 80
    dev.vm.network "forwarded_port", guest: 8080, host: 8080

    dev.vm.synced_folder "./data", "/data"

    dev.vm.provider "virtualbox" do |vb|

      vb.name = "dev"
      vb.memory = 4096
      vb.cpus = 2

    end

    dev.vm.provision "shell", path: "bootstrap.sh"

  end

end
