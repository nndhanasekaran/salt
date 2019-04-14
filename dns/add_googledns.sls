{% if grains['kernel'] == 'Linux' %}

dns_add_gdns_script:
  file.managed:
    - name: /etc/salt/add_gdns.sh
    - source: salt://dns/files/add_gdns.sh
    - mode: 775
    - template: jinja

dns_add_gdns_run:
  cmd.run:
    - name: sh /etc/salt/add_gdns.sh
    - require:
        - file: dns_add_gdns_script

dns_add_gdns_remove:
  file.absent:
    - name: /etc/salt/add_gdns.sh

{% endif %}
