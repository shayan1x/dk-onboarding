base:
  'worker*':
    - percona
    - redis
    - elk
    - mcrouter

  'lb*':
    - percona
    - redis
    - mcrouter