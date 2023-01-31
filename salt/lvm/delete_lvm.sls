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



{% if createFS %}
{% set lvm_dev = "/dev/{}/{}".format(vgname, lvname) %}

lvm_remove_{{ name }}:
    mount.unmounted:
        - name: {{ mountpoint }}
        - device: {{ lvm_dev }}
        - persist: True

    lvm.vg_absent:
        - name: {{ vgname }}
        - require: 
            - mount: lvm_remove_{{ name }}

{% for device in all_devices %}
{% set device_name = device['name'] %}
{% set device_location = device['device'] %}

lvm_remove_pv_{{ device_name }}:
    lvm.pv_absent:
        - name: {{ device_location }}
        - watch:
            - lvm: lvm_remove_{{ name }}
{% endfor %}

{% endif %}


{% endfor %}