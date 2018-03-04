require 'spec_helper'

describe 'aws_firewall::services' do
  services = %w[
    AMAZON
    CLOUDFRONT
    ROUTE53
    CODEBUILD
    EC2
    ROUTE53_HEALTHCHECKS
    S3
  ]

  it do
    is_expected.to run.and_return(services)
  end
end
