{% for param, value in pillar.get('sysctl', {}).items() %}

{{ param }}:
  sysctl.present:
    - value: {{ value }}

sysctl_set_remove_{{ param }}_from_sysctl.conf:
  cmd.run:
    - name: sed -i '/{{ param }}/d' /etc/sysctl.conf 
    - onlyif: grep {{ param }} /etc/sysctl.conf

{% endfor %}

sysctl_set_refresh:
  cmd.run:
    - name: sysctl -p

