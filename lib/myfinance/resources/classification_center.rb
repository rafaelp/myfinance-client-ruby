module Myfinance
  module Resources
    #
    # A wrapper to Myfinance classification center API
    #
    # [API]
    #   Documentation: https://app.myfinance.com.br/docs/api/classification_centers
    #
    class ClassificationCenter < Base
      #
      # List all classification centers, supplying optional params for refinement
      #
      # [API]
      #   Method: <tt>GET /classification_centers</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/classification_centers#get_index
      #
      def find_all(params = {})
        search_endpoint = build_search_endpoint(params)

        http.get(search_endpoint) do |response|
          respond_with_collection(response)
        end
      end

      #
      # Show a classification center
      #
      # [API]
      #   Method: <tt>GET /classification_centers/:id</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/classification_centers#get_show
      #
      def find(id)
        http.get("/classification_centers/#{id}", body: {}) do |response|
          respond_with_object response, "classification_center"
        end
      end
      #
      # Creates a classification center
      #
      # [API]
      #   Method: <tt>POST /classification_centers</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/classification_centers#post_create
      #
      def create(params)
        http.post(
          "/classification_centers", body: { classification_center: params }
        ) do |response|
          respond_with_object response, "classification_center"
        end
      end

      #
      # Updates a classification center
      #
      # [API]
      #   Method: <tt>PUT /classification_centers/:id</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/classification_centers#put_update
      #
      def update(id, params)
        http.put(
          "/classification_centers/#{id}",
          body: { classification_center: params }
        ) do |response|
          respond_with_object response, "classification_center"
        end
      end

      #
      # Destroy a classification center
      #
      # [API]
      #   Method: <tt>DELETE /classification_centers/:id</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/classification_centers#delete_destroy
      #
      def destroy(id)
        http.delete("/classification_centers/#{id}", body: {}) do |response|
          respond_with_object response, "classification_center"
        end
      end

      private

      def endpoint
        "/classification_centers"
      end
    end
  end
end
