require "typhoeus"
require "multi_json"
require "mime/types"
require "require_all"

require_all "lib/myfinance"

module Myfinance
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration) if block_given?
  end

  def self.client(token, account_id = nil)
    Client.new(token, account_id)
  end
end
