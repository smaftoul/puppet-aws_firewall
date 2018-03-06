require 'spec_helper'

describe 'aws_firewall::ipset' do
  context 'RedHat 7' do
    let(:title) { 'ap-south-1-s3' }
    let(:params) do
      {
        regions: ['ap-south-1'],
        services: ['S3'],
        ip_version: 4,
      }
    end
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
