{% from "ssh/map.jinja" import sshd with context %}

##sshd pacakge installation.
{{ sshd.pkg }}:
  pkg.installed

##Python augeas package is required to get augeas lens.
{{ sshd.augpkg }}:
  pkg.installed
