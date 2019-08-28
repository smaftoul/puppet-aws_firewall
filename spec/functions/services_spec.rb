require 'spec_helper'

describe 'aws_firewall::services' do
  services = %w[
    AMAZON
    CLOUDFRONT
    EC2
    GLOBALACCELERATOR
    ROUTE53
    ROUTE53_HEALTHCHECKS
    DYNAMODB
    S3
    AMAZON_CONNECT
    CLOUD9
    CODEBUILD
    EC2_INSTANCE_CONNECT
    WORKSPACES_GATEWAYS
  ]

  it do
    is_expected.to run.and_return(services)
  end
end
