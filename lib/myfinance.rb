require "typhoeus"
require "multi_json"

require "myfinance/version"
require "myfinance/configuration"
require "myfinance/client"
require "myfinance/attribute_handler"

require "myfinance/resources/base"
require "myfinance/resources/collection"
require "myfinance/resources/entity_collection"
require "myfinance/resources/entity"

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
