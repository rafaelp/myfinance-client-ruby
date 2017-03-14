module Myfinance
  module Resources
    class BankStatement < Base

      def import(entity_id, deposit_account_id, file)
        path = "/entities/#{entity_id}/deposit_accounts/#{deposit_account_id}/bank_statements"
        http.get(path, body: { bank_statement: { file: file } }) do |response|
          respond_with_object(response, "bank_statement")
        end
      end

      def status(entity_id, deposit_account_id, id)
        path = "/entities/#{entity_id}/deposit_accounts/#{deposit_account_id}/bank_statements/#{id}"
        http.get(path, body: {}) do |response|
          respond_with_object(response, "bank_statement")
        end
      end
    end
  end
end
