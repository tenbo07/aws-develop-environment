# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"


def setup_chef_solo(config, &block)
  config.vm.provision :chef_solo do |chef|
    chef.log_level = :info
    chef.cookbooks_path = ['./cookbooks', './site-cookbooks']
    yield(chef) if block_given?
  end
end

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	if Vagrant.has_plugin?("vagrant-proxyconf")
		config.proxy.http  = ENV['http_proxy']  if ENV['http_proxy']
		config.proxy.https = ENV['https_proxy'] if ENV['https_proxy']
	end

	config.vm.box = "chef/centos-6.5"
	config.vm.network :private_network, ip: '10.33.34.100'
	config.vm.hostname = 'aws-devlop-environment'
	
	config.omnibus.chef_version = :latest
		setup_chef_solo(config) do |chef|
		chef.add_recipe 'recipe[python]'
		chef.add_recipe 'recipe[yum-epel]'
		chef.add_recipe 'recipe[aws::default]'
		chef.json = {
		}
	end

end
