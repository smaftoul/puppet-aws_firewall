type AWS_Firewall::Prefixes = Hash[
  AWS_Firewall::Region,
  Hash[
    AWS_Firewall::Service,
    Struct[{
      '4' => Array[IP::Address::V4::CIDR],
      '6' => Array[IP::Address::V6],
    }],
  ],
]
