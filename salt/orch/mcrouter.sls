install_mcrouter:
  salt.state:
    - tgt: lb*
    - sls:
      - mcrouter