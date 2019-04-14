{% from "ssh/map.jinja" import sshd with context %}

{{ sshd.srv }}:
  service.running:
    - enable: True

