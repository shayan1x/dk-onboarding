set_sysctls:
    salt.state:
        - tgt: worker1,worker2,worker3
        - tgt_type: list
        - sls:
            - sysctl