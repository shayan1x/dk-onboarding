nodes:
  - name: worker1
    hostname: worker1
    ip: 192.168.56.101
    binlog: True
    isMaster: True
    serverId: 1

  - name: worker2
    hostname: worker2
    ip: 192.168.56.102
    binlog: True
    isMaster: False
    serverId: 2

  - name: worker3
    hostname: worker3
    ip: 192.168.56.103
    binlog: False
    isMaster: False
    serverId: 3

nodes_v2:
  - id: 1
    name: worker1
    role: master
    host: 192.168.56.101

  - id: 2
    name: worker2
    role: intermediate
    host: 192.168.56.102

  - id: 3
    name: worker3
    role: slave
    host: 192.168.56.103