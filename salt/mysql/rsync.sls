ssh_key:
  ssh_auth.present:
    - user: root
    - source: salt://mysql/files/ssh_keys/mysql.pub
    - config: '%h/.ssh/authorized_keys'

/root/.ssh/id_rsa:
  file.managed:
    - source: salt://mysql/files/ssh_keys/mysql
    - mode: 0400