/etc/mysql/conf.d/mysqld.cnf:
  file.managed:
    - source: salt://mysql/files/mysqld.cnf
    - template: jinja
    - user: root
    - group: root
    - mode: 0644


restart_mysql:
  service.running:
    - name: mysql
    - enable: true
    - watch: 
      - file: /etc/mysql/conf.d/mysqld.cnf
