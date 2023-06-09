{% for key,value in pillar['redis_configuration'].items() %}
{{ key }}:
    redisconf.present:
        - value: "{{ value }}"
        - redis_host: "127.0.0.1"
        - redis_port: 6379
        - redis_password: {{ pillar['redis_configuration']['requirepass'] }}
{% endfor %}