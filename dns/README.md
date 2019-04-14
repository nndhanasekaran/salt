# dns

## Use:
Add DNS servers in the /etc/resolv.conf for Unix servers & in registry for Windows Machines. 

## Usage:
Make sure customer DNS Server IPs are updated in grains or in pillars (pillar/rids/<RID>.sls). 
If grains are missing, the module will set 2 default public DNS servers, **8.8.8.8** and **8.8.4.4**, which are defined in pillar/defaults.sls.
Currently, it is possible to manage 3 DNS servers.

> sudo salt \<tgt> grains.setval 'DNS Server 1' '100.160.160.160'  (optional)

> sudo salt \<tgt> grains.setval 'DNS Server 2' '200.160.160.160'  (optional)

> sudo salt \<tgt> grains.setval 'Domain Name' 'xstream360.cloud'  (optional)

> sudo salt \<tgt> state.apply dns

## Details:
For windows machines, this module will use "win_dns_client.dns_exists" function and set the DNS servers in registry for 1st interface. 

For unix server, it will update /etc/resolv.conf from template. We can set one Domain Name, 3 DNS Servers and optionals in grainsi/pillar and run. 
By default it will set "local" as search domain, "8.8.8.8 & 8.8.4.4" as name servers if no grains. 
But it will not set default domain and options. 

## Depedency:
Grains
/srv/salt/dns/resolv.conf

## Compatiable and tested
* RHEL
* SLES
* Windows
