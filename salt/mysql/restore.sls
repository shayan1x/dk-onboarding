{% set restore_config = pillar['restore_config'] %}
{% set replication_config = pillar['restore_config'] %}
{% set ssh_path = "/root/.ssh/mysql-backup" %}

{% if restore_config['enabled'] %}

stop_mysql:
    service.dead:
        - name: mysql
        - enable: True

/root/.ssh:
  file.directory:
    - user: root
    - group: root
    - mode: "0700"

{{ ssh_path }}:
  file.managed:
    - contents_pillar: restore_config:rsync_key
    - user: root
    - group: root
    - mode: "0400"
    - require:
        - file: /root/.ssh

{{  restore_config['local_directory'] }}:
    file.directory:
        - user: root
        - group: root

{% set rsync_user = restore_config['rsync_user'] %}
{% set rsync_host = restore_config['rsync_host'] %}
{% set rsync_dir = restore_config['directory'] %}
{% set backup_dir = restore_config['local_directory'] %}
{% set root_pwd = pillar['mysql_auth']['root_password'] %}

remove_local_directory:
   file.directory:
      - name: {{ backup_dir }}
      - clean: True

rsync_from_parent:
    cmd.run:
        - name: "rsync -a --rsh 'ssh -o StrictHostKeyChecking=no -i {{ ssh_path }}' {{ rsync_user }}@{{ rsync_host }}:{{ rsync_dir }}/ {{ backup_dir }}"

xtrabackup_prepare:
    cmd.run:
        - name: "xtrabackup --prepare -p{{ root_pwd }} --target-dir {{ backup_dir }}"
        - onchanges:
            - cmd: rsync_from_parent

remove_mysql_data:
   file.directory:
      - name: /var/lib/mysql/     
      - clean: True
      - onchanges: 
        - cmd: xtrabackup_prepare

xtrabackup_copy_back:
    cmd.run:
        - name: "xtrabackup --copy-back --target-dir {{ backup_dir }} --datadir /var/lib/mysql"
        - onchanges: 
            - cmd: xtrabackup_prepare

chown_mysql_data:
    cmd.run:
        - name: "chown -R mysql:mysql /var/lib/mysql"

start_mysql:
    service.running:
        - name: mysql
        - enable: True

{% endif %}


{% if replication_config['enabled'] %}

/etc/mysql/replication.sh:
    file.managed:
        - source: salt://mysql/files/replication.sh.j2
        - template: jinja
        - user: root
        - group: root
        - mode: 0750
    
    cmd.run:
        - require:
            - file: /etc/mysql/replication.sh 

{% endif %}

