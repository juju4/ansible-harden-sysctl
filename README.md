[![Build Status - Master](https://travis-ci.org/juju4/ansible-harden-sysctl.svg?branch=master)](https://travis-ci.org/juju4/ansible-harden-sysctl)
[![Build Status - Devel](https://travis-ci.org/juju4/ansible-harden-sysctl.svg?branch=devel)](https://travis-ci.org/juju4/ansible-harden-sysctl/branches)
# Linux Kernel settings/sysctl hardening ansible role

Ansible role to harden linux sysctl settings
Please note some sysctl are ignored/removed inside containers because of security restrictions.

## Requirements & Dependencies

### Ansible
It was tested on the following versions:
 * 1.9
 * 2.0
 * 2.3
 * 2.4

### Operating systems

Tested with vagrant on Ubuntu 14.04, Kitchen test with trusty and centos7

## Example Playbook

Just include this role in your list.
For example

```
- host: all
  roles:
    - juju4.harden-sysctl
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
$ cd /path/to/roles/juju4.harden-sysctl
$ kitchen verify
$ kitchen login
$ KITCHEN_YAML=".kitchen.vagrant.yml" kitchen verify
```
or
```
$ cd /path/to/roles/juju4.harden-sysctl/test/vagrant
$ vagrant up
$ vagrant ssh
```

## Troubleshooting & Known issues

* centos-6 support in lxc/
for some reason, task 'harden sysctl config - remove (containers)' is only executed correctly on second run and then verified.

* IPv6 sysctl settings have been moved to role juju4.ipv6

## License

BSD 2-clause

