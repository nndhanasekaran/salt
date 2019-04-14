##The ssh parameters are from pillars. The default parameters are in default.sls pillar file and 
##those values can be override by creating file inside pillar/ssh/<RID>.sls. 
##It is possible to change any parameter eventhough it is not listed in default parameters. 
##The RID.sls file under pillar/ssh/ is precedence over default.sls
{% for param, value in pillar.get('ssh', {}).items() %}

{{ param }}:
  augeas.change:
    - lens: sshd.lns
    - context: /files/etc/ssh/sshd_config
    - changes:
      - set {{ param }} {{ value }}

{% endfor %}

