Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.define :docker do |docker_config|
    docker_config.vm.hostname = "docker.example.com"
    docker_config.vm.network "private_network", ip: "192.168.50.10"
	
    docker_config.vm.provision "puppet" do |puppet|
        puppet.manifest_file = "docker.pp"
    end
  end

  config.vm.provider "virtualbox" do |vbox|
    vbox.memory = 1024
    vbox.cpus = 1
  end
  
end
