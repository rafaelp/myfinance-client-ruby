module Myfinance
  module Resources
    #
    # A wrapper to Myfinance entities API
    #
    # [API]
    #   Documentation: https://app.myfinance.com.br/docs/api/entities
    #
    class Entity < Base
      #
      # List all entities of the user
      #
      # [API]
      #   Method: <tt>GET /entities</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/entities#get_index
      #
      def find_all(params = {})
        search_endpoint = build_search_endpoint(params)        

        http.get(search_endpoint) do |response|
          respond_with_collection(response)
        end
      end

      #
      # Find a specific entity
      #
      # [API]
      #   Method: <tt>GET /entities/:id</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/entities#get_show
      #
      def find(entity_id)
        http.get("/entities/#{entity_id}", body: {}) do |response|
          respond_with_object(response, 'entity')
        end
      end

      private

      def endpoint
        "/entities"
      end
    end
  end
end
