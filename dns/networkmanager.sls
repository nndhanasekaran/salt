## NetworkManger is creating problem for RHEL DNS entry. So disabling it.
NetworkManager:
  service.dead:
    - enable: False
