install_master_redis:
  salt.state:
    - tgt: worker1
    - sls:
      - redis

install_slave_redis:
  salt.state:
    - tgt: worker[2-9]
    - tgt_type: pcre
    - sls:
      - redis