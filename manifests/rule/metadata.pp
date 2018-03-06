# aws_firewall::rule::metadata
#
# Create an OUTPUT firewall rule allowing access to AWS instance metadata.
#
# @example
#   aws_firewall::rule::metadata { '200 Allow access to EC2 instance metadata':
#     uid => 4242,
#   }
#
define aws_firewall::rule::metadata (
  Optional[AWS_Firewall::Auth::NameOrID] $uid = undef,
  Optional[AWS_Firewall::Auth::NameOrID] $gid = undef,
  Enum['accept', 'drop'] $action = 'accept',
) {
  firewall { $title:
    chain       => 'OUTPUT',
    uid         => $uid,
    gid         => $gid,
    destination => '169.254.169.254',
    dport       => 80,
    proto       => 'tcp',
    state       => 'NEW',
    action      => $action,
    provider    => 'iptables',
  }
}
