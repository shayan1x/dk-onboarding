users:
  - name: 'replication'
    host: '%'
    enable: True
    pass: 1234
    role: replication
    grants:
      - database: '*.*'
        grant: replication slave
        grants: False
        name: replication_slave_grants

  - name: root
    host: '%'
    enable: True
    pass: 123456
    role: normal
    grants:
      - database: '*.*'
        grant: all privileges
        grants: True
        name: root_full_grants

  - name: majid
    host: '%'
    enable: True
    pass: 1234
    role: normal
    grants:
      - database: '*.*'
        grant: all privileges
        grants: True
        name: root_full_grants