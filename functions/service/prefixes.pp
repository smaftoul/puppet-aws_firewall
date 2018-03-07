# Get AWS IP prefixes for requested regions and services.
#
# @param regions AWS regions matched by the ipset
# @param services AWS services matched by the ipset
# @param ip_version AWS prefixes matched by the ipset (IPv4 or IPv6)
# @return [Variant[Array[IP::Address::V4::CIDR], Array[IP::Address::V6]]]
#   Array of IP prefixes
#
function aws_firewall::service::prefixes(
  AWS_Firewall::Regions $regions,
  AWS_Firewall::Services $services,
  AWS_Firewall::IP_Version $ip_version = 4,
) >> Variant[Array[IP::Address::V4::CIDR], Array[IP::Address::V6]] {
  delete_undef_values(
    unique(
      flatten(
        aws_firewall::prefixes().map |$region, $services_data| {
          if $region in $regions {
            $services_data.map |$service, $ip_data| {
              if $service in $services {
                $ip_data[$ip_version]
              }
            }
          }
        }
      )
    )
  )
}
