Vagrant.configure("2") do |config|

  # Set base box
  config.vm.box = "precise32"

  # Forward guest port 80 to host port 8888
  config.vm.network :forwarded_port, guest: 80, host: 8888

  # Sync folder for www document root
  config.vm.synced_folder "./www/", "/vagrant/webroot/", :owner => "www-data"

  # setup puppet for provisioning
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "manifests"
    puppet.manifest_file = "default.pp"
    puppet.module_path = "modules"
  end

end
