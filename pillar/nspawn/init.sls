container:
    base_os: stretch
    base_name: base-debian
    dir: /var/lib/machines
    master: 192.168.56.100
    includes:
        - systemd
        - dbus

services:
    - redis
    - haproxy
    - mysql
    - elasticsearch

network_configurations:
    - VirtualEthernet=no