base:
  'worker*':
    - percona
    - redis
    - elk
    - mcrouter
    - mysql

  'lb*':
    - percona
    - redis
    - mcrouter