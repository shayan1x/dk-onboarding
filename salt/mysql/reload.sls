{{ pillar['key'] }}:
    mysqlconf.present:
        - value: {{ pillar['value'] }}
        - mysql_pwd: "{{ pillar['mysql_auth']['root_password'] }}"