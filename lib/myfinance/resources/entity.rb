module Myfinance
  module Resources
    #
    # A wrapper to Myfinance entities API
    #
    # [API]
    #   Documentation: https://app.myfinance.com.br/docs/api/entities
    #
    class Entity < Base
      attr_reader :id, :name, :account_id, :charging_uuid, :created_at, :default_in_menu, :deleted_at, :federation_subscription_number, :imported_from_sync_at, :updated_at

      #
      # List all entities of the user
      #
      # [API]
      #   Method: <tt>GET /entities</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/entities#get_index
      #
      def self.find_all
        client.get('/entities', body: {}) do |response|
          Myfinance::Resources::EntityCollection.build(response)
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
      def self.find(entity_id)
        client.get("/entities/#{entity_id}", body: {}) do |response|
          self.new(parsed_body(response, 'entity'))
        end
      end
    end
  end
end
