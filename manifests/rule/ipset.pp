# Create an ipset-based rule allowing access to selected AWS services.
#
# @param ipset The ipset used by the firewall rule
# @param chain The iptables chain in which the rule will be created
# @param source The source host or network
# @param uid The UID or username
# @param gid The GID or group
# @param action The rule accept
#
# @example Explicit creation of the IP set:
#   aws_firewall::ipset { 'us-east-1-s3':
#     regions  => ['us-east-1'],
#     services => ['S3'],
#   }
#   aws_firewall::rule::ipset { '200 Allow access to S3 in us-east-1':
#     ipset => 'us-east-1-s3',
#   }
#
# @example Implicit creation of the IP set:
#   aws_firewall::rule::ipset { '200 Allow access to S3 in us-east-1':
#     ipset => {
#       'us-east-1-s3' => {
#         regions  => ['us-east-1'],
#         services => ['S3'],
#       },
#     },
#   }
#
define aws_firewall::rule::ipset(
  Variant[AWS_Firewall::IPSet::Name, AWS_Firewall::IPSet::Data] $ipset,
  Enum['OUTPUT', 'FORWARD'] $chain,
  Optional[IP::Address::V4] $source = undef,
  Optional[AWS_Firewall::Auth::NameOrID] $uid = undef,
  Optional[AWS_Firewall::Auth::NameOrID] $gid = undef,
  Enum['accept', 'drop'] $action = 'accept',
) {

  # We don't need a default case, thanks to typing.
  # lint:ignore:case_without_default
  case $ipset {
    AWS_Firewall::IPSet::Data: {
      create_resources(aws_firewall::ipset, $ipset)
      $ipset_name = keys($ipset)[0]
    }
    AWS_Firewall::IPSet::Name: {
      $ipset_name = $ipset
    }
  }
  # lint:endignore

  firewall { $title:
    chain    => $chain,
    uid      => $uid,
    gid      => $gid,
    source   => $source,
    ipset    => "${ipset_name} dst",
    dport    => 443,
    proto    => 'tcp',
    state    => 'NEW',
    action   => $action,
    provider => 'iptables',
    require  => Aws_firewall::Ipset[$ipset_name],
  }

}
