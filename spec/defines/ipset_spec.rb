require 'spec_helper'

describe 'aws_firewall::ipset' do
  params = {
    regions: ['ap-south-1'],
    services: ['S3'],
  }

  [
    ['explicit', { ip_version: 4 }],
    ['implicit', {}],
  ].each do |type, extra_params|
    context "RedHat 7 - ipv4 #{type}" do
      let(:title) { 'ap-south-1-s3' }
      let(:params) { params.merge(extra_params) }
      let :facts do
        {
          osfamily: 'RedHat',
          operatingsystemmajrelease: '7',
        }
      end

      it do
        is_expected.to contain_ipset('ap-south-1-s3').only_with(
          ensure: 'present',
          set: %w[
            52.92.248.0/22
            52.219.62.0/23
            52.219.64.0/22
          ],
          type: 'hash:net',
          options: {},
          ignore_contents: false,
          keep_in_sync: true,
        )
      end
    end
  end
end
