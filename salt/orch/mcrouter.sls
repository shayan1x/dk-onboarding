deploy_mcrouter:
    salt.state:
        - tgt: worker*-mcrouter
        - sls:
            - mcrouter