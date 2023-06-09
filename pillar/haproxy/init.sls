#!yaml|gpg
redis_haproxy:
    hosts:
        worker1-redis: "192.168.56.101:6379"
        worker2-redis: "192.168.56.102:6379"
        worker3-redis: "192.168.56.103:6379"
    password: |
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

mysql_haproxy:
    masters: 
        worker1-mysql: "192.168.56.101:3306"
    slaves: 
        worker2-mysql: "192.168.56.102:3306"
        worker3-mysql: "192.168.56.102:3306"