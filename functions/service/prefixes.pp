# Get AWS IP prefixes for requested regions and services

function aws_firewall::service::prefixes(
  AWS_Firewall::Regions $regions,
  AWS_Firewall::Services $services,
  Enum['4', '6'] $ip_version,
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
