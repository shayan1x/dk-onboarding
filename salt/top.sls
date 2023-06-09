base:
  '*':
    - prerequisite
    - common
  
  'worker1':
    - percona
    - percona.create_user
    # - elk
    - memcached
    - nspawn
    - lvm.lvm

  'worker[2-9]':
    - percona
    # - elk
    - memcached
    - nspawn
    - lvm.lvm

  'worker*-mysql':
    - mysql