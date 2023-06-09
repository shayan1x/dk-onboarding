{% set backup_config = pillar['backup_config'] %}
{% set backup_dir = backup_config['local_directory'] %}
{% set ssh_path = "/root/.ssh/mysql-backup" %}

{% if backup_config['enabled'] %}

backup_create_ssh_dir:
  file.directory:
    - name: /root/.ssh
    - user: root
    - group: root
    - mode: "0700"

backup_copy_ssh_key:
  file.managed:
    - name: {{ ssh_path }}
    - contents_pillar: backup_config:rsync_key
    - user: root
    - group: root
    - mode: "0400"
    - require:
        - file: backup_create_ssh_dir

create_backup_dir:
    file.directory:
        - name: {{ backup_config['local_directory'] }}
        - user: root
        - group: root

{% set root_pwd = pillar['mysql_auth']['root_password'] %}

remove_backup_dir:
   file.directory:
      - name: {{ backup_dir }}    
      - clean: True

xtrabackup_create:
    cmd.run:
        - name: "xtrabackup -p{{ root_pwd }} --backup --target-dir {{ backup_dir }} --datadir /var/lib/mysql"
        - require:
            - file: remove_backup_dir

{% set rsync_user = backup_config['rsync_user'] %}
{% set rsync_host = backup_config['rsync_host'] %}
{% set rsync_dir = backup_config['directory'] %}

rsync_to_backup_server:
    cmd.run:
        - name: "rsync --delete -a --rsh 'ssh -o StrictHostKeyChecking=no -i {{ ssh_path }}' {{ backup_dir }}/ {{ rsync_user }}@{{ rsync_host }}:{{ rsync_dir }}"

{% endif %}