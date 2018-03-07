require 'spec_helper'

describe 'AWS_Firewall::Regions' do
  describe 'invalid' do
    [
      'ap-northeast-3',
      ['foo'],
    ].each do |region|
      describe region.inspect do
        it { is_expected.not_to allow_value(region) }
      end
    end
  end

  describe 'valid' do
    [
      ['us-east-1', 'ap-south-1'],
      ['eu-west-1'],
    ].each do |region|
      describe region.inspect do
        it { is_expected.to allow_value(region) }
      end
    end
  end
end
