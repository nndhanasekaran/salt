{% if grains['kernel'] == 'Windows' %}

{% if grains['NTP_Server_1'] is defined %}
{% set ntp_server_1 = grains['NTP_Server_1'] %}
{% else %}
{% set ntp_server_1 = pillar.ntp.get('server[1]') %}
{% endif %}

{% if grains['NTP_Server_2'] is defined %}
{% set ntp_server_2 = grains['NTP_Server_2'] %}
{% else %}
{% set ntp_server_2 = pillar.ntp.get('server[2]') %}
{% endif %}

{% if grains['NTP_Server_3'] is defined %}
{% set ntp_server_3 = grains['NTP_Server_3'] %}
{% else %}
{% set ntp_server_3 = pillar.ntp.get('server[3]') %}
{% endif %}

{% if grains['NTP_Server_4'] is defined %}
{% set ntp_server_4 = grains['NTP_Server_4'] %}
{% else %}
{% set ntp_server_4 = pillar.ntp.get('server[4]') %}
{% endif %}

win_ntp:
  ntp.managed:
    - servers:
      - {{ ntp_server_1 }}
      {% if ntp_server_2 and not ntp_server_2  == 'NO_ENTRY_IN_SPREADSHEET' %}
      - {{ ntp_server_2 }}
      {% endif %}
      {% if ntp_server_3 %}
      - {{ ntp_server_3 }}
      {% endif %}
      {% if ntp_server_4 %}
      - {{ ntp_server_4 }}
      {% endif %}

{% endif %}
