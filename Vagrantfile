# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV["LC_ALL"] = "en_US.UTF-8"

Vagrant.configure(2) do |config|

    config.vm.box = "ubuntu/xenial64"
    config.vm.hostname = 'sheep-image'

    config.vm.provider 'virtualbox' do |vb|
        vb.customize ['modifyvm', :id, '--memory', '2048']
        vb.customize ['modifyvm', :id, '--chipset', 'ich9']
    end

    config.vm.provision "shell", privileged: true, path: "prepare-build-env.sh"
    config.vm.provision "shell", privileged: true, path: "build.sh", args: "#{ENV['QCOW2_IMAGE']}"
end
