{% set ntpserver1 = salt['grains.get']('NTP_Server_1', 'time.windows.com') %}
{% set ntpserver2 = salt['grains.get']('NTP_Server_2') %}
{% set ntpserver3 = salt['grains.get']('NTP_Server_3') %}
{% set ntpserver4 = salt['grains.get']('NTP_Server_4') %}

win_ntp:
  ntp.managed:
    - servers:
      - {{ ntpserver1 }}
      {% if ntpserver2 and not ntpserver2  == 'NO_ENTRY_IN_SPREADSHEET' %}
      - {{ ntpserver2 }}
      {% endif %}
      {% if ntpserver3 %}
      - {{ ntpserver3 }}
      {% endif %}
      {% if ntpserver4 %}
      - {{ ntpserver4 }}
      {% endif %}
