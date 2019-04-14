{% from "dns/map.jinja" import dns_server_1,dns_server_2,dns_server_3,dns_domain with context %}

## DNS entry in /etc/hosts file of Linux server

resolv_file:
  file.managed:
    - name: /etc/resolv.conf
    - user: root
    - group: root
    - mode: '0644'
    - source: salt://dns/files/resolv.conf
    - template: jinja
    - defaults:
        nameserver1: {{ dns_server_1 }}
        nameserver2: {{ dns_server_2 }}
        nameserver3: {{ dns_server_3 }}
        searchpaths: {{ dns_domain }}
        domain: {{ dns_domain }}
        options: {{ salt['grains.get']('DNS_Options', []) }}
