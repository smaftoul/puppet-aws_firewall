require 'spec_helper'

describe 'aws_firewall::rule::ipset' do
  title = '200 Allow access to S3 eu-west-1'
  base_params = {
    chain: 'OUTPUT',
    source: '10.0.0.0/8',
    gid: 's3-users',
  }
  ipset_attributes = {
    ensure: 'present',
    set: %w[
      52.92.40.0/21
      52.218.0.0/17
      54.231.128.0/19
    ],
    type: 'hash:net',
    options: {},
    ignore_contents: false,
    keep_in_sync: true,
  }
  firewall_attributes = {
    chain: 'OUTPUT',
    gid: 's3-users',
    source: '10.0.0.0/8',
    ipset: 's3-europe dst',
    dport: 443,
    proto: 'tcp',
    state: 'NEW',
    action: 'accept',
    provider: 'iptables',
    require: 'Aws_firewall::Ipset[s3-europe]',
  }
  let(:title) { title }
  let(:pre_condition) do
    <<-EOS
      aws_firewall::ipset { 's3-europe':
        regions  => ['eu-west-1'],
        services => ['S3'],
      }
    EOS
  end

  context 'reference of ipset by name' do
    let(:params) { base_params.merge(ipset: 's3-europe') }

    it { is_expected.to contain_firewall(title).only_with(firewall_attributes) }
  end

  context 'implicit creation of ipset' do
    let(:pre_condition) {}
    let :params do
      base_params.merge(
        ipset: {
          's3-europe' => {
            regions: ['eu-west-1'],
            services: ['S3'],
          },
        },
      )
    end

    it do
      is_expected.to contain_aws_firewall__ipset('s3-europe').only_with(
        ensure: 'present',
        ip_version: 4,
        regions: ['eu-west-1'],
        services: ['S3'],
      )
      is_expected.to contain_ipset('s3-europe').only_with(ipset_attributes)
      is_expected.to contain_firewall(title).only_with(firewall_attributes)
    end
  end
end
