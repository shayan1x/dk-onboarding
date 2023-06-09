{% set sudo_user = pillar['sudo_user'] %}
{% set mysql_auth = pillar['mysql_auth'] %}

update_packages:
  pkg.uptodate:
    - refresh: true

install_python_packages:
  pkg.installed:
    - names:
      - python-mysqldb
      - python-pymysql
      - debconf-utils
      - openssh-client

download_repo:
  file.managed:
     - source: https://repo.percona.com/apt/percona-release_latest.{{ grains['oscodename'] }}_all.deb
     - name: /tmp/percona-release.deb
     - skip_verify: True

install_repo:
  cmd.run:
    - name: "DEBIAN_FRONTEND=noninteractive apt-get install --fix-broken /tmp/percona-release.deb -yq --allow-downgrades"
    - unless: 
      - dpkg -s percona-server-server
      - dpkg -s percona-xtrabackup-80

enable_repo:
  cmd.run:
    - name: percona-release setup ps80
    - onchanges:
      - cmd: install_repo

debconf_auth_config:
  debconf.set:
    - name: percona-server-server
    - data:
        percona-server-server/default-auth-override:
          type: string
          value: "Use Legacy Authentication Method (Retain MySQL 5.x Compatibility)"

        percona-server-server/root-pass:
          type: string
          value: {{ mysql_auth['root_password'] }}

        percona-server-server/re-root-pass:
          type: string
          value: {{ mysql_auth['root_password'] }}

install_percona_server:
  pkg.installed:
    - pkgs: {{ pillar['mysql_packages'] }}
    - require:
      - cmd: enable_repo
    - refresh: True

/etc/mysql/conf.d/mysqld.cnf:
  file.managed:
    - source: salt://mysql/files/mysqld.cnf.j2
    - template: jinja
    - user: root
    - group: root
    - mode: "0644"

mysql:
  service.running:
    - enable: true
    - watch: 
      - file: /etc/mysql/conf.d/mysqld.cnf