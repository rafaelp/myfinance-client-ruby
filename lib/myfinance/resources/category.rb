module Myfinance
  module Resources
    #
    # A wrapper to Myfinance categories API
    #
    # [API]
    #   Documentation: https://sandbox.myfinance.com.br/docs/api/categories
    #    
    class Category < Base
      #
      # List all categories
      #
      # [API]
      #   Method: <tt>GET /categories</tt>
      #
      #   Documentation: https://sandbox.myfinance.com.br/docs/api/categories#get_index
      #
      def find_all
        http.get('/categories', body: {}) do |response|
          respond_with_collection(response)
        end
      end

      #
      # Creates a category
      #
      # [API]
      #   Method: <tt>POST /categories</tt>
      #
      #   Documentation: https://sandbox.myfinance.com.br/docs/api/categories#post_create
      #
      def create(params)
        http.post("/categories", body: { category: params }) do |response|
          respond_with_object response, "category"
        end
      end
    end
  end
end
