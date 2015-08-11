module Myfinance
  module Resources
    #
    # A wrapper to Myfinance receivable accounts API
    #
    # [API]
    #   Documentation: https://app.myfinance.com.br/docs/api/receivable_accounts
    #
    class ReceivableAccount < FinancialAccount

      def receive(id, entity_id, params = {})
        request_and_build_response(:put, endpoint_for(id, entity_id, :receive), params)
      end

      def undo_receivement(id, entity_id)
        request_and_build_response(:put, endpoint_for(id, entity_id, :undo_receivement))
      end

      private

      def endpoints
        default_endpoints.merge({
          receive: '/entities/:entity_id/receivable_accounts/:id/receive',
          undo_receivement: '/entities/:entity_id/receivable_accounts/:id/undo_receivement',
        })
      end

      def resource_key
        'receivable_account'
      end
    end
  end
end
