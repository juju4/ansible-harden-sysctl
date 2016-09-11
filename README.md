[![Build Status](https://travis-ci.org/juju4/ansible-harden-sysctl.svg?branch=master)](https://travis-ci.org/juju4/ansible-harden-sysctl)
# Linux Kernel settings/sysctl hardening ansible role

Ansible role to harden linux sysctl settings
Please note some sysctl are ignored/removed inside containers because of security restrictions.

## Requirements & Dependencies

### Ansible
It was tested on the following versions:
 * 1.9
 * 2.0

### Operating systems

Tested with vagrant on Ubuntu 14.04, Kitchen test with trusty and centos7

## Example Playbook

Just include this role in your list.
For example

```
- host: all
  roles:
    - harden-sysctl
```

## Variables

```
harden_sysctl_use_forwarding: false

```

## Continuous integration

This role has a travis basic test (for github), more advanced with kitchen and also a Vagrantfile (test/vagrant).
Default kitchen config (.kitchen.yml) is lxd-based, while (.kitchen.vagrant.yml) is vagrant/virtualbox based.

Once you ensured all necessary roles are present, You can test with:
```
$ gem install kitchen-ansible kitchen-lxd_cli kitchen-sync kitchen-vagrant
$ cd /path/to/roles/harden-sysctl
$ kitchen verify
$ kitchen login
$ KITCHEN_YAML=".kitchen.vagrant.yml" kitchen verify
```
or
```
$ cd /path/to/roles/harden-sysctl/test/vagrant
$ vagrant up
$ vagrant ssh
```

## Troubleshooting & Known issues

* centos-6 support in lxc/
for some reason, task 'harden sysctl config - remove (containers)' is only executed correctly on second run and then verified.


## License

BSD 2-clause


