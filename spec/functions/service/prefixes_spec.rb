require 'spec_helper'

describe 'aws_firewall::service::prefixes' do
  [
    ['implicit', [%w[ap-northeast-3], %w[S3 EC2]]],
    ['explicit', [%w[ap-northeast-3], %w[S3 EC2], 4]],
  ].each do |type, arguments|
    result = %w[
      13.208.0.0/16
      52.94.249.96/28
      52.95.225.0/24
      52.95.157.0/24
      52.95.158.0/23
    ]

    context "ipv4 - #{type}" do
      it { is_expected.to run.with_params(*arguments).and_return(result) }
    end
  end

  context 'ipv6' do
    result = %w[
      2600:9000::/28
      2400:6700:ff00::/64
      2406:da00:4000::/40
      2406:da14::/36
      2406:daff:4000::/40
    ]

    it do
      is_expected.to run.with_params(
        %w[GLOBAL ap-northeast-1], %w[CLOUDFRONT EC2], 6
      ).and_return(result)
    end
  end

  describe 'no result' do
    it do
      is_expected.to run.with_params(%w[GLOBAL], %w[AMAZON], 6).and_return([])
    end
  end
end
