##ssh service is only for Linux servers. 
##Eventhough package and service comes from templates by default, we added here to make sure for future.

{% if salt.grains.get('kernel') == 'Linux' %}
include:
  - .pkgs
  - .config
  - .start
{% endif %}
