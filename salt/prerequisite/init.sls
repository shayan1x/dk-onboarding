install_packages:
  pkg.installed:
    - pkgs:
      - wget
      - gnupg2
      - lsb-release
      - curl  
      - python3-mysqldb
    - refresh: True