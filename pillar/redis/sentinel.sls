#!yaml|gpg
sentinel:
  bindAddress: 0.0.0.0
  bindPort: 26379
  protectedMode: True
  daemonize: True
  pidFile: /var/run/sentinel/redis-sentinel.pid
  logFile: /var/log/redis/redis-sentinel.log
  dir: /var/lib/redis
  instances:
    - name: dk-sentinel
      masterHost: 192.168.56.101
      masterPort: 6379
      quorum: 2
      downAfterMs: 3000
      failoverTimeout: 12000
      parallelSyncs: 1
      authPassword: |
        -----BEGIN PGP MESSAGE-----

        hQGMA0grNKYaOe2IAQv9E8ABYw47ZrI3E4p5dBaUofFuFVJQ7krFzzd2SnYwR+fP
        UfRd1ineRMDNzhWW2WtlgtanHNFCrVF3cCk09DEbLEqzjwpbsOX2yhhRfWhE/Ke1
        eK95tl8qXPiK/HJrjGN6GdIhshLFJVMaCWiqa2j7hwjXCLCAPRHQUVv0A7uCFpkt
        cfWMPOwKv905KTkFFc+7atj0syyUC67dc1VOF08p2x5JTa2hsciUpApAayYvUYhk
        ApHjT6KzwQcPTAobMB0Plf1ub3p1imACHrlyegg7HxhSMR0/pCMfn0fM+sJdI3zl
        01b2JrWR36s1tNol5HwlTudmQJPsFsiJRo68Kc5QCWGBO0O3xNZtLQXwy0PsQBae
        x1ox2MR9x0MDTC1CE3rYFe2eziisxIxwU65NJHnZTdCXi0ct/ZZt5+6Ures8GLlB
        V3an6vNDzitRQ7hr9Ggs6FBeu5iNilhhv6gK9ww0hAJRiNfqQ85/zx5BeMuqBZwK
        LDEQTUQOGqZx/86X9jQb0lUBIdIcKpH5nwX0Yga+IwkMBTw+5hGB9El9JNRKvKOc
        4wtYsJfSC9m3WFA9vR3BQF9E10JHIPo2TScxhnc4fjkP9Q0Ie2mrftlSgKRrMTEo
        tk26gvIw
        =n3Ww
        -----END PGP MESSAGE-----