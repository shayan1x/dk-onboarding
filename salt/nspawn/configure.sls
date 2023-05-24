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
        - name: debootstrap {{ "--include=" + includes if includes else "" }} {{ os }} {{ container_dir }} {{ container['repo_url'] }}
        - unless: test -d {{ container_dir }}
        - shell: /bin/bash


{% set nspawn_containers = pillar['nspawn_containers'] %}

{% set nspawn_common_config = pillar['nspawn_common_config'] %}
{% set nspawn_common_network = nspawn_common_config['network'] %}
{% set nspawn_common_exec = nspawn_common_config['exec'] %}
{% set nspawn_common_files = nspawn_common_config['files'] %}


{% for container in nspawn_containers %}

{% set volume =  container['volume'] %}
{% set volumeName = "lv-{}".format(container['name']) %}
{% set containerName = "{}-{}".format(grains['id'], container['name']) %}

{{ volumeName }}:
    lvm.lv_present:
        - vgname: {{ volume['vg'] }}
        - size: {{ volume
['size']  }}
        - resizefs: True

{% set device = "/dev/{}/{}".format(volume['vg'], volumeName) %}

{{ device }}:
    blockdev.formatted:
        - fs_type: {{ volume['type'] }}

{% set mountpoint = "/var/lib/machines/{}".format(containerName) %}

{{ mountpoint }}:
    mount.mounted:
        - device: {{ device }}
        - fstype: {{ volume['type'] }}
        - persist: True
        - mkmnt: True
        - require:
            - blockdev: {{ device }}

/etc/systemd/nspawn/{{ containerName }}.nspawn:
    file.managed:
        - source: salt://nspawn/files/container-v2.nspawn.j2
        - template: jinja

clone-container-{{ containerName }}:
    cmd.run:
        - name: |
            rsync -a  /var/lib/machines/{{ base_name }}/ /var/lib/machines/{{ containerName }}
        - shell: /bin/bash
        - unless: "[[ -d /var/lib/machines/{{ containerName }}/usr ]]"

start-container-{{ containerName }}:
    module.run:
        - nspawn.start:
            - name: {{ containerName }}
        - unless: machinectl status {{ containerName }}


enable_container-{{ containerName }}:
    module.run:
        - nspawn.enable:
            - name: {{ containerName }}
        - unless: systemctl is-enabled systemd-nspawn@{{ containerName }}

config-container-{{ containerName }}:
    cmd.run:
        - name: |
            machinectl shell {{ containerName }} /bin/bash -c "\
                cat <<EOF  > /etc/salt/minion
                master: {{ master }}
                id: {{ containerName }}
            EOF
                
                systemctl restart salt-minion
                hostnamectl set-hostname {{ containerName }}
                echo 1 > /var/log/.setup_completed
            "
        - unless: "[[ $(cat {{ containerName }}/var/log/.setup_completed) == 1 ]]"
        - shell: /bin/bash
        - cwd: /var/lib/machines
{% endfor %}