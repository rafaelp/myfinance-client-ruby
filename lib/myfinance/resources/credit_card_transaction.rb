module Myfinance
  module Resources
    class CreditCardTransaction < Base
      def find_all(entity_id, credit_card_id, year, month)
        path = "/entities/#{entity_id}/credit_cards/#{credit_card_id}/invoices/#{year}-#{month}"
        http.get(path, body: {}) do |response|
          respond_with_collection(response)
        end
      end

      def find(entity_id, credit_card_id, credit_card_transaction_id)
        path = "/entities/#{entity_id}/credit_cards/#{credit_card_id}/transactions/#{credit_card_transaction_id}" 
        http.get(path, body: {}) do |response|
          respond_with_object(response, "credit_card_transaction")
        end
      end

      def create(entity_id, credit_card_id, params = {})
        path = "/entities/#{entity_id}/credit_cards/#{credit_card_id}/transactions" 
        http.post(path, body: { credit_card_transaction: params }) do |response|
          respond_with_object(response, "credit_card_transaction")
        end
      end

      def update(entity_id, credit_card_id, credit_card_transaction_id, params = {})
        path = "/entities/#{entity_id}/credit_cards/#{credit_card_id}/transactions/#{credit_card_transaction_id}" 
        http.put(path, body: { credit_card_transaction: params }) do |response|
          respond_with_object(response, "credit_card_transaction")
        end
      end

      def destroy(entity_id, credit_card_id, credit_card_transaction_id, params = {})
        path = "/entities/#{entity_id}/credit_cards/#{credit_card_id}/transactions/#{credit_card_transaction_id}" 
        http.delete(path, body: { credit_card_transaction: params }) do |response|
          response
        end
      end

      def destroy_parcelled(entity_id, credit_card_id, credit_card_transaction_id, params = {})
        path = "/entities/#{entity_id}/credit_cards/#{credit_card_id}/transactions/#{credit_card_transaction_id}/recurrence" 
        http.delete(path, body: { credit_card_transaction: params }) do |response|
          response
        end
      end
    end
  end
end
