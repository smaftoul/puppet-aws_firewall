# Get the AWS region in which the node is running

function aws_firewall::region::current() >> AWS_Firewall::Region {
  $facts['ec2_metadata']['placement']['availability-zone'][0,-2]
}
