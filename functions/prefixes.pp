# Load AWS prefixes data from Hiera
#
# @return [AWS_Firewall::Prefixes] All AWS prefixes data
#
function aws_firewall::prefixes() >> AWS_Firewall::Prefixes {
  lookup('aws_firewall::prefixes', AWS_Firewall::Prefixes)
}
