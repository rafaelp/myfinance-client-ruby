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
        {
          create: '/entities/:entity_id/receivable_accounts'
        }
      end

      def resource_key
        'receivable_account'
      end
    end
  end
end
