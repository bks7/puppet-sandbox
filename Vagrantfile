# -*- mode: ruby -*-
# vim: expandtab ft=ruby
VAGRANTFILE_API_VERSION = "2"

domain = 'vagrant.local'

puppet_nodes = [
  { :hostname => 'puppet',  :ip => '172.16.32.10', :box => 'centos65-x86_64-20140116', :fwdhost => 8140, :fwdguest => 8140, :ram => 512, :syncfoldhost => 'puppet', :syncfoldguest => '/puppet'},
  { :hostname => 'client1', :ip => '172.16.32.11', :box => 'centos65-x86_64-20140116'},
  { :hostname => 'client2', :ip => '172.16.32.12', :box => 'centos65-x86_64-20140116'},
]

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Enable hostmanager vagrant plugin
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.ignore_private_ip = false
  config.hostmanager.include_offline = true

  # Configure nodes
  puppet_nodes.each do |node|
    config.vm.define node[:hostname] do |vm_node_config|
      vm_node_config.vm.box       = node[:box]
      vm_node_config.vm.box_url   = 'https://github.com/2creatives/vagrant-centos/releases/download/v6.5.3/' + node[:box] + '.box'

      # Network settings
      vm_node_config.vm.host_name = node[:hostname] + '.' + domain
      vm_node_config.vm.network :private_network, ip: node[:ip]
      vm_node_config.hostmanager.aliases = node[:hostname]

      # Forwarding ports
      if node[:fwdhost]
        vm_node_config.vm.network :forwarded_port, guest: node[:fwdguest], host: node[:fwdhost]
      end

      # Synced folders
#      if node[:syncfoldhost]
#        vm_node_config.vm.synced_folder node[:syncfoldhost], node[:syncfoldguest]
#      end
#
      # Virtualbox machine settings
      memory = node[:ram] ? node[:ram] : 256;
      vm_node_config.vm.provider "virtualbox" do |v|
        v.customize [
          'modifyvm', :id,
          '--name', node[:hostname],
          '--memory', memory.to_s
        ]
      end

      # Provisioning

      # Install puppet client
      vm_node_config.vm.provision "shell", :path => "provision/shell/centos_6_x.sh"

      # Puppet server client installing
      vm_node_config.vm.provision "puppet" do |puppet|
        puppet.manifests_path = "provision/puppet/manifests"
        puppet.module_path= "provision/puppet/modules"
      end
    end
  end
end
