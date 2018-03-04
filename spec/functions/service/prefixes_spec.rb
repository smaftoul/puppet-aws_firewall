require 'spec_helper'

describe 'aws_firewall::service::prefixes' do
  describe 'ipv4' do
    result = %w[
      13.208.0.0/16
      52.94.249.96/28
      52.95.225.0/24
      52.95.157.0/24
      52.95.158.0/23
    ]

    it do
      is_expected.to run.with_params(
        ['ap-northeast-3'], ['S3', 'EC2'], '4',
      ).and_return(result)
    end
  end

  describe 'ipv6' do
    result = %w[
      2600:9000::/28
      2400:6700:ff00::/64
      2406:da00:4000::/40
      2406:da14::/36
      2406:daff:4000::/40
    ]

    it do
      is_expected.to run.with_params(
        ['GLOBAL', 'ap-northeast-1'], ['CLOUDFRONT', 'EC2'], '6',
      ).and_return(result)
    end
  end

  describe 'no result' do
    it do
      is_expected.to run.with_params(['GLOBAL'], ['AMAZON'], '6').and_return([])
    end
  end
end