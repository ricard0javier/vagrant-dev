# -*- mode: ruby -*-

VAGRANTFILE_API_VERSION = "2"
Vagrant.require_version ">= 1.7.2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define "dev" do |dev|

    dev.vm.box = "ubuntu/trusty64"

    # dev.vm.network "private_network", ip: "192.168.33.20"

    # dev.vm.network "forwarded_port", guest: 9000, host: 9000
    dev.vm.network "forwarded_port", guest: 27017, host: 27017
    dev.vm.network "forwarded_port", guest: 80, host: 9080
    dev.vm.network "forwarded_port", guest: 443, host: 9443

    dev.vm.synced_folder "./data", "/data"

    dev.vm.provider "virtualbox" do |vb|

      vb.name = "dev"
      vb.memory = 1024
      vb.cpus = 1

    end

    dev.vm.provision "shell", path: "bootstrap.sh"

  end

end
