{% set lvm_map = pillar['lvm_map'] %}

{% for map in lvm_map %}

{% set name = map['name'] %}
{% set all_devices = map['devices'] %}
{% set vgname = map['vg'] %}
{% set lvname = map['lv'] %}
{% set size = map['size'] %}
{% set mountpoint = map['mountpoint'] %}
{% set fs = map['fsType'] %}
{% set createFS = map['createFilesystem'] %}

{% for device in all_devices %}
{% set device_name = device['name'] %}
{% set device_location = device['device'] %}

create_lvm_{{ name }}_pv_{{ device_name }}:
    lvm.pv_present:
        - name: {{ device_location }}
{% endfor %}

create_lvm_{{ name }}_vg_{{ vgname }}:
    lvm.vg_present:
        - name: {{ vgname }}
        - devices: {{ all_devices | map(attribute = 'device') | list }}

create_lvm_{{ name }}_lv_{{ lvname }}:
    lvm.lv_present:
        - vgname: {{ vgname }}
        - name: {{ lvname }}
        - size: {{ size }}
        - require:
            - create_lvm_{{ name }}_vg_{{ vgname }}

{% if createFS %}
{% set lvm_dev = "/dev/{}/{}".format(vgname, lvname) %}
create_lvm_{{ name }}_fs:
    blockdev.formatted:
        - name: {{ lvm_dev }}
        - fs_type: {{ fs }}
        - require:
            - create_lvm_{{ name }}_lv_{{ lvname }}

mount_lvm_{{ name }}_fs:
    mount.mounted:
        - device: {{ lvm_dev }}
        - name: {{ mountpoint }}
        - fstype: ext4
        - persist: True
        - mkmnt: True
        - require:
            - create_lvm_{{ name }}_fs

{% endif %}
{% endfor %}