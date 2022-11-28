install_elasticsearch:
  salt.state:
    - tgt: 'worker*'
    - sls:
      - elk