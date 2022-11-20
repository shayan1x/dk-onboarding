base:
  '*':
    - prerequisite
  
  'worker1':
    - percona
    - percona.create_user
    - redis
    # - elk
    - memcached

  'worker[2-9]':
    - match: pcre
    - percona
    - redis
    # - elk
    - memcached

  'lb*':
    - haproxy
    - mcrouter