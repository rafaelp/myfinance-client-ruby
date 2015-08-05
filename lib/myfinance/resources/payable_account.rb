module Myfinance
  module Resources
    #
    # A wrapper to Myfinance payable accounts API
    #
    # [API]
    #   Documentation: https://app.myfinance.com.br/docs/api/payable_accounts
    #
    class PayableAccount < Base
      #
      # Create a payable account
      #
      # [API]
      #   Method: <tt>POST /entities/:entity_id/payable_accounts</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/payable_accounts#post_create
      #
      def create(entity_id, params = {})
        http.post("/entities/#{entity_id}/payable_accounts", body: { payable_account: params }) do |response|
          respond_with_object(response, 'payable_account')
        end
      end
    end
  end
end
