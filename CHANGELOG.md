# Changelog

## Release 0.5.1 - 2020-11-12

* Update IP prefixes using ip-ranges.json "2020-11-11-21-11-10"

## Release 0.5.0 - 2020-01-30

* Accept puppetlabs/firewall module < 3.0.0

## Release 0.4.1 - 2019-08-28

* Update dpl to fix automated deployment of new releases to Puppet Forge

## Release 0.4.0 - 2019-08-28

* Update tests following data update

## Release 0.3.0 - 2019-08-26

* Update IP prefixes using ip-ranges.json "2019-08-22-23-13-05"

## Release 0.2.0

* Depend on [pmuller/ipset](https://forge.puppet.com/pmuller/ipset) >= 0.6.0
* Use modern facts
* 100% test coverage

## Release 0.1.10

* Add tags to package metadata

## Release 0.1.9

* Fix Puppet Forge deployment
  (see https://github.com/travis-ci/dpl/issues/772)

## Release 0.1.8

* Remove support for passing ipset as a resource reference in
  ``aws_firewall::rule::ipset``

## Release 0.1.7

* Support Puppet starting at version 4.10

## Release 0.1.6

* Fix documentation URLs in README

## Release 0.1.5

* Try automated push to Puppet Forge with ``git push master --tags``

## Release 0.1.4

* Try automated push to Puppet Forge after removing branch restrictions

## Release 0.1.3

* Try automated push to Puppet Forge with "all_branches: true"

## Release 0.1.2

* Try to push tags first to trigger automatic deployment on Puppet Forge

## Release 0.1.1

* Enable automatic deployment of new releases on Puppet Forge

## Release 0.1.0

* First release
