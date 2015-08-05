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
        http.put(endpoints(id, entity_id, :pay), body: { payable_account: params }) do |response|
          respond_with_object(response, 'payable_account')
        end
      end

      def undo_payment(id, entity_id)
        http.put(endpoints(id, entity_id, :undo_payment)) do |response|
          respond_with_object(response, 'payable_account')
        end
      end

      private

      def endpoints(id, entity_id, key)
        {
          create: '/entities/:entity_id/payable_accounts',
          pay: '/entities/:entity_id/payable_accounts/:id/pay',
          undo_payment: '/entities/:entity_id/payable_accounts/:id/undo_payment'
        }[key].gsub(':entity_id', entity_id.to_s).gsub(':id', id.to_s)
      end

      def resource_key
        'payable_account'
      end
    end
  end
end
