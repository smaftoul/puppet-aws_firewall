# aws_firewall::ipset
#
# Create an IP set containing selected AWS IP networks.
#
# @example
#   aws_firewall::ipset { 'ap-south-1-s3':
#     regions  => ['ap-south-1'],
#     services => ['S3'],
#   }
#
define aws_firewall::ipset(
  AWS_Firewall::Regions $regions,
  AWS_Firewall::Services $services,
  AWS_Firewall::IP_Version $ip_version = 4,
  Enum['present', 'absent'] $ensure = 'present',
) {
  ipset { $title:
    ensure => $ensure,
    set    => aws_firewall::service::prefixes($regions, $services, $ip_version),
    type   => 'hash:net',
  }
}
