/etc/kibana/kibana.yml:
  file.managed:
    - source: salt://elk/files/kibana.yml
    - template: jinja

  service.running:
    - enable: True
    - name: kibana
    - watch:
      - file: /etc/kibana/kibana.yml