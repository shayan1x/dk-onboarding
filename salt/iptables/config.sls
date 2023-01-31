{% set firewall_rules = pillar['firewall_rules'] %}
{% set firewall_policies = pillar['firewall_policies'] %}

{% for rule in firewall_rules %}
firewall_rule_{{ loop.index }}:
    iptables.append:
        {% for key, value in rule.items() %}
        - {{ key }}: {{ value | string }}
        {% endfor %}
{% endfor %}


{% for rule in firewall_policies %}
firewall_policy_{{ loop.index }}:
    iptables.set_policy:
        {% for key, value in rule.items() %}
        - {{ key }}: {{ value | string }}
        {% endfor %}
{% endfor %}