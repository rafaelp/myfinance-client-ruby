module Myfinance
  module Resources
    #
    # A wrapper to Myfinance people API
    #
    # [API]
    #   Documentation: https://app.myfinance.com.br/docs/api/people
    #
    class Person < Base
      #
      # List all people of the user
      #
      # [API]
      #   Method: <tt>GET /people</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/people#get_index
      #
      def find_all
        http.get("/people", body: {}) do |response|
          respond_with_collection(response)
        end
      end
    end
  end
end
