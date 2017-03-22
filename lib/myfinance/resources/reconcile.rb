module Myfinance
  module Resources
    class Reconcile < Base
      def reconcile(entity_id, financial_accounts_ids = [], financial_transactions_ids = [])
        body = { selected_financial_account_ids: financial_accounts_ids,
                 selected_financial_transaction_ids: financial_transactions_ids }

        http.post(path(entity_id), body: body) do |response|
          respond_with_collection(response)
        end
      end

      private

      def path(entity_id)
        "/entities/#{entity_id}/reconciles"
      end
    end
  end
end
