require "puppetlabs_spec_helper/module_spec_helper"
require "hiera"
require "rspec-puppet-facts"

include RspecPuppetFacts

RSpec.configure do |c|
  c.hiera_config = "hiera.yaml"
end
