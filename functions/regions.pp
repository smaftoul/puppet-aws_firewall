# Get an array of all available AWS regions.
#
# @return [AWS_Firewall::Regions] Array of all available AWS regions
#
function aws_firewall::regions() >> AWS_Firewall::Regions {
  unique(
    flatten(
      aws_firewall::prefixes().map |$region, $services_data| {
        $region
      }
    )
  )
}
