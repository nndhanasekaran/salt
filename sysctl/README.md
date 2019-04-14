# sysctl

## USE:
This module helps to manage the sysctl parameters for Linux servers.

## USAGE:
sudo salt <target> state.apply sysctl
	
## DETAILS:

The default sysctl parameters for SAP HANA & SAP Application servers are decleared in pillar/default.sls (which is recommended for most of the customers). The default settings can be override by keeping the values in pillar/sysctl/RID.sls. We can give different value for same parameter or new parameters in the pillar/sysctl/RID.sls, which has high priority. 

Examples: (Pillar)

/srv/pillar/default.sls
--------------------------------
```sh
{% if salt.grains.get('Server_Type') == 'HANA' %}
sysctl:
  net.core.somaxconn: '4096'
  net.core.rmem_default: '262144'
  net.core.wmem_max: '8388608'
  net.core.wmem_default: '262144'
  net.core.rmem_max: '8388608'
  net.ipv4.tcp_rmem: '4096 87380 8388608'
  net.ipv4.tcp_wmem: '4096 65536 8388608'
  net.ipv4.tcp_mem: '8388608 8388608 8388608'
  net.ipv4.tcp_slow_start_after_idle: '0'
  net.ipv4.tcp_max_syn_backlog: '8192'
  net.ipv4.tcp_syn_retries: '8'
  net.ipv4.tcp_timestamps: '1'
{% endif %}
{% if salt.grains.get('Server_Type') == 'App' %}
sysctl:
  kernel.sem: '1250 256000 100 1024'
  kernel.pid_max: '1638'
  fs.file-max: '204708'
  vm.max_map_count: '2000000'
{% endif %}
```

/srv/pillar/ssh/TN2J.sls
--------------------------------
```sh
{% if salt.grains.get('Server_Type') == 'HANA' %}
sysctl:
  ##As per 2534844 - Indexserver Crash During Startup due to Insufficient Shared Memory Segment.
  kernel.shmmni: '32768'
  kernel.shmall: '1152921504606846720'
  kernel.shmmax: '18446744073709551615'
  ##As per 900929 - Linux: STORAGE_PARAMETERS_WRONG_SET
  vm.max_map_count: '2147483647'
{% endif %}

```

For TN2J customer, additional 4 parameters will be applied. We can override the parameters which is mentioned in the defaults.sls also.

