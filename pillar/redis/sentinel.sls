sentinel:
  bindAddress: 0.0.0.0
  bindPort: 26379
  protectedMode: True
  daemonize: True
  pidFile: /var/run/sentinel/redis-sentinel.pid
  logFile: /var/log/redis/redis-sentinel.log
  dir: /var/lib/redis
  instances:
    - name: dk-sentinel
      masterHost: 192.168.56.101
      masterPort: 6379
      quorum: 2
      downAfterMs: 3000
      failoverTimeout: 12000
      parallelSyncs: 1
      authPassword: J6EOUUNRYv0lEZsG4yP0M4XH1