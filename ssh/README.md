# ssh

## use
To manage the ssh package, service and configuration for linux servers.

## usage
> sudo salt \<target> state.apply ssh
	
## details
It will install ssh package, start sshd service and change the configuration based on pillars. 

Even though the ssh package is installed and service started from templates, this module ensure those before changing the configurations. 

The main purpose is to change/control the sshd parameters based on customer requirement. The default ssh settings are declared in pillar/default.sls (which is NOT recommended by many customers/PCI, but Basis team to login as root). 

The default settings can be override by updating the parameter and its values in /srv/pillar/ssh/RID.sls. This gives flexibility to change the ssh parameters based on customer requirements. Even though, the default pillar contains only few parameters, we can change any sshd parameters. /srv/pillar/ssh/A0DF.sls contains PCI recommended settings, copy A0DF.sls to any customer to implement PCI recommended ssh settings. 

This module uses augeas configuration management tool to change the parameters. So this module will install python-augeas package additionally.

**Examples: (Pillar)**

```sh
/srv/pillar/default.sls
--------------------------------
ssh:
  PermitRootLogin: 'yes'
  PubkeyAuthentication: 'yes'
  PasswordAuthentication: 'yes'
```
--------------------------------

Customer based specific setting under /srv/pillar/ssh/\<RID>.sls

```sh
/srv/pillar/ssh/A0DF.sls
--------------------------------
ssh:
  Protocol: '2'
  MaxAuthTries: '4'
  IgnoreRhosts: 'yes'
  X11Forwarding: 'no'
  LoginGraceTime: '60'
  Banner: '/etc/issue'
  PermitRootLogin: 'no'
  ClientAliveCountMax: '0'
  ClientAliveInterval: '300'
  PermitEmptyPasswords: 'no'
  PubkeyAuthentication: 'yes'
  PermitUserEnvironment: 'no'
  PasswordAuthentication: 'yes'
  HostbasedAuthentication: 'no'
 ```
--------------------------------

For A0DF customer, the PermitRootLogin will taken from A0DF.sls file (that is 'no') not from default.sls

## compatiable and tested
* RHEL
* SLES
