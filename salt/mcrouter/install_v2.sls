install_mcrouter:
  pkg.installed:
    - sources: 
      - mcrouter: salt://mcrouter/files/mcrouter-0.38-new.deb
    - refresh: True

/etc/default/mcrouter:
  file.managed:
    - source: salt://mcrouter/files/environment
    - user: root
    - group: root
    - mode: 0644
    - template: jinja

/etc/mcrouter/mcrouter.conf:
  file.managed:
    - source: salt://mcrouter/files/mcrouter.conf
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
    - require:
      - pkg: install_mcrouter
      - file: /etc/default/mcrouter

mcrouter:
  service.running:
    - enable: True
    - watch:
      - file: /etc/mcrouter/mcrouter.conf
      - file: /etc/default/mcrouter