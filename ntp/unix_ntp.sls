{% from "ntp/map.jinja" import ntp with context %}

ntp:
  pkg.installed:
    - name: {{ ntp.client }}

ntp_conf:
  file.managed:
    - name: {{ ntp.ntp_conf }}
    - source: {{ ntp.ntp_conf_src }}
    - require:
      - pkg: {{ ntp.client }}
    - template: jinja
    - defaults:
        ntpserver1: {{ salt['grains.get']('NTP_Server_1', '0.pool.ntp.org') }}
        ntpserver2: {{ salt['grains.get']('NTP_Server_2', '1.pool.ntp.org') }}
        ntpserver3: {{ salt['grains.get']('NTP_Server_3') }}
        ntpserver4: {{ salt['grains.get']('NTP_Server_4') }}

ntp_running:
  service.running:
    - name: {{ ntp.service }}
    - enable: True
    - watch:
      - file: {{ ntp.ntp_conf }}
