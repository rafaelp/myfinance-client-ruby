module Myfinance
  module Resources
    #
    # A wrapper to Myfinance accounts API
    #
    # [API]
    #   Documentation: https://app.myfinance.com.br/docs/api/multiple_accounts
    #
    class Account < Base
      #
      # List all account of the user
      #
      # [API]
      #   Method: <tt>GET /accounts</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/multiple_accounts#get_index
      #
      def find_all
        http.get("/accounts", body: {}) do |response|
          respond_with_collection(response)
        end
      end
    end
  end
end
