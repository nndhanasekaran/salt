{% if salt.grains.get('kernel') == 'Linux' %}
telnet:
  pkg.installed
{% endif %}

{% if salt.grains.get('kernel') == 'Windows' %}

install_telnet_client:
  dism.feature_installed:
    - name: TelnetClient

{% endif %}
