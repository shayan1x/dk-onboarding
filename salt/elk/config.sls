copy_elastic_config_to_workers:
  file.managed:
    - source: salt://elk/files/elasticsearch.yml
    - name: /etc/elasticsearch/elasticsearch.yml
    - template: jinja

copy_kibana_config_to_workers:
  file.managed:
    - source: salt://elk/files/kibana.yml
    - name: /etc/kibana/kibana.yml
    - template: jinja

elasticsearch:
  service.running:
    - enable: True
    - restart: True
    - watch:
      - file: copy_elastic_config_to_workers
  
kibana:
  service.running:
    - enable: True
    - restart: True
    - watch:
      - file: copy_kibana_config_to_workers
  