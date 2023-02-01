install_rsync:
    salt.state:
        - tgt: worker*
        - sls:
            - mysql.rsync

setup_cluster_master:
    salt.state:
        - tgt: worker1
        - sls:
            - mysql
            - mysql.grants


setup_cluster_intermediate:
    salt.state:
        - tgt: worker2
        - sls:
            - mysql
            - mysql.restore


setup_cluster_slaves:
    salt.state:
        - tgt: worker3
        - sls:
            - mysql
            - mysql.restore