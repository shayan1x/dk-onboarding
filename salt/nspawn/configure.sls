{% set container = pillar['container'] %}

{% set os = container['base_os']  %}
{% set dir = container['dir']  %}
{% set base_name = container['base_name']  %}
{% set container_dir = dir + "/" + base_name %}
{% set includes = container['includes'] | join(',')  %}
{% set master = container['master'] %}
{% set services = pillar['services'] %}
{% set minion_id = salt['grains.get']('id')  %}

create_nspawn_systemd_directory:
    file.directory:
        - name: /etc/systemd/nspawn
        - user: root
        - group: root
        - makedirs: True

download_images:
    cmd.run:
        - name: debootstrap {{ "--include=" + includes if includes else "" }} {{ os }} {{ container_dir }}
        - unless: test -d {{ container_dir }}
        - shell: /bin/bash


{% for service in services %}
{% set service_name = minion_id + "-" + service %}
create_nspawn_{{ minion_id }}_{{ service }}:
    file.managed:
        - source: salt://nspawn/files/container.nspawn.j2
        - name: /etc/systemd/nspawn/{{ service_name }}.nspawn
        - template: jinja

create_container_{{ minion_id }}_{{ service }}:
    cmd.run:
        - name: machinectl clone {{ base_name }} {{ service_name }}
        - require:
            - cmd: download_images
            - file: create_nspawn_{{ minion_id }}_{{ service }}
        - unless: machinectl image-status {{ service_name }}
        - shell: /bin/bash

start_container_{{ minion_id }}_{{ service }}:
    cmd.run:
        - name: machinectl start {{ service_name }}
        - require:
            - cmd: create_container_{{ minion_id }}_{{ service }}
        - unless: machinectl status {{ service_name }}

bootstrap_salt_{{ minion_id }}_{{ service }}:
    cmd.run:
        - name: |
            machinectl shell {{ service_name }} /bin/bash -c "\
                SALT_SCRIPT=/opt/salt-bootstrap
                
                if [[ ! -f "\$SALT_SCRIPT" ]]; then
                    wget -O \$SALT_SCRIPT https://bootstrap.saltproject.io/
                    chmod +x "\$SALT_SCRIPT"
                fi

                systemctl cat salt-minion 2>/dev/null 1>&2

                if [[ \$? -ne 0 ]]; then
                    "\$SALT_SCRIPT" -A {{ master }} -i {{ service_name }}
                fi
            "
        - require: 
            - cmd: start_container_{{ minion_id }}_{{ service }}
        - unless: systemd-run -P -M {{ service_name }} /bin/bash -c "systemctl status salt-minion 1>/dev/null 2>&1"
{% endfor %}
    