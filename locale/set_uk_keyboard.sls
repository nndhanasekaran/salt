{% if salt.grains.get('kernel') == 'Linux' %}
## Set keyboard layout for the current session
locale_set_uk_keyboard:
  locale.present:
    - name: en_GB.UTF-8

## Set system level default keyboard layout.
locale_set_uk_keyboard_default_locale:
  locale.system:
    - name: en_GB.UTF-8
    - require:
      - locale: locale_set_uk_keyboard
{% endif %}


{% if salt.grains.get('kernel') == 'Windows' %}
locale_keyboard_status:
  cmd.run:
    - name: Set-WinUserLanguageList -Force 'en-GB'
    - shell: powershell
    - runas: Administrator
    - password: {{ pillar.windows.adm_pwd }}
{% endif %}
