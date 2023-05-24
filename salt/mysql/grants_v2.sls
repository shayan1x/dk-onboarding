{% set conn = pillar['connection']  %}
{% set mysql_auth = pillar['mysql_auth'] %}

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
    - connection_host: "127.0.0.1"
    - connection_user: root
    - connection_pass: "{{ mysql_auth['root_password'] }}"
    - connection_db: mysql
    - auth_plugin: mysql_native_password

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
    - user: "{{ user['name'] }}"
    - host: "{{ user['host'] }}"
    - connection_host: "127.0.0.1"
    - connection_user: root
    - connection_pass: "{{ mysql_auth['root_password'] }}"

{% endfor %}
{% endfor %}
{% endfor %}