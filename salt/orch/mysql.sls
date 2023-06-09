worker1-mysql:
    salt.state:
        - tgt: worker1-mysql
        - sls:
            - mysql

worker1-grants:
    salt.state:
        - tgt: worker1
        - sls:
            - mysql.grants

worker2-mysql:
    salt.state:
        - tgt: worker2-mysql
        - sls:
            - mysql

worker2-grants:
    salt.state:
        - tgt: worker2
        - sls:
            - mysql.grants

worker3-mysql:
    salt.state:
        - tgt: worker3-mysql
        - sls:
            - mysql
        - require:
            - salt: worker2-mysql

worker3-grants:
    salt.state:
        - tgt: worker3
        - sls:
            - mysql.grants