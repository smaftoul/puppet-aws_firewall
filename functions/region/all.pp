# Get an array of all available AWS regions

function aws_firewall::region::all() >> AWS_Firewall::Regions {
  unique(
    flatten(
      aws_firewall::prefixes().map |$region, $services_data| {
        $region
      }
    )
  )
}
