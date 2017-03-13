module Myfinance
  module Resources
    #
    # A wrapper to Myfinance Webhooks API
    #
    # [API]
    #   Documentation: https://app.myfinance.com.br/docs/api/webhooks
    #
    class Webhook < Base
      #
      # List all webhooks
      #
      # [API]
      #   Method: <tt>GET /integrations/webhooks</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/webhooks#get_index
      #
      def find_all
        http.get("/integrations/webhooks", body: {}) do |response|
          respond_with_collection(response)
        end
      end

      #
      # List a webhook
      #
      # [API]
      #   Method: <tt>GET /integrations/webhooks/:id</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/webhooks#get_show
      #
      def find(id)
        http.get("/integrations/webhooks/#{id}", body: {}) do |response|
          respond_with_object response, "webhook"
        end
      end

      #
      # Create a webhook
      #
      # [API]
      #   Method: <tt>POST /integrations/webhooks</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/webhooks#post_create
      #
      def create(params)
        http.post("/integrations/webhooks", body: { webhook: params }) do |response|
          respond_with_object(response, "webhook")
        end
      end

      #
      # Updates a webhook
      #
      # [API]
      #   Method: <tt>PUT /integrations/webhooks/:id</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/webhooks#put_update
      #
      def update(id, params = {})
        http.put(
          "/integrations/webhooks/#{id}", body: { webhook: params }
        ) do |response|
          respond_with_object(response, "webhook")
        end
      end

      #
      # Destroy a webhook
      #
      # [API]
      #   Method: <tt>DELETE /integrations/webhooks/:id</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/webhooks#delete_destroy
      #
      def destroy(id)
        http.delete("/integrations/webhooks/#{id}", body: {}) do |response|
          respond_with_object(response, "webhook")
        end
      end
    end
  end
end
