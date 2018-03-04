# Get an array of all AWS services

function aws_firewall::services() >> AWS_Firewall::Services {
  unique(
    flatten(
      aws_firewall::prefixes().map |$region, $services_data| {
        $services_data.map |$service, $ip_data| {
          $service
        }
      }
    )
  )
}
