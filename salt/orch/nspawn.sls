install_nspawn_with_salt:
    salt.state:
        - tgt: worker1
        - sls:
            - nspawn

accept_keys:
    salt.wheel:
        - name: key.accept
        - match: "*"
        - onchanges:
            - install_nspawn_with_salt