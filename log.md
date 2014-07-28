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

From [here](http://docs.puppetlabs.com/guides/install_puppet/install_debian_ubuntu.html)

```
 sudo apt-get install puppetmaster-passenger
 sudo apt-get install puppetmaster
 sudo apt-get update
 sudo puppet resource package puppet ensure=latest
```

_Note:_ Ignore the warning:

```
Warning: Setting templatedir is deprecated. See http://links.puppetlabs.com/env-settings-deprecations
   (at /usr/lib/ruby/vendor_ruby/puppet/settings.rb:1095:in `block in issue_deprecations')
```

```
sudo service puppetmaster restart
```

Edit the conf file with these options underneath master:
```
dns_alt_names = puppet, master.local, keg.swift.com
```
and these options underneath agent (add agent section if one if not there):
```
runinterval=30s
```

## Check puppet version

```bash
$ puppet --version
$ sudo reboot
```

Read later:
 * http://docs.puppetlabs.com/puppet/latest/reference/config_about_settings.html
 * http://docs.puppetlabs.com/puppet/latest/reference/config_file_main.html
 * http://docs.puppetlabs.com/guides/install_puppet/upgrading.html

## Install puppetdb

```bash
 sudo puppet resource package puppetdb ensure=latest
 sudo puppet resource service puppetdb ensure=running enable=true
 sudo puppet resource package puppetdb-terminus ensure=latest
```

continue with [official docs](http://docs.puppetlabs.com/puppetdb/2.1/connect_puppet_master.html)

Be aware that these 2 configurations show different things:

```
 puppet master --configprint route_file
 puppet config print route_file
```

next need to sign certificates of agent with master. Turn on agent for the first time and that should automatically submit a certificate to be signed on the master. on the master type

```
sudo puppet cert --list
```
this will list all the agents who sent a signature request. Then type:
```
sudo puppet cert --sign <NAME_OF_MACHINE_YOU_ARE_SIGNING>
```
 
Next step is to test the connection to see if it is working. On the agent type:
```
sudo puppet agent -t
```

If the result is all green, Success! Now time to configure/set up puppetboard
First step is to install puppetboard through pip.
```


# Graphs

* https://developers.google.com/chart/interactive/docs/gallery/orgchart



