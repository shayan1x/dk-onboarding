#!jinja|yaml|gpg

backup_config: 
    enabled: True
    directory: /home/mysql-backup/worker1-mysql
    local_directory: /backup
    rsync_host: 192.168.56.100
    rsync_user: mysql-backup
    rsync_key: |
        -----BEGIN PGP MESSAGE-----

        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
        =9KaY
        -----END PGP MESSAGE-----
    force_backup: False

restore_config: 
    enabled: False
    directory: /home/mysql-backup/master-server
    local_directory: /backup
    rsync_host: 192.168.56.100
    rsync_user: mysql-backup
    rsync_key: |
        -----BEGIN PGP MESSAGE-----

        hQGMA0grNKYaOe2IAQwAhctJ4HI+jXS4LEQ17OviZBTf/1+aSBIiZbveebulibXe
        SVKETYvybIhNkS3+cJe19zKbWv5a1+8TuoY7iKTmJNUCNRwP8JfPbTp6KabVmAB5
        O1jIJ0Zc7aen4PwE2OrpzqoicBjuuYtvc7ymlSqekPYEE6aqdxoAQKKNjSRaflFd
        tX4JfvoigOzV7yYxcVCSyfndNAHnj78mkspnFFfMjgVTMdWQ6zA6lBRhYAxI+Yfn
        mhmRoRFYakV2iG9KRqtjf8HfAfDiduaQGgmtMX9Dlm7Hl0zgkyYucny1LgMVtkaK
        s1KBwZW5wpXZFVaQ9Gn93leG96dtZ50LZnVFii2+l+LYZ2SVcOQiE+vq052Tr+LU
        P3D+Zzw06E2x2GUH1ZzoJYVB/hFOLfJ4evUarNwdX50XzIx3QQEKYk5bJfNC6HE9
        z3XI2rlnesZwQU3SYM4i3Yhzh2KqqW0RrqFC7eO8zVQC39kQ+1i9AcoYbrrizrIU
        o3kRcTJRr18LUU4mYu2t0uoBTC77R4RfX7dPDjqV3aibFPkFCc1ZwqtISphxYo33
        72EakVK427yb1mFaV5l1oQYrKkQd4M2HnuviVrgX6jHyxewEmLmwbHaZDXV6VP5V
        JAK+XgbBjv9PqKLuKc7aTSBjw6Ws7JVio1HCjmocia90ZldqdtvsqlDX0Mccn1/l
        POvfJty88/HTA7VJbQ7P0OKqhKM7cwfs8Lgq6G42x04Y3ReKZtYOL1CpGdM34ZRw
        FHyVEHrF3KbLtNznHf709KaZcxFgW/rKhgxWWSOQiaHeVm0LFve2pNiYjXId50AK
        jaMxMXg4WrhT546CNU97wU3+YP5p9OgejUVn+eEUdbfTMUOeER2ZWlU1rRG+MW3B
        SkMvnFBM3tHUtLBsNhfKN/qutm34waC8ss33CR7+JXAKzhwwvOzOqL6IlNe0wIkA
        bSrB0q0AjXxj8psFcbcwuy+ZAPWXsasGWlksBmF8ZtTxvrw8oe/o7hrM9VIOZl1u
        ZLz25AYClBm3IWzRoZJSL2qDMh/Gg3pRTL91ysT9ImA6kXYscK2AgBmuNUeQvUws
        oskrFrSOlku7QlyPwaTjrqytbRs59c33i6Yoedyg9sh/RUeyRPIkcgnbCjnnlCoW
        STBKzyxHZWYcOeSiEteiZ6Q3vBJzOXX+rfKYruavzeJ8PpYyMLGaaMgigha4LN6j
        +28sAI3bX3vH7Aa+Svq0zOQKpAPEsiREWnphkHHXF0p7XAdQyV8QhF4fK2ltjo7D
        CJdL0M+69eooCoInYSpJsIzAk02a/YmqR/dPMj+Ktjhbji8SYR5AzvcaXZmR4XT1
        qV6OE77MZM4yvRS0l6aFw+Hs1wR8g/k0Ow99fYV50ka/r/l8oVC86DC1jOfGQjxo
        7ob9/pnL4+R/yVOmvgn2Se/YP0+WRXZIGhX/Elws4Q2/jUPh2A/f48hcOhnq3l37
        y9MKotKyIzokHrR7pzl0MUH8MSb851WLsM/7YZ1M2ZPVkDPW7rJOuRDYzDZtQ5eD
        RSsrX9Q90jEFBjOCOY3mEUmJoSEXC4yclr01c83aAbpkyqs8wU+8BfHbA1Wn1/mU
        FcwBnWMPzmyYWtQh/ereeFesCcEVEf2br/6FtO0Rhx7ViibPnSVvSJWPd5WYBOae
        7UeGogUVBaJO7MqaMuanZmCGK0ukOLQyUCgD9cc5U/lvR/ucAjEeVdSG9PzPz4fa
        B+kvw9SLEctd7ut9B8Bav0uJI7M/e9qIX15cS0h+0GoUto76pRp/crCavxXfguox
        3QRzHhsNk6Ow7TPFaDRCoKlAUhT9d8PruTPgnTnYMDnAcbKAy8vsE2jD/3OZnrlO
        yO4wKeMOjlBuhSKGfqKo7pksqruV9a354YydMqH4qVPN6Wvk61C6Hqh60tnLHoF0
        3MHmR73B4guCr1uDF3EDEJ016TZ5ZlVQjjjtW/6xvhDW5ly4tjO41lWB7cGYdPOd
        MzcKcHPZIP52xTOzmevmZLCFA1xp906VO1Ern0ITbB2OGTmzmare9VzBO4+S72jP
        hFwy4zA+4/5SQBLtMP+GajQd+e2rsEPhAauNPHAF+UqxL2Adt9DqaOj/iXYXl6rb
        IiOgDXaIO5aDmxsQoUIBeS/hWknrxqrmxucSGoP80M8uN6EB2ACTN+LlVbP0FvYE
        mHS5L1Wyiv2f10r9s8cSWUJS+nO6Cx8Up0WysHzhrQeoBpLZdes61a99+iwTeKtc
        1QcipChPEnJGc4Pgiz9CWzzxcLAB17owLOUMTjUdICZxr2XL0gzMd+LfcXKk5iQu
        UrmMtZ0dPTa0TqHfv51BMpQ5wmpLXth3KlGGuxrc3VXOPIiHSoEeLNgBy0iguoPo
        n7m6a4ascE1HH5gqnWcwYn/umtzQ/lRl7cm3YztgrNGrLKERydeqLOGySlzzMIe6
        uelSTYTEN7VggYrcMMQgKYE7ti35lBUVwWn8knpQLdhL4KpfOfDJ44EriyWd/iYn
        WucpfC0u5qfXHYqC0CDqq17e3keEXteHsgBbvwXC7miWpVcW+K+apwlsD1f42491
        rdV7iE5BFT6fLJDxl6xs34TdwTocB4HIw39exQuRni4MA/V/JCSdXmgFXVrlFD3k
        LSiqG8Ug6RWE7jb8AqD89aUXxYkWascF8JhUwAb/MA2FJzRw6GXuHaaMUx2lGxiQ
        XlxjeIcLvjkMWqUPLyInTiZz5eBvqXOgYFd2qKc+kFOuc4sUSiWkg+cK/93rhK9v
        iBjzJSa2K+H+PH5IZfQZ7cwjE6SfVQ7euwY0Z7lebhdihh3UyGYZ+lMal2YcvDdy
        10MZSrKSEKjmOIevSZV2nx/9EKt6fXnFSrRL9mT1PydcORB9A1um9dsyuzgAKnk4
        SRxZ0rc9NCoBauhg5/MiB1p/Sc/Q2oa8gdXhr6z+M2PLV0vlzk0/yMhOnWesk022
        dyFnhzO3fMrACsAKWqoOB3E4Bo8poeWgJVv1To2ZxaGrSlz5m20ZizlGz/gOZ8tk
        CR3yUmrsG4jYOaH8xRHPmOnEJ+RL071dvA+047Pjix9moBE0XaZfcbz00zOOYoe/
        tCeLP5yUH9Bvnd7T0h+F1kf6RBAxt6SPq3eSgoLoLOglXmllTp6XoViIQOPfdqLX
        J5qYvpsKYk4sQzCQWdLEF46S0dDhhEhi3aYoQ6/UB2Yknc7MaEVNobQH3oMpke3X
        mAE8qQiZv8VYO5mkfe2pCO0VpV/ZGzFIABM0Wbe+ImhSftTYXLty8/3wQF23/g==
        =9KaY
        -----END PGP MESSAGE-----
    force_restore: False

replication_config:
    enabled: False
    master_host: 192.168.56.100
    master_user: "replication"
    master_port: 3306
    master_password: ""

mysql_packages: 
  - percona-server-server
  - percona-xtrabackup-80

mysql_config:
    server_id: 1
    port: 3306
    back_log: 1000
    bind_address: '*'
    connect_timeout: 15
    max_connect_errors: 1000000000000
    max_connections: 5000
    max_execution_time: 30000
    expire_logs_days: 4
    innodb_buffer_pool_size: 256M
    sync_binlog: 1
    innodb_flush_log_at_trx_commit: 2
    innodb_log_file_size: 250M
    binlog-ignore-db: "mysql"
