require 'spec_helper'

describe 'AWS_Firewall::Prefixes' do
  describe 'valid' do
    it do
      is_expected.to allow_value(
        'us-east-1' => {
          S3: {
            '4' => ['15.0.0.0/20'],
            '6' => [],
          },
        },
        'eu-west-1' => {
          EC2: {
            '4' => ['1.0.0.0/30', '42.0.0.0/8'],
            '6' => ['42:cafe:123::/42'],
          },
          S3: {
            '4' => ['1.0.0.0/20', '10.0.0.0/8'],
            '6' => ['42:42:cafe::/42'],
          },
        },
      )
    end
  end

  describe 'invalid' do
    it do
      is_expected.not_to allow_value(
        'eu_west-1' => {
          S3: {
            '4' => ['1.0.0.0/30', '42.0.0.0/8'],
            '6' => ['42:cafe:123::/42'],
          },
        },
      )
    end
  end
end
