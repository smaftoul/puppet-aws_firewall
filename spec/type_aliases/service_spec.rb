require 'spec_helper'

describe 'AWS_Firewall::Service' do
  describe 'invalid' do
    %w[
      foo
      ec2
    ].each do |region|
      describe region.inspect do
        it { is_expected.not_to allow_value(region) }
      end
    end
  end

  describe 'valid' do
    %w[
      AMAZON
      CLOUDFRONT
      CODEBUILD
      EC2
      ROUTE53
      ROUTE53_HEALTHCHECKS
      S3
    ].each do |region|
      describe region.inspect do
        it { is_expected.to allow_value(region) }
      end
    end
  end
end
