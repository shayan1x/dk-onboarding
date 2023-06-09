lvm_map:
    - name: lvm_nspawn
      devices:
        - {"name": "disk1", "device": "/dev/sdc"}
      vg: vg0
      lv: lv0
      size: 24G
      createFilesystem: True
      fsType: ext4
      mountpoint: /var/lib/machines

physical_volumes:
  - /dev/sdc

volume_groups:
  - name: vg-nspawn
    disks:
      - /dev/sdc

volumes: []
  # - name: lv-elasticsearch
  #   size: 2G
  #   vgname: vg-nspawn
  #   mountpoint: /var/lib/machines/elasticsearch
  #   fsType: ext4

  # - name: lv-redis
  #   size: 2G
  #   vgname: vg-nspawn
  #   mountpoint: /var/lib/machines/redis
  #   fsType: ext4

  # - name: lv-mysql
  #   size: 2G
  #   vgname: vg-nspawn
  #   mountpoint: /var/lib/machines/mysql
  #   fsType: ext4

  # - name: lv-memcached
  #   size: 2G
  #   vgname: vg-nspawn
  #   mountpoint: /var/lib/machines/memcached
  #   fsType: ext4