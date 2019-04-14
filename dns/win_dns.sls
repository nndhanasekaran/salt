{% from "dns/map.jinja" import dns_server_1,dns_server_2,dns_server_3,dns_domain with context %}

{% set interface1 = salt['cmd.powershell']('(Get-NetAdapter | select -First 1).name') %}

config_dns_servers:
  win_dns_client.dns_exists:
    - interface: {{ interface1 }}
    - replace: True
    - servers:
      - {{ dns_server_1 }}
      - {{ dns_server_2 }}
      {% if dns_server_3 %}
      - {{ dns_server_3 }}
      {% endif %}
