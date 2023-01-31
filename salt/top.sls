base:
  '*':
    - prerequisite
  
  'worker1':
    - percona
    - percona.create_user
    - redis
    # - elk
    - memcached
    - nspawn

  'worker[2-9]':
    - match: pcre
    - percona
    - redis
    # - elk
    - memcached
    - nspawn

  'lb*':
    - keepalived
    - haproxy
    - mcrouter