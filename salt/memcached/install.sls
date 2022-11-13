memcached:
  pkg.installed

/etc/memcached.conf:
  file.managed:
    - source: salt://memcached/files/memcached.conf
    - require:
      - pkg: memcached

enable_memcached:
  service.running:
    - name: memcached
    - enable: True
    - watch:
      - file: /etc/memcached.conf