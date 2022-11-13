{% set hostname = salt['grains.get']('id') %}
{% if hostname == 'worker1' %}
{% set service = "mysql@bootstrap" %}
{% else %}
{% set service = "mysql" %}
{% endif %}

start_mysql:
  service.running:
    - enable: True
    - reload: True
    - name: {{ service }}