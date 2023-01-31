keepalived:
    pkg:
        - installed
    service.running:
        - enable: True
        - reload: True
        - watch:
            - file: /etc/keepalived/keepalived.conf


/etc/keepalived/keepalived.conf:
    file.managed:
        - source: salt://keepalived/files/keepalived.conf.j2
        - template: jinja
        - require: 
            - pkg: keepalived