#!yaml|gpg

force_restart: False

sentinel_configuration:
    # Network configuration
    "bind":  "0.0.0.0"
    "port": 26379
    "protected-mode": "no"

    # Process-related configuration
    "daemonize": "yes"
    "supervised": "systemd"

    # LOG file and PID file location
    "pidfile": "/var/run/sentinel/redis-sentinel.pid"
    "logfile": "/var/log/redis/redis-sentinel.log"

    # Redis-sentinel directory
    "dir": "/var/lib/redis"

    # Sentinel instances
    "sentinel monitor dk-sentinel": "192.168.56.101 6379 2"
    "sentinel down-after-milliseconds dk-sentinel": "5000"
    "sentinel failover-timeout dk-sentinel": "13000"
    "sentinel parallel-syncs dk-sentinel": 2
    "sentinel auth-pass dk-sentinel": |
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