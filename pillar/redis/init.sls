common:
  serverPort: 6379
  sentinelPort: 26379
  downAfterMs: 30000
  failoverTimeout: 65000
  masterName: mymaster
  parallelSyncs: 1
  quorum: 2
  protectedMode: False
  bind: 0.0.0.0
  backlog: 32768
  authPassword: a9a5061bfaabd7597fff569c41125073598a36d1de28d8065422b731f5956fd154c01c2aaf0e051c

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