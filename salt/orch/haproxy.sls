deploy_haproxy:
    salt.state:
        - tgt: worker*-haproxy
        - sls:
            - haproxy