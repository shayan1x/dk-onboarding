base:
  'worker*':
    - percona
    - redis
    - elk
    - mcrouter
    - mysql
    - nspawn
    - lvm.workers
    - iptables.worker_rules

  'lb*':
    - keepalived
    - percona
    - redis
    - mcrouter
    - lvm.lbs
    - iptables.lb_rules