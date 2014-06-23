# Install PuppetDB

## Add puppetlabds repository

```
  # sudo nano /etc/apt/sources.list
```

and in  the file should add

```
  # Puppetlabs devel (uncomment to activate)
  deb http://apt.puppetlabs.com trusty main
  # deb-src http://apt.puppetlabs.com precise devel
```

then continue with

```
  # apt-get update
  ...
  Reading package lists... Done
  W: GPG error: http://apt.puppetlabs.com trusty Release: The following signatures couldn't be verified because the public key is not available: NO_PUBKEY 1054B7A24BD6EC30

  $ wget -qO - https://apt.puppetlabs.com/pubkey.gpg | sudo apt-key add -
  Ok
  
  # apt-get update && apt-get upgrade

  # puppet resource package puppetdb ensure=latest
  ... and wait
  ... and wait
  
```


then start puppetdb

```bash
sudo puppet resource service puppetdb ensure=running enable=true
```

## Check if puppetmaster is connected to puppetdb

```
$ sudo puppet config print confdir
/etc/puppet

```

edit puppetdb.conf and puppet.conf


stop puppetqd

```
$ sudo service puppetqd stop
```

disable puppetqd

```
$ sudo update-rc.d puppetqd disable
```

test puppet configs

```bash
puppet master --configprint all
```

don't forget that prerequisites are:
* lsb-release
* puppetdb-terminus






