{% if salt.grains.get('kernel') == 'Linux' %}
## Set keyboard layout for the current session
locale_set_us_keyboard:
  locale.present:
    - name: en_US.UTF-8

## Set system level default keyboard layout.
locale_set_us_keyboard_default_locale:
  locale.system:
    - name: en_US.UTF-8
    - require:
      - locale: locale_set_us_keyboard
{% endif %}

{% if salt.grains.get('kernel') == 'Windows' %}
locale_keyboard_status:
  cmd.run:
    - name: Set-WinUserLanguageList -Force 'en-US'
    - shell: powershell
    - runas: Administrator
    - password: {{ pillar.windows.adm_pwd }}
{% endif %}
