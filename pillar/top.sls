base:
  'worker*':
    - percona
    - redis
    - elk
    - mcrouter
    - mysql
    - nspawn

  'lb*':
    - percona
    - redis
    - mcrouter