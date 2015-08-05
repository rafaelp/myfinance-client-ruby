module Myfinance
  module Resources
    class FinancialAccount < Base
      #
      # Create a payable/receivable account
      #
      # [API]
      #   Method: <tt>POST /entities/:entity_id/payable_accounts</tt>
      #   Method: <tt>POST /entities/:entity_id/receivable_accounts</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/payable_accounts#post_create
      #   Documentation: https://app.myfinance.com.br/docs/api/receivable_accounts#post_create
      #
      def create(entity_id, params = {})
        http.post(endpoints[:create].gsub(':entity_id', entity_id.to_s), body: { resource_key => params }) do |response|
          respond_with_object(response, resource_key)
        end
      end
    end
  end
end
