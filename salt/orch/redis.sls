deploy_redis:
    salt.state:
        - tgt: worker*-redis
        - sls:
            - redis