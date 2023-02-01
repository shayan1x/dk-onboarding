/etc/mysql/conf.d/mysqld.cnf:
  file.managed:
    - source: salt://mysql/files/mysqld.cnf.j2
    - template: jinja
    - user: root
    - group: root
    - mode: 0644

  service.running:
    - name: mysql
    - enable: true
    - watch: 
      - file: /etc/mysql/conf.d/mysqld.cnf