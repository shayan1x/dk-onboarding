#!yaml|gpg
vrrp_configuration:
    master_host: lb1
    interface: eth1
    router_id: 200
    auth_type: PASS
    auth_pass: |
        -----BEGIN PGP MESSAGE-----

        hQGMA0grNKYaOe2IAQv/SacCwldbqqodtpbTnxtdADYHZh15UyksQgRB8H6yi1dG
        5O3a+XcxNmyQzz4ZS6MI4tbLgiuXGFuVQE574Aj5rPm7WucUDTULLljbAiZpwJaV
        baRi74FAkCaT9LvO7l5Buqjq4DwYELsuG+WEehbHpnFFVgPWKpTt4n68xEyfSA4H
        cO/SgjVKYsltljRk0uwRNi+ghZE8ZQzdXlEFfVuBRGINP31QIW52Vn2znXzUcbCK
        UMC0yHqMQEhY6evljW0HE86YPngWN7xZ9HqFo9+Fi0KWVzpEUXII73Qub71vuLSY
        t1lDHh9S88d7mXuN8Kbj7qdo+Gg/3xJwzko9nVPH/94YFlP8TVKKWbpfOpStysPT
        ARaq6Zj2XRG10W9aIwmw0HBF7Zuz/JOVYVyXgPemoloVvVo1EB/j96Dr3eY/sCGe
        6ijb/pq9gurlLj8LSRVxYAB6MJvXq2wPxc85QeQQTnrrjIT0oqUUdx+X5ewIZhaX
        Ny/mwNqJazYSvlSBhH/A0ksBlVXNNpj9t3Ld5nCwN2E5a36B39+TgVcnpKFW/Gzr
        Go5MutBFXAQlJZXGjJBA+PQsCS836PVkS+7U/HCVcaSDTCvfTfID2Tpy0vI=
        =Qh6l
        -----END PGP MESSAGE-----
    advert_int: 1
    virtual_ips:
        - 192.168.56.200
        - 192.168.56.201
        - 192.168.56.202