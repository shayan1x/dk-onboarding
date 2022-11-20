install_requirements:
  salt.state:
    - tgt: '*'
    - sls:
      - prerequisite