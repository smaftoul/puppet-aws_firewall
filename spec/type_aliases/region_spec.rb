require 'spec_helper'

describe 'AWS_Firewall::Region' do
  describe 'invalid' do
    %w[
      foo
      uk-somehwere-42
    ].each do |region|
      describe region.inspect do
        it { is_expected.not_to allow_value(region) }
      end
    end
  end

  describe 'valid' do
    %w[
      GLOBAL
      ap-northeast-1
      ap-northeast-2
      ap-northeast-3
      ap-south-1
      ap-southeast-1
      ap-southeast-2
      ca-central-1
      cn-north-1
      cn-northwest-1
      eu-central-1
      eu-north-1
      eu-west-1
      eu-west-2
      eu-west-3
      sa-east-1
      us-east-1
      us-east-2
      us-gov-east-1
      us-gov-west-1
      us-west-1
      us-west-2
    ].each do |region|
      describe region.inspect do
        it { is_expected.to allow_value(region) }
      end
    end
  end
end