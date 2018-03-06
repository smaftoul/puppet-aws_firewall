type AWS_Firewall::IPSet::Data = Hash[
  AWS_Firewall::IPSet::Name,
  Struct[{
    Optional[regions]    => AWS_Firewall::Regions,
    Optional[services]   => AWS_Firewall::Services,
    Optional[ip_version] => AWS_Firewall::IP_Version,
  }],
  # Min size
  1,
  # Max size
  1,
]
