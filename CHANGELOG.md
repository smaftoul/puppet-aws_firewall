# Changelog

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
