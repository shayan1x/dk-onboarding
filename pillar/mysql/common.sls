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
  innodb_flush_log_at_trx_commit: 2
  innodb_log_file_size: 250M
  innodb_sort_buffer_size: 1M

connection:
  host: localhost
  user: root
  pass: ''
  port: 3306