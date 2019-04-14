{% if grains['kernel'] == 'Linux' %}
include:
  - .set
{% endif %}
