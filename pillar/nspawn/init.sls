container:
    base_os: stretch
    base_name: base-debian
    dir: /var/lib/machines
    master: 192.168.56.100
    repo_url: http://archive.debian.org/debian
    includes:
        - systemd
        - dbus
        - ca-certificates
        - salt-minion
        - apt-transport-https

# services:
#     - redis
#     - elasticsearch
#     - mysql
#     - haproxy
#     - mcrouter
#     - memcached

# services_v2:
#     - name: redis
#       diskSize: 3Gi
#       vgName: vgroot

# network_configurations:
#     - VirtualEthernet=no

nspawn_common_config:
    network: 
        - VirtualEthernet=no
    exec: 
        - NotifyReady=yes
        - LimitNOFILE=100000
    files: []

nspawn_containers:
    - name: redis
      volume:
        size: 2G
        vg: vg-nspawn
        type: ext4

    - name: elasticsearch
      volume:
        size: 3G
        vg: vg-nspawn
        type: ext4

    - name: haproxy
      volume:
        size: 1G
        vg: vg-nspawn
        type: ext4

    - name: mcrouter
      volume:
        size: 3G
        vg: vg-nspawn
        type: ext4

    - name: memcached
      volume:
        size: 1G
        vg: vg-nspawn
        type: ext4

    - name: mysql
      volume:
        size: 3G
        vg: vg-nspawn
        type: ext4