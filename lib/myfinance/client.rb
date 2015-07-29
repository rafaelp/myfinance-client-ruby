require "myfinance/request"
require "myfinance/response"

module Myfinance
  class Client
    attr_reader :token

    def initialize(token)
      @token = token
    end

    def authenticated?
      get("/accounts") { |response| response.code == 200 }
    rescue RequestError => e
      raise e unless [401, 403].include?(e.code)
      false
    end

    %w[get post delete put].each do |m|
      define_method(m) do |path, options = {}, &block|
        send_request(m.to_sym, path, options, &block)
      end
    end

    private

    def send_request(method, path, options, &block)
      request  = Request.new(options.merge!({
        method: method,
        authorization_hash: authorization_hash,
        url: "#{Myfinance.configuration.url}#{path}",
        user_agent: Myfinance.configuration.user_agent
      }))

      response = Response.new(request.run)

      response.resolve!(&block)
    end

    def authorization_hash
      ::Base64.strict_encode64("#{token}:X")
    end
  end
end
