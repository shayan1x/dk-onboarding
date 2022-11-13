install_mcrouter_requirements:
  pkg.installed:
    - pkgs:
      - libdouble-conversion3
      - libjemalloc-dev
      - libgflags2.2
      - libgoogle-glog-dev
      - libboost1.71-all-dev
      - libbz2-dev
      - libevent-dev
      - libgflags-dev
      - liblz4-dev
      - liblzma-dev
      - liblzma5
      - libsnappy-dev
      - libsodium-dev
      - libssl-dev
      - libtool

/opt/mcrouter:
  archive.extracted:
    - source: salt://mcrouter/files/mcrouter.tar.gz
    - user: root
    - group: root

/etc/mcrouter:
  file.directory:
    - user: root
    - group: root
    - mode: 0744

/etc/mcrouter/mcrouter.conf:
  file.managed:
    - source: salt://mcrouter/files/mcrouter.conf
    - user: root
    - group: root
    - mode: 0644

/usr/lib/systemd/system/mcrouter.service:
  file.managed:
    - source: salt://mcrouter/files/mcrouter.service
    - user: root
    - group: root
    - mode: 0644


'systemctl -q daemon-reload':
  cmd.run:
    - watch:
      - file: /usr/lib/systemd/system/mcrouter.service


mcrouter:
  service.running:
    - enable: True
    - watch:
      - file: /usr/lib/systemd/system/mcrouter.service