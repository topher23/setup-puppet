# Install PuppetDB

## Add puppetlabds repository

```
  # apt-get update
  ...
  Reading package lists... Done
  W: GPG error: http://apt.puppetlabs.com trusty Release: The following signatures couldn't be verified because the public key is not available: NO_PUBKEY 1054B7A24BD6EC30

  $ wget -qO - https://apt.puppetlabs.com/pubkey.gpg | sudo apt-key add -
  Ok
```


