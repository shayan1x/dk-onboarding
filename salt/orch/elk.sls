deploy_elk:
    salt.state:
        - tgt: worker*-elasticsearch
        - sls:
            - elk