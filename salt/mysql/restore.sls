{% set nodes = pillar['nodes_v2']  %}
{% set replication_user = pillar['users'] | selectattr('role', '==', 'replication') | first %}
{% set node = nodes | selectattr('name', '==', grains['host']) | first %}
{% set role = node['role'] %}
{% set restore_role = 'master' if role == 'intermediate' else ('intermediate' if role == "slave" else None) %}

{% if restore_role != None %}
{% set restore_node = nodes | selectattr('role', '==', restore_role) | first %}
{% set restore_node_name = restore_node['name'] %}
{% set restore_node_host = restore_node['host'] %}
{% set backup_dir = pillar['xtrabackup']['backup_dir'] %}
rsync_backup:
    cmd.run:
        - name: rsync -a root@{{ restore_node_host }}:{{ backup_dir }} {{ backup_dir }}
        - shell: /bin/bash

prepare_backup:
    cmd.run:
        - name: xtrabackup --prepare --target-dir {{ backup_dir }}
        - onchanges:
            - cmd: rsync_backup

/var/lib/mysql:
    file.directory:
        - clean: True

copy_backup_to_mysql:
    cmd.run:
        - name: xtrabackup --move-back --target-dir {{ backup_dir }}
        - require:
            - file: /var/lib/mysql

chown_mysql_dir:
    file.directory:
        - name: /var/lib/mysql/
        - user: mysql
        - group: mysql
        - file_mode: 0640
        - dir_mode: 0750
        - recurse:
            - user
            - group

restart_mysql:
    service.running:
        - name: mysql
        - watch: 
            - cmd: copy_backup_to_mysql
            - file: chown_mysql_dir

start_slave:
    cmd.run:
        - name: |
            BINLOG_FILE=$(cat /var/lib/mysql/xtrabackup_binlog_pos_innodb | awk '{ print $1 }')
            BINLOG_POS=$(cat /var/lib/mysql/xtrabackup_binlog_pos_innodb | awk '{ print $2 }')

            mysql -e "
                CHANGE MASTER TO 
                    MASTER_HOST = '{{ restore_node_host }}',
                    MASTER_USER = \"{{ replication_user['name'] }}",
                    MASTER_PASSWORD = \"{{ replication_user['pass'] }}\",
                    MASTER_PORT = "3306",
                    MASTER_LOG_FILE = \"$BINLOG_FILE\",
                    MASTER_LOG_POS = $BINLOG_POS;
                
                START SLAVE;
            "
        - shell: /bin/bash

{% endif %}