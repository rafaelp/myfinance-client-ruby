require "rest_client"
require "multi_json"

require "myfinance/version"
require "myfinance/configuration"

module Myfinance
  def self.configuration
    @configuration ||=  Configuration.new
  end

  def self.configure
    yield(configuration) if block_given?
  end
end
