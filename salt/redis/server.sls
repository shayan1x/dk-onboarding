/etc/redis/redis.conf:
  file.managed:
    - source: salt://redis/files/redis.conf
    - template: jinja
    - user: redis
    - group: redis
    - mode: 0640
    - require:
      - pkg: install_redis

redis-server:
  service.running:
    - enable: True
    - watch:
      - file: /etc/redis/redis.conf