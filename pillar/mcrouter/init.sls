memcached:
  port: 10000
  bind: 0.0.0.0
  threads: 4
  user: memcache
  memoryLimit: 256
  connections: 500
  logFile: /var/log/memcached.log
  pidFile: /var/run/memcached/memcached.pid


mcrouter:
  port: 5400
  log: /dev/null
  conf: file:/etc/mcrouter/mcrouter.conf

nodes:
  - 192.168.56.101:10000
  - 192.168.56.102:10000
  - 192.168.56.103:10000