##sysstat package and service is required to collect the 7 days history of CPU/RAM/Disk IO status. 
##By default sysstat will store every 10mins data of hardware resources for 7 days.
##Recommended by SAP. 

{% if grains['kernel'] == 'Linux' %}
include:
  - sysstat.install
  - sysstat.start
{% endif %}
