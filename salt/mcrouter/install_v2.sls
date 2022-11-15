install_mcrouter:
  pkg.installed:
    - sources: 
      - mcrouter: salt://mcrouter/files/mcrouter-1.0.deb
    - refresh: True

/etc/mcrouter/mcrouter.conf:
  file.managed:
    - source: salt://mcrouter/files/mcrouter.conf
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
    - require:
      - pkg: install_mcrouter

mcrouter:
  service.running:
    - enable: True
    - full_restart: True
    - watch:
      - file: /etc/mcrouter/mcrouter.conf