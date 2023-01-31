lvm_map:
    - name: lvm_nspawn
      devices:
        - {"name": "disk1", "device": "/dev/sdb"}
      vg: vg0
      lv: lv0
      size: 24G
      createFilesystem: True
      fsType: ext4
      mountpoint: /var/lib/machines