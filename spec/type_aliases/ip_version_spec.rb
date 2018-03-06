require 'spec_helper'

describe 'AWS_Firewall::IP_Version' do
  describe 'valid' do
    [4, 6].each do |version|
      it { is_expected.to allow_value(version) }
    end
  end

  describe 'invalid' do
    [0, 1, 2, 3, 5, 7, 8, 9, 42].each do |version|
      it { is_expected.not_to allow_value(version) }
    end
  end
end
