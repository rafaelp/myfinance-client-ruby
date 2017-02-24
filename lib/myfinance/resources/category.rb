module Myfinance
  module Resources
    class Category < Base
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
