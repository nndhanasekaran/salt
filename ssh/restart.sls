{% from "ssh/map.jinja" import sshd with context %}

{{ sshd.srv }}:
  module.run:
    - name: service.restart
    - m_name: {{ sshd.srv }}

