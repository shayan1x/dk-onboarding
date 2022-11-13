create_user:
  cmd.run:
    - name: mysql -uroot -e "CREATE USER '{{ pillar["percona_haproxy_user"]["name"] }}'@'%' IDENTIFIED BY '{{ pillar["percona_haproxy_user"]["pwd"] }}'"
    - onlyif: test $(mysql -sN -e "select COUNT(1) FROM mysql.user where user='{{ pillar["percona_haproxy_user"]["name"] }}'") == 0
    - shell: /usr/bin/bash