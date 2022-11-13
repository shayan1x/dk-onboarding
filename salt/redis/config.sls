update_redis_server:
  file.managed:
    - source: salt://redis/files/redis.conf
    - name: /etc/redis/redis.conf
    - template: jinja
    - user: redis
    - group: redis
    - mode: 0640

update_redis_sentinel:
  file.managed:
    - source: salt://redis/files/sentinel.conf
    - name: /etc/redis/sentinel.conf
    - template: jinja
    - user: redis
    - group: redis
    - mode: 0640

redis-server:
  service.running:
    - enable: True
    - restart: True
    - watch:
      - file: update_redis_server

redis-sentinel:
  service.running:
    - enable: True
    - restart: True
    - watch:
      - file: update_redis_sentinel