/etc/kibana/jvm.options:
  file.managed:
    - source: salt://elk/files/jvm.options
    - template: jinja

/etc/kibana/kibana.yml:
  file.managed:
    - source: salt://elk/files/kibana.yml
    - template: jinja

kibana:
  service.running:
    - enable: True
    - watch:
      - file: /etc/kibana/kibana.yml
