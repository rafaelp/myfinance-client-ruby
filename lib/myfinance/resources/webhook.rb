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
      # Create a webhook
      #
      # [API]
      #   Method: <tt>POST /integrations/webhooks</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/webhooks#post_create
      #
      def create(params)
        http.post("/integrations/webhooks", body: { webhook: params }) do |response|
          respond_with_object response, "webhook"
        end
      end
    end
  end
end