copy_mysqld_config:
  file.managed:
    - source: salt://percona/files/mysqld.cnf
    - name: /etc/mysql/mysql.conf.d/mysqld.cnf
    - template: jinja