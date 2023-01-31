vrrp_configuration:
    master_host: lb1
    interface: eth1
    router_id: 200
    auth_type: PASS
    auth_pass: HelloWorld2022
    advert_int: 1
    virtual_ips:
        - 192.168.56.200
        - 192.168.56.201
        - 192.168.56.202