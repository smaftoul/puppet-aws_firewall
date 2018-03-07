# Get the AWS region in which the node is running.
#
# @return [AWS_Firewall::Region] An AWS region identifier
#
function aws_firewall::region::current() >> AWS_Firewall::Region {
  $facts['ec2_metadata']['placement']['availability-zone'][0,-2]
}
