common:
  serverPort: 6379
  sentinelPort: 26379
  downAfterMs: 3000
  failoverTimeout: 12000
  masterName: mymaster
  parallelSyncs: 1
  quorum: 2
  protectedMode: True
  bind: 0.0.0.0
  backlog: 32768
  authPassword: a9a5061bfaabd7597fff569c41125073598a36d1de28d8065422b731f5956fd154c01c2aaf0e051c
  timeout: 600
  dbCount: 32
  serveStalePolicy: 'yes'
  replicationTimeout: 30
  replicationPingInterval: 5
  replicationBacklogSize: 5mb
  replicationMinToWrite: 1
  replicationMaxLag: 5
  maxConnections: 500
  appendOnly: 'yes'
  securePassword: J6EOUUNRYv0lEZsG4yP0M4XH1


authentication:
  enabled: True
  securePassword: J6EOUUNRYv0lEZsG4yP0M4XH1

persistence:
  enabled: True
  dir: /var/lib/redis

  rdb:
    enabled: True
    filename: dump.rdb
    compression: True
    checksum: True
    saveStrategy:
      - invl: 900
        changes: 1
      - invl: 300
        changes: 100
      - invl: 60
        changes: 10000  

  aof:
    enabled: True
    filename: appendonly.aof
    fsyncMode: everysec

replication:
  enabled: True
  readOnly: True
  serveStalePolicy: True
  disklessSync: False
  disklessSyncDelay: 5
  pingReplicaPeriod: 5
  timeout: 30
  disableTcpNodelay: False
  backlogSize: 5mb
  backlogTtl: 3600
  priority: 100

consistency:
  minReplicasToWrite: 1
  minReplicasMaxLag: 5

master:
  ip: 192.168.56.101
  hostname: worker1
  port: 6379

slaves:
  worker2:
    hostname: worker2
    ip: 192.168.56.102
    port: 6379

  worker3:
    hostname: worker3
    ip: 192.168.56.103
    port: 6379


nodes:
  - name: worker1
    host: 192.168.56.101
    port: 6379
    role: master

  - name: worker2
    host: 192.168.56.101
    port: 6379
    role: replica

  - name: worker2
    host: 192.168.56.101
    port: 6379
    role: replica