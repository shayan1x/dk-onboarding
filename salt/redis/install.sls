install_redis:
  pkg.installed:
    - pkgs:
      - redis-server
      - redis-sentinel
      - sysfsutils