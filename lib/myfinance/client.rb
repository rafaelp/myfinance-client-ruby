require "myfinance/request"
require "myfinance/response"

module Myfinance
  class Client
    attr_reader :http

    def initialize(token)
      @http = Http.new(token)
    end

    def authenticated?
      http.get("/accounts") { |response| response.code == 200 }
    rescue RequestError => e
      raise e unless [401, 403].include?(e.code)
      false
    end

    def entities
      Myfinance::Resources::Entity.new(http)
    end
  end
end
