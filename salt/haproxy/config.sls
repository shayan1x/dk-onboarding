haproxy:
  service.running:
    - restart: True
    - enable: True
    - watch:
      - file: haproxy

  file.managed:
    - name: /etc/haproxy/haproxy.cfg
    - source: salt://haproxy/files/haproxy.cfg
    - template: jinja