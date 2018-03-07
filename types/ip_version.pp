# Match an IP version.
#
type AWS_Firewall::IP_Version = Variant[
  Integer[4, 4],
  Integer[6, 6],
]
