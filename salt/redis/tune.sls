vm.overcommit_memory:
  sysctl.present:
    - value: 1

/etc/sysfs.d/disable_hugepages.conf:
  file.managed:
    - contents: |
        kernel/mm/transparent_hugepage/enabled = never
    - create: True
    - user: root
    - group: root
    - mode: 0640

sysfsutils:
  service.running:
    - restart: True
    - enable: True
    - watch:
      - file: /etc/sysfs.d/disable_hugepages.conf

net.core.somaxconn:
  sysctl.present:
    - value: 32768