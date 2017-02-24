module Myfinance
  module Resources
    class Category < Base

      def create(params)
        http.post("/categories", body: { category: params }) do |response|
          respond_with_object response, "category"
        end
      end
      
    end
  end
end
