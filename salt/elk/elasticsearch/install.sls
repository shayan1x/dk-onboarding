/tmp/elasticsearch-7.14.0-amd64.deb:
    file.managed:
        - source: salt://elk/files/elasticsearch-7.14.0-amd64.deb
    pkg.installed:
        - sources:
            - elasticsearch: /tmp/elasticsearch-7.14.0-amd64.deb
        - require:
            - file: /tmp/elasticsearch-7.14.0-amd64.deb