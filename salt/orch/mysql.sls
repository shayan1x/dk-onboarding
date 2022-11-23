percona_install:
  salt.state:
    - tgt: worker*
    - sls:
      - mysql.install

percona_grants:
  salt.state:
    - tgt: worker1
    - sls:
      - mysql.grants


percona_config:
  salt.state:
    - tgt: worker*
    - sls:
      - mysql.config

percona_backup:
  salt.state:
    - tgt: worker1
    - sls:
      - mysql.backup

percona_slave:
  salt.state:
    - tgt: worker[2-9]
    - tgt_type: pcre
    - sls:
      - mysql.slave