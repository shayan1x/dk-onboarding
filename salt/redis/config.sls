/etc/redis/redis.conf:
  file.managed:
    - source: salt://redis/files/redis.conf
    - template: jinja
    - user: redis
    - group: redis
    - mode: 0640
    - require:
      - pkg: install_redis

/tmp/redis-green:
  file.managed:
    - source: salt://redis/files/sentinel.conf
    - template: jinja

/etc/redis/sentinel.conf:
  file.managed:
    - source: salt://redis/files/sentinel.conf
    - name: /etc/redis/sentinel.conf
    - template: jinja
    - user: redis
    - group: redis
    - mode: 0640
    - require:
      - pkg: install_redis
    - unless: |
        diff /tmp/redis-blue /tmp/redis-green
    - shell: /bin/bash

blue_green:
  file.managed:
    - source: salt://redis/files/sentinel.conf
    - template: jinja
    - names:
      - /tmp/redis-blue

redis-server:
  service.running:
    - enable: True
    - watch:
      - file: /etc/redis/redis.conf

redis-sentinel:
  service.running:
    - enable: True
    - watch: 
      - file: /etc/redis/sentinel.conf