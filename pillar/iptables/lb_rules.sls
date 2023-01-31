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
      comment: "Allow redis-sentinel over HAProxy [TCP/26379]"
      save: True

    - table: filter
      chain: INPUT
      source: 0.0.0.0/0
      protocol: tcp
      dport: 6379
      jump: ACCEPT
      comment: "Allow redis-server over HAProxy [TCP/6379]"
      save: True
  
    - table: filter
      chain: INPUT
      source: 0.0.0.0/0
      protocol: tcp
      dport: 6380
      jump: ACCEPT
      comment: "Allow redis-server over HAProxy [TCP/6380]"
      save: True

    - table: filter
      chain: INPUT
      source: 0.0.0.0/0
      protocol: tcp
      dport: 22
      jump: ACCEPT
      comment: "Allow SSH Server [TCP/22]"
      save: True

    - table: filter
      chain: INPUT
      source: 0.0.0.0/0
      protocol: tcp
      dport: 5400
      jump: ACCEPT
      comment: "Allow MCRouter [TCP/5400]"
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