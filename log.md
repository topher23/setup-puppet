# Prepare system

_For some reason, there is no way to upgrade from the puppet installed from Ubuntu repo to the puppetlabs repo._

```bash
sudo apt-get update 
sudo apt-get dist-upgrade
sudo reboot
```

# Install puppet

## Prerequisites

```bash
sudo apt-get install ntp
```

edit the ntp config

```
 sudo nano /etc/ntp.conf
```

and put (instead of default ubuntu ones):

```
  server 0.north-america.pool.ntp.org
  server 1.north-america.pool.ntp.org
  server 2.north-america.pool.ntp.org
  server 3.north-america.pool.ntp.org
```
	
restart ntp and test it:

```bash
$ sudo service ntp restart
$ ntpq -p
     remote           refid      st t when poll reach   delay   offset  jitter
==============================================================================
 propjet.latt.ne 241.199.164.101  2 u   45   64    1   80.627   30.535   0.000
 y.ns.gin.ntt.ne 128.4.1.1        2 u   44   64    1    8.471   30.685   0.000
 50.7.72.4       128.138.141.172  2 u   43   64    1   75.547   25.041   0.000
 ocelot.fsck.ca  200.98.196.212   2 u   42   64    1   14.784   33.454   0.000
 juniperberry.ca 193.79.237.14    2 u   41   64    1   83.233   33.874   0.000
```

# Install puppet

From [here http://docs.puppetlabs.com/guides/install_puppet/install_debian_ubuntu.html]

```
 sudo apt-get install puppetmaster-passenger
```




