{% set conn = pillar['connection']  %}
{% for user in pillar['users'] %}
{{ user['name'] }}_user:
  {% if user['enable'] == True %}
  mysql_user.present:
  {% else %}
  mysql_user.absent:
  {% endif %}
    - name: "{{ user['name'] }}"
    - host: "{{ user['host'] }}"
    - password: "{{ user['pass'] }}"
    - connection_host: {{ conn['host'] }}
    - connection_user: {{ conn['user'] }}
    - connection_pass: {{ conn['pass'] }}
    - connection_port: {{ conn['port'] }}


{% for grant in user['grants']  %}
{{ user['name'] }}_grants_{{ grant['name'] }}:
  mysql_grants.present:
    - grant: {{ grant['grant'] }}
    - database: "{{ grant['database'] }}"
    - grant_option: {{ grant['grants'] }}
    - user: "{{ user['name'] }}"
    - host: "{{ user['host'] }}"
    - require:
      - mysql_user: {{ user['name'] }}_user
{% endfor %}
{% endfor %}