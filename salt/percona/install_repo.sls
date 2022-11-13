/tmp/percona-release_latest.generic_all.deb:
  file.managed:
    - source:
      - https://repo.percona.com/apt/percona-release_latest.generic_all.deb
    - skip_verify: True

install_percona:
  pkg.installed:
    - sources:
      - percona-release: https://repo.percona.com/apt/percona-release_latest.generic_all.deb
    - require:
      - file: /tmp/percona-release_latest.generic_all.deb

update_pkg:
  pkg.uptodate:
    - refresh : True

enable_repo:
  cmd.run:
    - name: "percona-release setup pxc80"
    - runas: root
    - require:
      - pkg: install_percona