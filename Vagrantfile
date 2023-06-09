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
		:memory => 3200,
		:cpu => 2,
		:disks => [
			{
				:name => "worker1_additional_nspawn",
				:size => "15GB",
			}
		]
	},

	{
		:box => "ubuntu/focal64",
		:hostname => "worker2",
		:network_ip => "192.168.56.102",
		:memory => 3200,
		:cpu => 2,
		:disks => [
			{
				:name => "worker2_additional_nspawn",
				:size => "15GB"
			}
		]
	},

	{
		:box => "ubuntu/focal64",
		:hostname => "worker3",
		:network_ip => "192.168.56.103",
		:memory => 3200,
		:cpu => 2,
		:disks => [
			{
				:name => "worker3_additional_nspawn",
				:size => "15GB"
			}
		]
	}
]

loadbalancers = [
#	{
#		:box => "bento/debian-9",
#		:hostname => "lb1",
#		:network_ip => "192.168.56.104",
#		:memory => 512,
#		:cpu => 1,
#		:disks => [
#			{
#				:name => "lb1_additional_disk",
#				:size => "5GB"
#			},
#			{
#				:name => "lb1_additional_nspawn",
#				:size => "25GB"
#			}
#		]
#	},
#	{
#		:box => "bento/debian-9",
#		:hostname => "lb2",
#		:network_ip => "192.168.56.105",
#		:memory => 512,
#		:cpu => 1,
#		:disks => [
#			{
#				:name => "lb1_additional_disk",
#				:size => "25GB"
#			},
#			{
#				:name => "lb1_additional_nspawn",
#				:size => "25GB"
#			}
#		]
#	}
]

mcrouters = [
	{
		:box => "bento/debian-9",
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
		master.vm.synced_folder "./gpgkeys", "/etc/salt/gpgkeys", owner: "salt", group: "salt", type: "rsync"
		end
	end

	workers.each do |worker|
		config.vm.define worker[:hostname] do |wk| 
			wk.vm.box = worker[:box]
			wk.vm.network "private_network", ip: worker[:network_ip]
			wk.vm.hostname = worker[:hostname]
			worker[:disks].each do |disk|
				wk.vm.disk :disk, size: "#{disk[:size]}", name: "#{disk[:name]}"
			end
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
			worker[:disks].each do |disk|
				wk.vm.disk :disk, size: "#{disk[:size]}", name: "#{disk[:name]}"
			end
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
end
