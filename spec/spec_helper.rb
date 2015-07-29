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
    Myfinance.configuration.token = "b552dd5a8598ca089b91c5e355a83b86e4696aefac9eaa05"
    Typhoeus::Expectation.clear
  end
end

