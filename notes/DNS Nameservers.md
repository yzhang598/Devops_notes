

# Set Permanent DNS Nameservers



## Basic knowledge ##

dns like a phone book for user friendly names

Try to this cmd to lookup the real ip

```bash
nslookup google.com
```

icann: an organization holds all the domains

Request -> dns-server -> get ip

some ip will be Cached locally

TLD -> top level domain (com), sub domain



## Error: Temporary failure in name resolution ##

### Context

```bash
lsb_release -a
No LSB modules are available.
Distributor ID:	Ubuntu
Description:	Ubuntu 20.04.5 LTS
Release:	20.04
Codename:	focal
```

```bash
hostname
k8scp
```

### Solution: change the config file for dns server

```bash
sudo cat /etc/resolv.conf
```

Add 8.8.8.8 which is a goolge dns server:

```bash
nameserver 8.8.8.8
nameserver 8.8.4.4
```

But the file will be overwrited automaticlly.

### Addtionally, we need to set Permanent DNS Nameservers ###

```bash
sudo apt install resolvconf
```

```bash
sudo systemctl start resolvconf.service
sudo systemctl enable resolvconf.service
```

open the **/etc/resolvconf/resolv.conf.d/head** configuration file, add two nameservers

```bash
sudo cat /etc/resolvconf/resolv.conf.d/head
```

```bash
nameserver 8.8.8.8 
nameserver 8.8.4.4
```

restart the service

```bash
systemctl restart resolvconf.service
systemctl restart systemd-resolved.service
```