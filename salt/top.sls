base:
  '*':
    - prerequisite
  
  'worker1':
    - percona
    - percona.create_user
    - redis
    - elk

  'worker[2-9]':
    - match: pcre
    - percona
    - redis
    - elk

  'lb*':
    - haproxy