base:

  'worker[0-9]+$':
    - match: pcre
    - elk
    - mcrouter
    - nspawn
    - lvm.workers
    - iptables.worker_rules
    - sysctl

  worker1:
    - redis.worker1-redis
    - mysql.worker1-mysql

  worker2:
    - redis.worker2-redis
    - mysql.worker2-mysql

  worker3:
    - redis.worker3-redis
    - mysql.worker3-mysql

  worker1-redis:
    - redis.workers-sentinel
    - redis.worker1-redis

  worker2-redis:
    - redis.workers-sentinel
    - redis.worker2-redis

  worker3-redis:
    - redis.workers-sentinel
    - redis.worker3-redis

  worker1-mysql:
    - mysql.worker1-mysql

  worker2-mysql:
    - mysql.worker2-mysql

  worker3-mysql:
    - mysql.worker3-mysql

  worker*-elasticsearch:
    - elk

  worker*-mcrouter:
    - mcrouter

  worker*-memcached:
    - mcrouter

  worker*-haproxy:
    - haproxy
