#!yaml|gpg
role: slave

redis_configuration:
    replicaof: "192.168.56.101 6379"

    databases: 16
    
    # Security-related configuration
    protected-mode: "no"
    
    # Connection-related configuration
    bind: "0.0.0.0"
    port: 6379
    timeout: 500
    tcp-backlog: 511
    tcp-keepalive: 30
    maxclients: 30000

    # Process-related configuration
    daemonize: "yes"
    supervised: systemd
    pidfile: /var/run/redis/redis-server.pid

    # Logging
    loglevel: notice
    logfile: /var/log/redis/redis-server.log

    # Authentication
    requirepass: |
        -----BEGIN PGP MESSAGE-----

        hQGMA0grNKYaOe2IAQv/YPLWUTG9KMoFoWMryEUgPHYpsf1cXMbU6qF+cLMm5XWx
        VXxiIDxNSL+//7uOJG9g8FYzVMVeUWl8hrAxSlM4Xcj36ZQKQtiTYnqoyUAaaIBF
        UxU+HQVb8ZwZk8K3KEHE9kF0M2Ik1V/+txcCW2bg0N6Y2pxgKLHJibcrxDe8hgNO
        +tQNSgX/J6zLIRTAdayVMC2gaRMZUaz7rS6AvwNmyn4DMR2P0rFuDdXXZn8+LKZA
        gsqnJRdG9wdOqW7uC8kinctCSu86rDSaKROHNUchRt9F2eV3FD2uBoZcggfwYVyY
        JyOvD6NJJ/VnCi+Ebm3jlQQLi9ljy5y8RcavSsFNqK5P14SCpBPajRyMhcJYjPlC
        AGX+AioG/g5oEGQwQ0z4K2fYFqUlGnJToCu8mPPeLq/AjHasCD9du+H0f3A8CHmj
        j7yijH819RE/FSZ0XUerpdINNm4l8Rhaqk8M06vUSgG9yrFGk2oVvWvNvWaIr8CE
        2Wmuy8NIH5Igkauc74cT0kUBW6NAd24ksYy4SWaTCmOidvWkNVSRuvlCtJdrUnyj
        isLozt3K/dS9l8sKuEdCYYRJd1fX8Sl6+GKEDah7bclBiLTaZFk=
        =9uAG
        -----END PGP MESSAGE-----

    masterAuth: |
        -----BEGIN PGP MESSAGE-----

        hQGMA0grNKYaOe2IAQv/YPLWUTG9KMoFoWMryEUgPHYpsf1cXMbU6qF+cLMm5XWx
        VXxiIDxNSL+//7uOJG9g8FYzVMVeUWl8hrAxSlM4Xcj36ZQKQtiTYnqoyUAaaIBF
        UxU+HQVb8ZwZk8K3KEHE9kF0M2Ik1V/+txcCW2bg0N6Y2pxgKLHJibcrxDe8hgNO
        +tQNSgX/J6zLIRTAdayVMC2gaRMZUaz7rS6AvwNmyn4DMR2P0rFuDdXXZn8+LKZA
        gsqnJRdG9wdOqW7uC8kinctCSu86rDSaKROHNUchRt9F2eV3FD2uBoZcggfwYVyY
        JyOvD6NJJ/VnCi+Ebm3jlQQLi9ljy5y8RcavSsFNqK5P14SCpBPajRyMhcJYjPlC
        AGX+AioG/g5oEGQwQ0z4K2fYFqUlGnJToCu8mPPeLq/AjHasCD9du+H0f3A8CHmj
        j7yijH819RE/FSZ0XUerpdINNm4l8Rhaqk8M06vUSgG9yrFGk2oVvWvNvWaIr8CE
        2Wmuy8NIH5Igkauc74cT0kUBW6NAd24ksYy4SWaTCmOidvWkNVSRuvlCtJdrUnyj
        isLozt3K/dS9l8sKuEdCYYRJd1fX8Sl6+GKEDah7bclBiLTaZFk=
        =9uAG
        -----END PGP MESSAGE-----

    # Persistence
    dir: /var/lib/redis

    ## RDB
    dbfilename: dump.rdb
    rdbcompression: "yes"
    rdbchecksum: "yes"
    save: "900 1 300 50 60 1000"

    ## AOF
    appendonly: "yes"
    appendfilename: appendonly.aof
    appendfsync: everysec

    stop-writes-on-bgsave-error: "yes"

    # Replication
    replica-serve-stale-data: "no"
    replica-read-only: "yes"
    repl-diskless-sync: "yes"
    repl-diskless-sync-delay: 3
    repl-ping-replica-period: 5
    repl-timeout: 70
    repl-disable-tcp-nodelay: "yes"
    repl-backlog-size: 104857600
    repl-backlog-ttl: 3600
    replica-priority: 100

    #Consistency
    min-replicas-to-write: 1
    min-replicas-max-lag: 5

    # Refresh rate
    hz: 20
    dynamic-hz: "yes"