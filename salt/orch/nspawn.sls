install_nspawn_with_salt:
    salt.state:
        - tgt: worker[0-9]
        - sls:
            - nspawn

accept_keys:
    salt.wheel:
        - name: key.accept
        - match: "*"