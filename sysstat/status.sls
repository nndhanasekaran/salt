{% if grains['init'] == 'upstart' %}
sysstat_status:
  cmd.run:
    - name: service sysstat status
{% endif %}

{% if grains['init'] == 'systemd' %}
sysstat_status:
  cmd.run:
    - name: systemctl status sysstat
{% endif %}
