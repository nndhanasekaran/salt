include:
  {% if salt.grains.get('kernel') == 'Linux' %}
  - .unix_ntp_augeas
  {% endif %}
  {% if salt.grains.get('kernel') == 'Windows' %}
  - .win_ntp
  {% endif %}
