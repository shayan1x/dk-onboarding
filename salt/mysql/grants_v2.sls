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

{% endfor %}

{% for role in pillar['roles'] %}

{% set role_users = role['users'] %}
{% set role_grants = role['grants'] %}

{% for grant in role_grants %}
{% for user in role_users %}

set_roles_{{ grant['name'] }}_user_{{ user['name'] }}_{{ loop.index }}:
  {% if grant['enable'] and user['enable'] %}
  mysql_grants.present:
  {% else %}
  mysql_grants.absent:
  {% endif %}
    - name: "{{ grant['name'] }}"
    - grant: "{{ grant['grant'] }}"
    - database: "{{ grant['database'] }}"
    - user: "`{{ user['name'] }}`"
    - host: "`{{ user['host'] }}`"

{% endfor %}
{% endfor %}
{% endfor %}