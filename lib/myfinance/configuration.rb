require 'base64'
module Myfinance

  class Configuration
    attr_accessor :url, :user_agent, :token

    def initialize
      @url = 'https://app.myfinance.com.br'
      @user_agent = "Myfinance Ruby Client v#{Myfinance::VERSION}"
      @token = nil
    end

    def credentials
      check_token!
      base64_credential
    end

    private

    def check_token!
      raise ArgumentError, "token not set" if token.nil? || token.to_s.strip == ''
    end

    def base64_credential
      "Basic #{::Base64.strict_encode64("#{token}:X")}"
    end
  end

end
