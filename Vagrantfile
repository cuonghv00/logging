N = 1
Vagrant.configure("2") do |config|
    (1..N).each do |i|
        config.vm.provision "file", source: "ssh-secrets/id_rsa", destination: "/home/vagrant/.ssh/id_rsa"
        public_key = File.read("ssh-secrets/id_rsa.pub")
        config.vm.provision "shell", inline: <<-SHELL
            mkdir -p /home/vagrant/.ssh
            chmod 700 /home/vagrant/.ssh
            echo '#{public_key}' >> /home/vagrant/.ssh/authorized_keys
            chmod -R 600 /home/vagrant/.ssh/authorized_keys
            echo 'Host 192.168.*.*' >> /home/vagrant/.ssh/config
            echo 'StrictHostKeyChecking no' >> /home/vagrant/.ssh/config
            echo 'UserKnowHostsFile /dev/null' >> /home/vagrant/.ssh/config
            chmod -R 600 /home/vagrant/.ssh/config
        SHELL

        config.vm.box = "centos/7"
        
        config.vm.define "node-#{i}" do |node|
            node.vm.hostname = "node-#{i}"
            node.vm.network :private_network, ip: "192.168.56.#{i+5}"
            node.vm.provider :virtualbox do |vb|
                vb.memory = 6192
                vb.cpus = 4
            end
        end
    end
end