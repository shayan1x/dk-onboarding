install_memcached:
  salt.state:
    - tgt: worker*
    - sls:
      - memcached