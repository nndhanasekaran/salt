# sysstat
Install and start sysstat service for Linux servers.

```
Owner: Professional Services
Version: 1.0
Last Update: 26 Jan 2019
Module: sysstat
```
### USAGE:
sysstat package and service is required to collect the 7 days history of CPU/RAM/Disk IO status.
By default sysstat will store every 10mins data of hardware resources for 7 days. Recommended by SAP.

sudo salt <tgt> state.apply sysstat

Use below states to apply individually.
```
sudo salt <tgt> state.sls sysstat/start
sudo salt <tgt> state.sls sysstat/status
sudo salt <tgt> state.sls sysstat/stop
```

### Revision changes:
```
v1.0 - Inital Script.
```
