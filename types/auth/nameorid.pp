# Match an user or a group name or ID.
#
type AWS_Firewall::Auth::NameOrID = Variant[
  AWS_Firewall::Auth::Name,
  AWS_Firewall::Auth::ID,
]
