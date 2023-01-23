delete_backup_dir:
  file.directory:
    - name: {{ pillar['xtrabackup']['backup_dir'] }}
    - clean: True

create_backup:
  cmd.run:
    - name: xtrabackup --backup --binlog-info=ON --target-dir {{ pillar['xtrabackup']['backup_dir'] }}
    - require: 
      - file: delete_backup_dir

prepare_backup:
  cmd.run:
    - name: xtrabackup --prepare --target-dir {{ pillar['xtrabackup']['backup_dir'] }}

delete_old_backup:
  file.directory:
    - clean: true
    - name: /vagrant/db_bak

/vagrant/db_bak:
  file.copy:
    - source: {{ pillar['xtrabackup']['backup_dir'] }}
    - user: vagrant
    - group: vagrant
    - force: True