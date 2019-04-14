# ntp

## use:
Add NTP servers in the ntp.conf on Unix & in registry on Windows Machines. 

## usage:
It will set the customer provided NTP servers (Max 4). Those servers should be in grains. 

If grains are missing, it will set default NTP servers based on the OS. 

Additionally it will make sure ntp package is installed and service is started in unix.

> sudo salt \<tgt> state.apply ntp

## details
For windows, this state will use ntp.managed function and set the NTP servers. If customer has not specified any NTP servers, it will set **time.windows.com** as a default one. 

For RHEL servers, this will use ntp_rhel.conf template to set the NTP servers and manage the package and service. It will set **0.pool.ntp.org** and **1.pool.ntp.org** as default ntp servers, if not provided.

For Suse servers, this will use ntp_suse.conf template to set the NTP servers and manage the package and service. It will set **0.pool.ntp.org** and **1.pool.ntp.org** as default ntp servers, if not provided.

Maximum, 4 NTP servers can be managed from this module.

### DEPENDENCY:
Grains
/srv/salt/ntp/ntp_rhel.conf
/srv/salt/ntp/ntp_suse.conf

## Compatiable and tested on
* RHEL
* SLES
* Windows
