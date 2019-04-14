{% if salt.grains.get('kernel') == 'Linux' %}
telnet:
  pkg.removed
{% endif %}

{% if salt.grains.get('kernel') == 'Windows' %}
remove_telnet_client:
  dism.feature_removed:
    - name: TelnetClient
{% endif %}
