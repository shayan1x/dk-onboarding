firewall_rules:
    - table: filter
      chain: INPUT
      jump: ACCEPT
      in-interface: lo
      comment: "Allow loopback traffic"
      save: True

    - table: filter
      chain: INPUT
      source: 0.0.0.0/0
      protocol: tcp
      dport: 26379
      jump: ACCEPT
      comment: "Allow redis-sentinel [TCP/26379]"
      save: True

    - table: filter
      chain: INPUT
      source: 0.0.0.0/0
      protocol: tcp
      dport: 6379
      jump: ACCEPT
      comment: "Allow redis-server [TCP/6379]"
      save: True


    - table: filter
      chain: INPUT
      source: 0.0.0.0/0
      protocol: tcp
      dport: 10000
      jump: ACCEPT
      comment: "Allow memcached [TCP/10000]"
      save: True


    - table: filter
      chain: INPUT
      source: 0.0.0.0/0
      protocol: tcp
      dport: 9200
      jump: ACCEPT
      comment: "Allow elasticsearch API [TCP/9200]"
      save: True

    - table: filter
      chain: INPUT
      source: 0.0.0.0/0
      protocol: tcp
      dport: 9300
      jump: ACCEPT
      comment: "Allow elasticsearch cluster [TCP/9300]"
      save: True

    - table: filter
      chain: INPUT
      source: 0.0.0.0/0
      protocol: tcp
      dport: 22
      jump: ACCEPT
      comment: "Allow SSH server [TCP/22]"
      save: True

    - table: filter
      chain: INPUT
      source: 0.0.0.0.0/0
      connstate: ESTABLISHED,RELATED
      jump: ACCEPT
      comment: "Allow established, related connections"
      save: True

firewall_policies:
  - table: filter
    chain: FORWARD
    family: ipv4
    policy: DROP
    save: True

  - table: filter
    chain: INPUT
    family: ipv4
    policy: ACCEPT
    save: True