Vagrant::configure("2") do |config|

    # Use a standard box
    config.vm.box = 'precise64'
    config.vm.box_url = 'http://files.vagrantup.com/precise64.box'


    # Define our virtual machine settings
    config.vm.define :symfony2 do |symfony2|

        symfony2.vm.hostname = "symfony2-project.dev"
        symfony2.vm.network :private_network, ip: "192.168.33.10"
        symfony2.vm.synced_folder ".", "/vagrant", :nfs => true

        # Here we customize our virtualbox provider. If there are others, add them accordingly below
        symfony2.vm.provider :virtualbox do |vbox|
            vbox.gui = true

            vbox.customize [
                'modifyvm', :id, '--chipset', 'ich9',               # solves kernel panic issue on some host machines
                '--uartmode1', 'file', 'C:\\base6-console.log'      # uncomment to change log location on Windows
            ]
        end

        # Provision through puppet
        symfony2.vm.provision :puppet do |puppet|
            puppet.manifests_path = "support/puppet/manifests"
            puppet.module_path = "support/puppet/modules"
            puppet.manifest_file = "symfony2.pp"
            puppet.options = [
                '--verbose',
#                '--debug',
            ]
        end
    end
end
