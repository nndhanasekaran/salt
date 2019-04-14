{% if grains['kernel'] == 'Linux' %}

dns_rm_gdns_script:
  file.managed:
    - name: /etc/salt/rm_gdns.sh
    - source: salt://dns/files/rm_gdns.sh
    - mode: 775
    - template: jinja

dns_rm_gdns_run:
  cmd.run:
    - name: sh /etc/salt/rm_gdns.sh
    - require:
        - file: dns_rm_gdns_script

dns_rm_gdns_remove:
  file.absent:
    - name: /etc/salt/rm_gdns.sh

{% endif %}
