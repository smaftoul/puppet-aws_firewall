require 'spec_helper'

describe 'aws_firewall::region::current', :type => :puppet_function do
  let :facts do
    {
      ec2_metadata: {
        placement: {
          'availability-zone' => 'ap-northeast-3a',
        },
      },
    }
  end

  it { is_expected.to run.and_return('ap-northeast-3') }
end
