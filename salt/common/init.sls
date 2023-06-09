install_packages:
  pkg.installed:
    - names:
      - python3-mysqldb
      - python3-pymysql
      - debconf-utils

install_mysql:
    pip.installed:
        - name: pymysql
        - target: "/opt/saltstack/salt/lib/python3.10/site-packages"

install_redis:
    pip.installed:
        - name: redis
        - target: "/opt/saltstack/salt/lib/python3.10/site-packages"