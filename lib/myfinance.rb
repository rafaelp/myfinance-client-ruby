require "typhoeus"
require "multi_json"

require "myfinance/version"
require "myfinance/configuration"
require "myfinance/client"

module Myfinance
  def self.configuration
    @configuration ||=  Configuration.new
  end

  def self.configure
    yield(configuration) if block_given?
  end

  def self.client
    Client.new(Myfinance.configuration.token)
  end
end
