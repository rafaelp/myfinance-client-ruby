module Myfinance
  module Resources
    class CustomClassifier < Base
      #
      # List all custom classifiers
      #
      # [API]
      #   Method: <tt>GET /custom_classifiers</tt>
      #
      #   Documentation: https://sandbox.myfinance.com.br/docs/api/custom_classifiers#get_index
      #
      def find_all(params = {})
        search_endpoint = build_search_endpoint(params)

        http.get(search_endpoint) do |response|
          respond_with_collection(response)
        end
      end

      #
      # Find a custom classifier
      #
      # [API]
      #   Method: <tt>GET /custom_classifiers/:id</tt>
      #
      #   Documentation: https://sandbox.myfinance.com.br/docs/api/custom_classifiers#get_show
      #
      def find(id)
        http.get("/custom_classifiers/#{id}", body: {}) do |response|
          respond_with_object response, "custom_classifier"
        end
      end

      #
      # Creates a custom classifier
      #
      # [API]
      #   Method: <tt>POST /custom_classifiers</tt>
      #
      #   Documentation: https://sandbox.myfinance.com.br/docs/api/custom_classifiers#post_create
      #
      def create(params)
        http.post("/custom_classifiers", body: { custom_classifier: params }) do |response|
          respond_with_object response, "custom_classifier"
        end
      end

      #
      # Updates a custom classifier
      #
      # [API]
      #   Method: <tt>PUT /custom_classifiers/:id</tt>
      #
      #   Documentation: https://sandbox.myfinance.com.br/docs/api/custom_classifiers#put_update
      #
      def update(id, params = {})
        http.put("/custom_classifiers/#{id}", body: { custom_classifier: params }) do |response|
          respond_with_object response, "custom_classifier"
        end
      end

      #
      # Destroy a custom_classifier
      #
      # [API]
      #   Method: <tt>DELETE /custom_classifiers/:id</tt>
      #
      #   Documentation: https://sandbox.myfinance.com.br/docs/api/custom_classifiers#delete_destroy
      #
      def destroy(id)
        http.delete("/custom_classifiers/#{id}", body: {}) do |response|
          respond_with_object response, "custom_classifier"
        end
      end

      private

      def endpoint
        "/custom_classifiers"
      end
    end
  end
end
