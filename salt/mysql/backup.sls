{% set backup_dir = pillar['xtrabackup']['backup_dir'] %}

{{ backup_dir }}:
    file.directory:
        - user: root
        - group: root
        - clean: True
    
    cmd.run:
        - name: xtrabackup --backup --target-dir {{ backup_dir }} --binlog-info=ON
        - require:
            - file: {{ backup_dir }}