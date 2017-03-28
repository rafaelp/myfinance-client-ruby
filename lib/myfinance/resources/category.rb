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
      def find_all(params)
        search_endpoint = build_search_endpoint(params)        

        http.get(search_endpoint) do |response|
          respond_with_collection(response)
        end
      end

      #
      # Find a category
      #
      # [API]
      #   Method: <tt>GET /categories/:id</tt>
      #
      #   Documentation: https://sandbox.myfinance.com.br/docs/api/categories#get_show
      #
      def find(id)
        http.get("/categories/#{id}", body: {}) do |response|
          respond_with_object response, "category"
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

      #
      # Updates a category
      #
      # [API]
      #   Method: <tt>PUT /categories/:id</tt>
      #
      #   Documentation: https://sandbox.myfinance.com.br/docs/api/categories#put_update
      #
      def update(id, params = {})
        http.put("/categories/#{id}", body: { category: params }) do |response|
          respond_with_object response, "category"
        end
      end

      #
      # Destroy a category
      #
      # [API]
      #   Method: <tt>DELETE /categories/:id</tt>
      #
      #   Documentation: https://sandbox.myfinance.com.br/docs/api/categories#delete_destroy
      #
      def destroy(id)
        http.delete("/categories/#{id}", body: {}) do |response|
          respond_with_object response, "category"
        end
      end

      private

      def endpoint
        "/categories"
      end
    end
  end
end
