module Myfinance
  module Resources
    #
    # A wrapper to Myfinance receivable accounts API
    #
    # [API]
    #   Documentation: https://app.myfinance.com.br/docs/api/receivable_accounts
    #
    class ReceivableAccount < FinancialAccount

      private

      def endpoints
        default_endpoints.merge({
          receive: '/entities/:entity_id/receivable_accounts/:id/receive',
          undo_receivement: '/entities/:entity_id/receivable_accounts/:id/undo_receivement',
        })
      end

      def pay_or_receive_method
        'receive'
      end

      def undo_payment_or_receivement
        'undo_receivement'
      end

      def resource_key
        'receivable_account'
      end
    end
  end
end
