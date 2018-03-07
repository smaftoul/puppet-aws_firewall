require 'spec_helper'

describe 'aws_firewall::rule::metadata' do
  title = '200 Allow access to EC2 instance metadata to user foo'
  let(:title) { title }
  let :params do
    {
      uid: 'foo',
    }
  end

  it do
    is_expected.to contain_firewall(title).only_with(
      chain: 'OUTPUT',
      uid: 'foo',
      destination: '169.254.169.254',
      dport: 80,
      proto: 'tcp',
      state: 'NEW',
      action: 'accept',
      provider: 'iptables',
    )
  end
end
