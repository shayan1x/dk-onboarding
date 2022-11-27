packages: 
  - percona-server-server-5.7
  - percona-xtrabackup-24

connection:
  host: localhost
  user: root
  pass: ''
  port: 3306


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


commonConfig:
  port: 3306
  back_log: 1000
  bind_address: '*'
  connect_timeout: 15
  general_log: 'ON'
  max_connect_errors: 1000000000000
  max_connections: 1000
  max_execution_time: 600
  max_prepared_stmt_count: 500000
  binlog_cache_size: 1073741824
  expire_logs_days: 4
  innodb_buffer_pool_size: 1G
  sync_binlog: 1
  innodb_flush_log_at_trx_commit: 1
  innodb_log_file_size: 2G


slaveConfig:
  read_only: 'ON'
  super_read_only: 'ON'
  slave_parallel_workers: 4

xtrabackup:
  backup_dir: /tmp/backup


nodes:
  - name: worker1
    hostname: worker1
    ip: 192.168.56.101
    binlog: True
    isMaster: True
    serverId: 1

  - name: worker2
    hostname: worker2
    ip: 192.168.56.102
    binlog: True
    isMaster: False
    serverId: 2

  - name: worker3
    hostname: worker3
    ip: 192.168.56.103
    binlog: False
    isMaster: False
    serverId: 3