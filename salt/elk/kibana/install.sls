/tmp/kibana-7.14.0-amd64.deb:
    file.managed:
        - source: salt://elk/files/kibana-7.14.0-amd64.deb
        - name: /tmp/kibana-7.14.0-amd64.deb

    pkg.installed:
        - sources:
            - kibana: /tmp/kibana-7.14.0-amd64.deb
        - require:
            - file: /tmp/kibana-7.14.0-amd64.deb
