add_percona_repo:
  pkg.installed:
    - sources: 
      - percona-release: https://repo.percona.com/apt/percona-release_latest.{{ grains['oscodename'] }}_all.deb
    - refresh: True


install_percona_server:
  pkg.installed:
    - pkgs: {{ pillar['packages'] }}
    - require:
      - pkg: add_percona_repo
    - refresh: True

mysql:
  service.running:
    - enable: true
    - require:
      - pkg: install_percona_server