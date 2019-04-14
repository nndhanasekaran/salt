## To collect the current status of keyboard language details 

{% if salt.grains.get('kernel') == 'Linux' %}
locale_keyboard_status:
  module.run:
    - name: locale.get_locale
{% endif %}

{% if salt.grains.get('kernel') == 'Windows' %}
locale_keyboard_status:
  cmd.run:
    - name: get-WinUserLanguageList 
    - shell: powershell
    - runas: Administrator
    - password: {{ pillar.windows.adm_pwd }}
{% endif %}
