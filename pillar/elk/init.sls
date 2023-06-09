cluster:
  name: mycluster
  port: 9200

kibana:
  port: 5601
  host: localhost
  maxPayload: 1048576
  serverName: myserver

jvm:
  minHeapSize: 256m
  maxHeapSize: 256m

elk_nodes:
  - name: worker1-elasticsearch
    hostname: worker1-elasticsearch
    ip: 192.168.56.101
    isMaster: True

  - name: worker2-elasticsearch
    hostname: worker2-elasticsearch
    ip: 192.168.56.102
    isMaster: False

  - name: worker3-elasticsearch
    hostname: worker3-elasticsearch
    ip: 192.168.56.103
    isMaster: False