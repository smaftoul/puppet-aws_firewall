require 'spec_helper'
require 'yaml'

describe 'aws_firewall::prefixes' do
  data = YAML.load_file('data/ip-ranges.yaml')['aws_firewall::prefixes']

  it do
    is_expected.to run.and_return(data)
  end
end
