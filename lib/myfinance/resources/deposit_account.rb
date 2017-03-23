module Myfinance
  module Resources
    #
    # A wrapper to Myfinance deposit accounts API
    #
    # [API]
    #   Documentation: https://app.myfinance.com.br/docs/api/deposit_accounts
    #
    class DepositAccount < Base
      #
      # List all deposit accounts of entity
      #
      # [API]
      #   Method: <tt>GET /entities/:entity_id/deposit_accounts</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/deposit_accounts#get_index
      #
      def find_all(entity_id)
        http.get("/entities/#{entity_id}/deposit_accounts", body: {}) do |response|
          respond_with_collection(response)
        end
      end

      #
      # List a deposit account of entity
      #
      # [API]
      #   Method: <tt>GET /entities/:entity_id/deposit_accounts/:id</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/deposit_accounts#get_show
      #
      def find(entity_id, id)
        http.get("/entities/#{entity_id}/deposit_accounts/#{id}", body: {}) do |response|
          respond_with_object(response, "deposit_account")
        end
      end

      def find_by(entity_id, params = {})
        sanitized_params = search_params(params) 
        endpoint = encode_endpoint(entity_id, sanitized_params)

        http.get(endpoint, body: {}) do |response|
          respond_with_collection(response)
        end
      end

      #
      # Creates a deposit account of entity
      #
      # [API]
      #   Method: <tt>POST /entities/:entity_id/deposit_accounts</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/deposit_accounts#post_create
      #
      def create(entity_id, params = {})
        http.post("/entities/#{entity_id}/deposit_accounts", body: { deposit_account: params }) do |response|
          respond_with_object(response, "deposit_account")
        end
      end

      #
      # Updates a deposit account of entity
      #
      # [API]
      #   Method: <tt>PUT /entities/:entity_id/deposit_accounts/:id</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/deposit_accounts#put_update
      #
      def update(entity_id, id, params = {})
        http.put("/entities/#{entity_id}/deposit_accounts/#{id}", body: { deposit_account: params }) do |response|
          respond_with_object(response, "deposit_account")
        end
      end

      #
      # Destroy a deposit account of entity
      #
      # [API]
      #   Method: <tt>DELETE /entities/:entity_id/deposit_accounts/:id</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/deposit_accounts#delete_destroy
      #
      def destroy(entity_id, id)
        http.delete("/entities/#{entity_id}/deposit_accounts/#{id}", body: {}) do |response|
          respond_with_object(response, "deposit_account")
        end
      end

      private

      def search_params(params)
        params.map { |key, value| "search[#{key}]=#{value}" }.join("&")
      end

      def enconde_endpoint(entity_id, path)
        URI.encode("/entities/#{entity_id}/deposit_accounts?#{path}")
      end
    end
  end
end
