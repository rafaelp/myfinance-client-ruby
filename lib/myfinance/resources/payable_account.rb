module Myfinance
  module Resources
    #
    # A wrapper to Myfinance payable accounts API
    #
    # [API]
    #   Documentation: https://app.myfinance.com.br/docs/api/payable_accounts
    #
    class PayableAccount < FinancialAccount

      private

      def endpoints
        default_endpoints.merge({
          pay: '/entities/:entity_id/payable_accounts/:id/pay',
          undo_payment: '/entities/:entity_id/payable_accounts/:id/undo_payment'
        })
      end

      def pay_or_receive_method
        'pay'
      end

      def undo_payment_or_receivement
        'undo_payment'
      end

      def resource_key
        'payable_account'
      end
    end
  end
end
