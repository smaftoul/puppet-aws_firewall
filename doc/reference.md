# Reference

## Defined types
* [`aws_firewall::ipset`](#aws_firewallipset): Create an IP set containing selected AWS IP networks.
* [`aws_firewall::rule::ipset`](#aws_firewallruleipset): Create an ipset-based rule allowing access to selected AWS services.
* [`aws_firewall::rule::metadata`](#aws_firewallrulemetadata): Create an OUTPUT firewall rule allowing access to AWS instance metadata.
## Functions
* [`aws_firewall::prefixes`](#aws_firewallprefixes): Load AWS prefixes data from Hiera
* [`aws_firewall::region::current`](#aws_firewallregioncurrent): Get the AWS region in which the node is running.
* [`aws_firewall::regions`](#aws_firewallregions): Get an array of all available AWS regions.
* [`aws_firewall::service::prefixes`](#aws_firewallserviceprefixes): Get AWS IP prefixes for requested regions and services.
* [`aws_firewall::services`](#aws_firewallservices): Get an array of all AWS services.
## Defined types

### aws_firewall::ipset

Create an IP set containing selected AWS IP networks.

#### Examples
##### 
```puppet
aws_firewall::ipset { 'ap-south-1-s3':
  regions  => ['ap-south-1'],
  services => ['S3'],
}
```


#### Parameters

The following parameters are available in the `aws_firewall::ipset` defined type.

##### `regions`

Data type: `AWS_Firewall::Regions`

AWS regions matched by the ipset

##### `services`

Data type: `AWS_Firewall::Services`

AWS services matched by the ipset

##### `ip_version`

Data type: `AWS_Firewall::IP_Version`

AWS prefixes matched by the ipset (IPv4 or IPv6)

Default value: 4

##### `ensure`

Data type: `Enum['present', 'absent']`

Determine whether the ipset must be created or deleted

Default value: 'present'


### aws_firewall::rule::ipset

Create an ipset-based rule allowing access to selected AWS services.

#### Examples
##### Explicit creation of the IP set:
```puppet
aws_firewall::ipset { 'us-east-1-s3':
  regions  => ['us-east-1'],
  services => ['S3'],
}
aws_firewall::rule::ipset { '200 Allow access to S3 in us-east-1':
  ipset => 'us-east-1-s3',
}
```

##### Implicit creation of the IP set:
```puppet
aws_firewall::rule::ipset { '200 Allow access to S3 in us-east-1':
  ipset => {
    'us-east-1-s3' => {
      regions  => ['us-east-1'],
      services => ['S3'],
    },
  },
}
```


#### Parameters

The following parameters are available in the `aws_firewall::rule::ipset` defined type.

##### `ipset`

Data type: `Variant[AWS_Firewall::IPSet::Name, AWS_Firewall::IPSet::Data]`

The ipset used by the firewall rule

##### `chain`

Data type: `Enum['OUTPUT', 'FORWARD']`

The iptables chain in which the rule will be created

##### `source`

Data type: `Optional[IP::Address::V4]`

The source host or network

Default value: `undef`

##### `uid`

Data type: `Optional[AWS_Firewall::Auth::NameOrID]`

The UID or username

Default value: `undef`

##### `gid`

Data type: `Optional[AWS_Firewall::Auth::NameOrID]`

The GID or group

Default value: `undef`

##### `action`

Data type: `Enum['accept', 'drop']`

The rule accept

Default value: 'accept'


### aws_firewall::rule::metadata

Create an OUTPUT firewall rule allowing access to AWS instance metadata.

#### Examples
##### 
```puppet
aws_firewall::rule::metadata { '200 Allow access to EC2 instance metadata':
  uid => 4242,
}
```


#### Parameters

The following parameters are available in the `aws_firewall::rule::metadata` defined type.

##### `uid`

Data type: `Optional[AWS_Firewall::Auth::NameOrID]`

The UID or username

Default value: `undef`

##### `gid`

Data type: `Optional[AWS_Firewall::Auth::NameOrID]`

The GID or group

Default value: `undef`

##### `action`

Data type: `Enum['accept', 'drop']`

The rule accept

Default value: 'accept'


## Functions

### aws_firewall::prefixes
Type: Puppet Language

Load AWS prefixes data from Hiera

#### `aws_firewall::prefixes()`

Load AWS prefixes data from Hiera

Returns: `AWS_Firewall::Prefixes` All AWS prefixes data

### aws_firewall::region::current
Type: Puppet Language

Get the AWS region in which the node is running.

#### `aws_firewall::region::current()`

Get the AWS region in which the node is running.

Returns: `AWS_Firewall::Region` An AWS region identifier

### aws_firewall::regions
Type: Puppet Language

Get an array of all available AWS regions.

#### `aws_firewall::regions()`

Get an array of all available AWS regions.

Returns: `AWS_Firewall::Regions` Array of all available AWS regions

### aws_firewall::service::prefixes
Type: Puppet Language

Get AWS IP prefixes for requested regions and services.

#### `aws_firewall::service::prefixes(AWS_Firewall::Regions $regions, AWS_Firewall::Services $services, AWS_Firewall::IP_Version $ip_version = 4)`

Get AWS IP prefixes for requested regions and services.

Returns: `Variant[Array[IP::Address::V4::CIDR], Array[IP::Address::V6]]` Array of IP prefixes

##### `regions`

Data type: `AWS_Firewall::Regions`

AWS regions matched by the ipset

##### `services`

Data type: `AWS_Firewall::Services`

AWS services matched by the ipset

##### `ip_version`

Data type: `AWS_Firewall::IP_Version`

AWS prefixes matched by the ipset (IPv4 or IPv6)

### aws_firewall::services
Type: Puppet Language

Get an array of all AWS services.

#### `aws_firewall::services()`

Get an array of all AWS services.

Returns: `AWS_Firewall::Services` All available AWS services

