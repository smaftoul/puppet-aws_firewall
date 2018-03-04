# Load AWS prefixes from Hiera

function aws_firewall::prefixes() >> AWS_Firewall::Prefixes {
  lookup('aws_firewall::prefixes', AWS_Firewall::Prefixes)
}
