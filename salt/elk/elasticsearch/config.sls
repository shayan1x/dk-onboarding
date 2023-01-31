/etc/elasticsearch/jvm.options.d/custom.options:
  file.managed:
    - source: salt://elk/files/jvm.options
    - template: jinja


/etc/elasticsearch/elasticsearch.yml:
  file.managed:
    - source: salt://elk/files/elasticsearch.yml
    - template: jinja

  service.running:
    - enable: True
    - name: elasticsearch
    - watch:
      - file: /etc/elasticsearch/elasticsearch.yml
      - file: /etc/elasticsearch/jvm.options.d/custom.options
  