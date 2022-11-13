vm.swappiness:
  sysctl.present:
    - value: 0

net.core.somaxconn:
  sysctl.present:
    - value: 32768

net.ipv4.tcp_fin_timeout:
  sysctl.present:
    - value: 10

net.ipv4.tcp_max_syn_backlog:
  sysctl.present:
    - value: 16384

net.ipv4.tcp_max_tw_buckets:
  sysctl.present:
    - value: 262144

net.ipv4.tcp_syncookies:
  sysctl.present:
    - value: 1