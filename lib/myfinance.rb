require "typhoeus"
require "multi_json"

require "myfinance/version"
require "myfinance/configuration"
require "myfinance/http"
require "myfinance/client"

require "myfinance/entities/base"
require "myfinance/entities/collection"
require "myfinance/entities/entity"
require "myfinance/entities/entity_collection"
require "myfinance/entities/payable_account"

require "myfinance/resources/base"
require "myfinance/resources/entity"
require "myfinance/resources/payable_account"

module Myfinance
  def self.configuration
    @configuration ||=  Configuration.new
  end

  def self.configure
    yield(configuration) if block_given?
  end

  def self.client(token)
    Client.new(token)
  end
end
