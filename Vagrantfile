masterConfig = {
	:box => "ubuntu/focal64",
	:hostname => "master",
	:network_ip => "192.168.56.100",
	:memory => 1024,
	:cpu => 1
}

workers = [
	{
		:box => "ubuntu/focal64",
		:hostname => "worker1",
		:network_ip => "192.168.56.101",
		:memory => 3000,
		:cpu => 2	
	},

	{
		:box => "ubuntu/focal64",
		:hostname => "worker2",
		:network_ip => "192.168.56.102",
		:memory => 3000,
		:cpu => 2
	},

	{
		:box => "ubuntu/focal64",
		:hostname => "worker3",
		:network_ip => "192.168.56.103",
		:memory => 3000,
		:cpu => 2
	}
]

loadbalancers = [
	{
		:box => "ubuntu/focal64",
		:hostname => "lb1",
		:network_ip => "192.168.56.104",
		:memory => 512,
		:cpu => 1	
	}
]

mcrouters = [
	{
		:box => "ubuntu/bionic64",
		:hostname => "mc1",
		:network_ip => "192.168.56.105",
		:memory => 768,
		:cpu => 1	
	}
]


Vagrant.configure("2") do |config|
	config.vm.define "master" do |master| 
		master.vm.box = masterConfig[:box]
		master.vm.network "private_network", ip: masterConfig[:network_ip]
		master.vm.hostname = masterConfig[:hostname]
		master.vm.provider "virtualbox" do |v|
			v.memory = masterConfig[:memory]	
			v.cpus = masterConfig[:cpu]
		master.vm.synced_folder "./salt", "/srv/salt"
		master.vm.synced_folder "./pillar", "/srv/pillar"
		master.vm.provision "shell" do |shell|
			shell.path = "scripts/salt.sh"
			shell.args = ["master"]
		end
		end
	end

	workers.each do |worker|
		config.vm.define worker[:hostname] do |wk| 
			wk.vm.box = worker[:box]
			wk.vm.network "private_network", ip: worker[:network_ip]
			wk.vm.hostname = worker[:hostname]
			wk.vm.provider "virtualbox" do |v|
				v.memory = worker[:memory]
				v.cpus = worker[:cpu]
			end
			wk.vm.provision "shell" do |shell|
				shell.path = "scripts/salt.sh"
				shell.args = ["minion", "#{worker[:hostname]}", "#{masterConfig[:network_ip]}"]
			end
		end		
	end

	loadbalancers.each do |worker|
		config.vm.define worker[:hostname] do |wk| 
			wk.vm.box = worker[:box]
			wk.vm.network "private_network", ip: worker[:network_ip]
			wk.vm.hostname = worker[:hostname]
			wk.vm.provider "virtualbox" do |v|
				v.memory = worker[:memory]
				v.cpus = worker[:cpu]
			end
			wk.vm.provision "shell" do |shell|
				shell.path = "scripts/salt.sh"
				shell.args = ["minion", "#{worker[:hostname]}", "#{masterConfig[:network_ip]}"]
			end
		end		
	end

	mcrouters.each do |worker|
		config.vm.define worker[:hostname] do |wk| 
			wk.vm.box = worker[:box]
			wk.vm.network "private_network", ip: worker[:network_ip]
			wk.vm.hostname = worker[:hostname]
			wk.vm.provider "virtualbox" do |v|
				v.memory = worker[:memory]
				v.cpus = worker[:cpu]
			end
		end		
	end
end
