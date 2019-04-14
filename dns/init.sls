include:
  {% if salt.grains.get('kernel') == 'Linux' %}
  - dns.unix_dns
  - dns.networkmanager
  {% endif %}
  {% if salt.grains.get('kernel') == 'Windows' %}
  - .win_dns
  {% endif %}
