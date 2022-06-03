module Myfinance
  module Resources
    class CustomClassifierValue < Base
      #
      # List all custom classifier values
      #
      # [API]
      #   Method: <tt>GET /custom_classifiers/:custom_classifier_id/values</tt>
      #
      #   Documentation: https://sandbox.myfinance.com.br/docs/api/custom_classifier_values#get_index
      #
      def find_all(custom_classifier_id, params = {})
        search_endpoint = build_search_endpoint(custom_classifier_id, params)

        http.get(search_endpoint) do |response|
          respond_with_collection(response)
        end
      end

      #
      # Find a custom classifier value
      #
      # [API]
      #   Method: <tt>GET /custom_classifiers/:custom_classifier_id/values/:id</tt>
      #
      #   Documentation: https://sandbox.myfinance.com.br/docs/api/custom_classifier_values#get_show
      #
      def find(custom_classifier_id, id)
        http.get("/custom_classifiers/#{custom_classifier_id}/values/#{id}", body: {}) do |response|
          respond_with_object(response, "custom_classifier_value")
        end
      end

      #
      # Creates a custom classifier value
      #
      # [API]
      #   Method: <tt>POST /custom_classifiers/:custom_classifier_id/values</tt>
      #
      #   Documentation: https://sandbox.myfinance.com.br/docs/api/custom_classifiers#post_create
      #
      def create(custom_classifier_id, params)
        body = { custom_classifier_value: params }
        http.post("/custom_classifiers/#{custom_classifier_id}/values", body: body) do |response|
          respond_with_object(response, "custom_classifier_value")
        end
      end

      #
      # Updates a custom classifier value
      #
      # [API]
      #   Method: <tt>PUT /custom_classifiers/:custom_classifier_id/values/:id</tt>
      #
      #   Documentation: https://sandbox.myfinance.com.br/docs/api/custom_classifiers#put_update
      #
      def update(custom_classifier_id, id, params = {})
        body = { custom_classifier_value: params }
        http.put("/custom_classifiers/#{custom_classifier_id}/values/#{id}", body: body) do |response|
          respond_with_object(response, "custom_classifier_value")
        end
      end

      #
      # Destroy a custom classifier value
      #
      # [API]
      #   Method: <tt>DELETE /custom_classifiers/:custom_classifier_id/values/:id</tt>
      #
      #   Documentation: https://sandbox.myfinance.com.br/docs/api/custom_classifiers#delete_destroy
      #
      def destroy(custom_classifier_id, id)
        http.delete("/custom_classifiers/#{custom_classifier_id}/values/#{id}", body: {}) do |response|
          respond_with_object(response, "custom_classifier_value")
        end
      end

      private

      def build_search_endpoint(custom_classifier_id, params)
        query_string = query(params).join("&")
        custom_classifier_endpoint = endpoint(custom_classifier_id)

        "#{custom_classifier_endpoint}?#{query_string}"
      end

      def endpoint(custom_classifier_id)
        "/custom_classifiers/#{custom_classifier_id}/values"
      end
    end
  end
end
