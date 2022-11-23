{% set filename, position = (salt['file.read']('/vagrant/db_bak/xtrabackup_binlog_info') | trim).split()  %}
{% set master = pillar['nodes'] | selectattr('isMaster', 'equalto', True) | first %}
{% set replication_user = pillar['users'] | selectattr('role', 'equalto', 'replication') | first %}
{% set config = pillar['commonConfig'] %}

stop_mysql_server:
  service.dead:
    - name: mysql


/var/lib/mysql:
  file.directory:
    - clean: True
    - require:
      - service: stop_mysql_server

restore_backup:
  cmd.run:
    - name: xtrabackup --copy-back --target-dir /vagrant/db_bak


change_directory_mode:
  file.directory:
    - name: /var/lib/mysql
    - user: mysql
    - group: mysql
    - recurse:
      - user
      - group

start_mysql_server:
  service.running:
    - name: mysql
    - enable: True
    - require:
      - file: change_directory_mode


start_replication:
  mysql_query.run:
    - database: mysql
    - query: |
        CHANGE MASTER TO
          MASTER_HOST="{{ master['ip'] }}",
          MASTER_USER="{{ replication_user['name'] }}",
          MASTER_PASSWORD="{{ replication_user['pass'] }}",
          MASTER_PORT={{ config['port'] }},
          MASTER_LOG_FILE='{{ filename }}',
          MASTER_LOG_POS={{ position }};
          START SLAVE;
    - require:
      - service: start_mysql_server
