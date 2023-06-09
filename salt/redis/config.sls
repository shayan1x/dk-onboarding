"deb https://packages.redis.io/deb {{ grains['oscodename'] }} main":
    pkgrepo.managed:
        - enabledTrue: True
        - key_url: https://packages.redis.io/gpg
        - refreshTrue: True
        - file: /etc/apt/sources.list.d/redis.list

install_redis:
    pkg.installed:
        - pkgs:
            - redis-server
            - redis-sentinel
            # - sysfsutils

/etc/redis/sentinel.conf:
  file.managed:
    - source: salt://redis/files/sentinel.conf
    - template: jinja
    - user: redis
    - group: redis
    - mode: 0640
    - shell: /bin/bash
    - require:
      - pkg: install_redis


redis-sentinel:
  service.running:
    - enable: True
    - watch:
        - file: /etc/redis/sentinel.conf
    - unless:
        - systemctl is-active redis-sentinel
    - shell: /bin/bash

{% if pillar['force_restart'] %}
"systemctl restart redis-sentinel":
    cmd.run
{% endif %}

/etc/redis/redis.conf:
  file.managed:
    - source: salt://redis/files/redis.conf
    - template: jinja
    - user: redis
    - group: redis
    - mode: 0640

redis-server:
  service.running:
    - enable: True
    - watch:
      - file: /etc/redis/redis.conf
    - unless:
      - systemctl is-active redis-server
    - shell: /bin/bash

