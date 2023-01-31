security:
  enabled: True
  protectedMode: True

connection:
  bindAddress: 0.0.0.0
  bindPort: 6379
  tcpBacklog: 1024
  tcpKeepalive: 300
  maxClient: 1024
  timeout: 0

database:
  count: 32

process:
  daemonize: True
  supervised: systemd
  pidfile: /var/run/redis/redis-server.pid

authentication:
  enabled: True
  securePassword: J6EOUUNRYv0lEZsG4yP0M4XH1

logging:
  enabled: True
  level: notice
  file: /var/log/redis/redis-server.log

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
  enabled: True
  minReplicasToWrite: 1
  minReplicasMaxLag: 5

refresh:
  enabled: True
  hz: 10
  isDynamic: True

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