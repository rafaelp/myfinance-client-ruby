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
        {
          create: '/entities/:entity_id/payable_accounts'
        }
      end

      def resource_key
        'payable_account'
      end
    end
  end
end
