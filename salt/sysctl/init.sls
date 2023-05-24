{% for key, value in pillar['custom_sysctls'].items() %}
{{ key }}:
    sysctl.present:
        - value: {{ value }}
{% endfor %}