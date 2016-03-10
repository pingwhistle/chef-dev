# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "chef-dev"
  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #

  config.vm.synced_folder ".", "/vagrant", mount_options: ["dmode=775,fmode=664"]

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
    vb.cpus = 2    
  end

  # install chefdk
  # install docker, git, vim etc
  # configure git
  config.vm.provision "shell", inline: <<-SHELL
    #wget -q -O /tmp/chefdk.deb https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/12.04/x86_64/chefdk_0.11.2-1_amd64.deb
    dpkg -i /tmp/chefdk.deb
    apt-get -y update
    apt-get -y install vim git docker.io
    apt-get -y remove puppet puppet-common # wtf?
    usermod vagrant -G docker

    cp /vagrant/vagrant_files/gitconfig /home/vagrant/.gitconfig

    if [ ! -f /home/vagrant/.ssh/id_rsa ]; then
      sudo -u vagrant ssh-keygen -t rsa -b 4096 -C "pingwhistle@gmail.com" -f /home/vagrant/.ssh/id_rsa -N ''
    fi
  SHELL

  config.vm.provision "shell", path: "vagrant_files/custom_ps1.sh"
end
