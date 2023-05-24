{% set physical_volumes = pillar['physical_volumes'] %}
{% set volume_groups = pillar['volume_groups'] %}
{% set volumes = pillar['volumes'] %}

{% for pv in physical_volumes %}
    {{ pv }}:
        lvm.pv_present
{% endfor %}

{% for vg in volume_groups %}
    {{ vg['name'] }}:
        lvm.vg_present:
            - devices: {{ vg['disks'] }}
{% endfor %}

{% for lv in volumes %}
    {{ lv['name'] }}:
        lvm.lv_present:
            - vgname: {{ lv['vgname'] }}
            - size: {{ lv['size'] }}
            - resizefs: True
    
    {% set device = "/dev/{}/{}".format(lv['vgname'], lv['name']) %}

    {{ device }}:
        blockdev.formatted:
            - fs_type: {{ lv['fsType'] }}

    {{ lv['mountpoint'] }}:
        mount.mounted:
            - device: {{ device }}
            - fstype: {{ lv['fsType'] }}
            - persist: True
            - mkmnt: True
            - require:
                - blockdev: {{ device }}
{% endfor %}