type AWS_Firewall::Prefixes = Hash[
  AWS_Firewall::Region,
  Hash[
    AWS_Firewall::Service,
    Hash[
      AWS_Firewall::IP_Version,
      Variant[
        Array[IP::Address::V4::CIDR],
        Array[IP::Address::V6],
      ],
      2,  # Min size
      2,  # Max size
    ],
  ],
]
