require 'base64'

module Myfinance
  class Configuration
    attr_accessor :url, :user_agent

    def initialize
      @url = 'https://app.myfinance.com.br'
      @user_agent = "Myfinance Ruby Client v#{Myfinance::VERSION}"
    end
  end
end
