base:
  'worker*':
    - percona
    - redis
    - elk

  'lb*':
    - percona
    - redis