require "codeclimate-test-reporter"
require "simplecov"

CodeClimate::TestReporter.start

SimpleCov.start do
  SimpleCov.maximum_coverage_drop 0.2

  SimpleCov.start do
    add_group  "Resources", "lib/myfinance/resources"
    add_group  "Entities",  "lib/myfinance/entities"
    add_filter "vendor"
  end
end


$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require "myfinance"
require "pry"
require "vcr"


Dir["spec/support/**/*.rb"].each { |f| load f }

VCR.configure do |config|
  config.cassette_library_dir = "spec/vcr_cassettes"
  config.hook_into :typhoeus
  config.ignore_hosts "codeclimate.com"
end

RSpec.configure do |config|
  config.mock_with :rspec

  config.before(:each) do
    Myfinance.configuration.url = "https://sandbox.myfinance.com.br"
    Typhoeus::Expectation.clear
  end
end

