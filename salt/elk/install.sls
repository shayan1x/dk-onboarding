copy_elasticsearch_to_workers:
  file.managed:
    - source: salt://elk/files/elasticsearch-7.14.0-amd64.deb
    - name: /tmp/elasticsearch-7.14.0-amd64.deb

copy_kibana_to_workers:
  file.managed:
    - source: salt://elk/files/kibana-7.14.0-amd64.deb
    - name: /tmp/kibana-7.14.0-amd64.deb

install_elasticsearch:
  pkg.installed:
    - sources:
      - elasticsearch: /tmp/elasticsearch-7.14.0-amd64.deb
    - require:
      - file: copy_elasticsearch_to_workers

install_kibana:
  pkg.installed:
    - sources:
      - kibana: /tmp/kibana-7.14.0-amd64.deb
    - require:
      - file: copy_kibana_to_workers
