module Myfinance
  module Resources
    class FinancialTransaction < Base
      
      def find_all(entity_id, deposit_account_id)
        path = "/entities/#{entity_id}/deposit_accounts/#{deposit_account_id}/financial_transactions"
        http.get(path, body: {}) do |response|
          respond_with_collection(response)
        end       
      end
    end
  end
end
