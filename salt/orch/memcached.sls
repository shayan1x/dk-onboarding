deploy_memcached:
    salt.state:
        - tgt: worker*-memcached
        - sls:
            - memcached