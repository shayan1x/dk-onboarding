vm.overcommit_memory:
  sysctl.present:
    - value: 1


disable_hugepages:
  file.line:
    - name: /etc/sysfs.conf
    - content: kernel/mm/transparent_hugepage/enabled = never
    - match: kernel/mm/transparent_hugepage/enabled
    - mode: insert
    - location: end

sysfsutils:
  service.running:
    - restart: True
    - enable: True
    - watch:
      - file: disable_hugepages


net.core.somaxconn:
  sysctl.present:
    - value: 32768