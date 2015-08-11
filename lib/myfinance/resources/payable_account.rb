module Myfinance
  module Resources
    #
    # A wrapper to Myfinance payable accounts API
    #
    # [API]
    #   Documentation: https://app.myfinance.com.br/docs/api/payable_accounts
    #
    class PayableAccount < FinancialAccount

      def pay(id, entity_id, params = {})
        request_and_build_response(:put, endpoint_for(id, entity_id, :pay), params)
      end

      def undo_payment(id, entity_id)
        request_and_build_response(:put, endpoint_for(id, entity_id, :undo_payment))
      end

      private

      def endpoints
        default_endpoints.merge({
          pay: '/entities/:entity_id/payable_accounts/:id/pay',
          undo_payment: '/entities/:entity_id/payable_accounts/:id/undo_payment'
        })
      end

      def resource_key
        'payable_account'
      end
    end
  end
end
