cluster:
  name: mycluster
  port: 9200

kibana:
  port: 5601
  host: localhost
  maxPayload: 1048576
  serverName: myserver

nodes:
  - name: worker1
    hostname: worker1
    ip: 192.168.56.101
    isMaster: True

  - name: worker2
    hostname: worker2
    ip: 192.168.56.102
    isMaster: False

  - name: worker3
    hostname: worker3
    ip: 192.168.56.103
    isMaster: False