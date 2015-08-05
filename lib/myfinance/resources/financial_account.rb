module Myfinance
  module Resources
    class FinancialAccount < Base
      #
      # Creates a payable/receivable account
      #
      # [API]
      #   Method: <tt>POST /entities/:entity_id/payable_accounts</tt>
      #   Method: <tt>POST /entities/:entity_id/receivable_accounts</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/payable_accounts#post_create
      #   Documentation: https://app.myfinance.com.br/docs/api/receivable_accounts#post_create
      #
      def create(entity_id, params = {})
        http.post(endpoints(nil, entity_id, :create), body: { resource_key => params }) do |response|
          respond_with_object(response, resource_key)
        end
      end

      #
      # Destroys a payable/receivable account
      #
      # [API]
      #   Method: <tt>DELETE /entities/:entity_id/payable_accounts/:id</tt>
      #   Method: <tt>DELETE /entities/:entity_id/receivable_accounts/:id</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/payable_accounts#delete_destroy
      #   Documentation: https://app.myfinance.com.br/docs/api/receivable_accounts#delete_destroy
      #
      def destroy(id, entity_id)
        http.delete(endpoints(id, entity_id, :destroy)) do |response|
          true
        end
      end
    end
  end
end
