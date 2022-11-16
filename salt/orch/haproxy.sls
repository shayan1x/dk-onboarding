install_loadbalancer:
  salt.state:
    - tgt: lb1
    - sls:
      - haproxy