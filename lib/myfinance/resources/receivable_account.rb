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
        http.put(endpoints(id, entity_id, :receive), body: { receivable_account: params }) do |response|
          respond_with_object(response, 'receivable_account')
        end
      end

      def undo_receivement(id, entity_id)
        http.put(endpoints(id, entity_id, :undo_receivement)) do |response|
          respond_with_object(response, 'receivable_account')
        end
      end

      private

      def endpoints(id, entity_id, key)
        {
          create: '/entities/:entity_id/receivable_accounts',
          receive: '/entities/:entity_id/receivable_accounts/:id/receive',
          undo_receivement: '/entities/:entity_id/receivable_accounts/:id/undo_receivement',
          destroy: '/entities/:entity_id/receivable_accounts/:id'
        }[key].gsub(':entity_id', entity_id.to_s).gsub(':id', id.to_s)
      end

      def resource_key
        'receivable_account'
      end
    end
  end
end
