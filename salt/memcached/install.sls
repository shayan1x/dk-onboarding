memcached:
  pkg:
    - installed

  service.running:
    - name: memcached
    - enable: True
    - watch:
      - file: /etc/memcached.conf

/etc/memcached.conf:
  file.managed:
    - source: salt://memcached/files/memcached.conf
    - require:
      - pkg: memcached
    - template: jinja