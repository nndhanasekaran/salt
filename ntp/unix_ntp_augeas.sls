{% from "ntp/map.jinja" import ntp with context %}

{% if grains['kernel'] == 'Linux' %}

include:
  - augeas

ntp:
  pkg.installed:
    - name: {{ ntp.client }}

{% if grains['NTP_Server_1'] is defined and grains['NTP_Server_1'] != 'NO_ENTRY_IN_SPREADSHEET' %}
{% set ntp_server_1 = grains['NTP_Server_1'] %}
{% else %}
{% set ntp_server_1 = pillar.ntp.get('server[1]') %}
{% endif %}

{% if grains['NTP_Server_2'] is defined and grains['NTP_Server_2'] != 'NO_ENTRY_IN_SPREADSHEET' %}
{% set ntp_server_2 = grains['NTP_Server_2'] %}
{% else %}
{% set ntp_server_2 = pillar.ntp.get('server[2]') %}
{% endif %}

{% if grains['NTP_Server_3'] is defined and grains['NTP_Server_3'] != 'NO_ENTRY_IN_SPREADSHEET' %}
{% set ntp_server_3 = grains['NTP_Server_3'] %}
{% else %}
{% set ntp_server_3 = pillar.ntp.get('server[3]') %}
{% endif %}

{% if grains['NTP_Server_4'] is defined and grains['NTP_Server_4'] != 'NO_ENTRY_IN_SPREADSHEET' %}
{% set ntp_server_4 = grains['NTP_Server_4'] %}
{% else %}
{% set ntp_server_4 = pillar.ntp.get('server[4]') %}
{% endif %}

ntp_servers:
  augeas.change:
    - lens: ntp.lns
    - context: /files{{ ntp.ntp_conf }}
    - changes:
      - set server[1] {{ ntp_server_1 }}
      - set server[2] {{ ntp_server_2 }}
##      - set server[3] {{ ntp_server_3 }}   ## Disabled only for TNT
##      - set server[4] {{ ntp_server_4 }}   ## Disabled only for TNT

ntp_running:
  service.running:
    - name: {{ ntp.service }}
    - enable: True
    - watch:
      - augeas: ntp_servers

{% endif %}
