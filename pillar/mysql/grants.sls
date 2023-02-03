users:
  - name: 'replication'
    host: '%'
    enable: True
    pass: 1234
    role: replication

  - name: 'root'
    host: '%'
    enable: True
    pass: 123456
    role: normal

  - name: 'majid'
    host: '%'
    enable: True
    pass: 1234
    role: normal

roles:
  - users:
      - {"name": "replication", "host": "%", "enable": False }
    grants:
      - database: '*.*'
        name: replication_slave_grants
        grant: 'replication slave'
        enable: True
        grant_option: False

  - users:
      - {"name": "root", "host": "%", "enable": True }
      - {"name": "majid", "host": "%", "enable": True }
    grants:
      - database: '*.*'
        name: access_full_grants
        grant: all privileges
        enable: True
        grant_option: True