module Myfinance
  module Entities
    class CreditCardTransactionCollection < Collection
      def build_collection
        response.parsed_body.each do |attributes|
          collection.push(Myfinance::Entities::CreditCardTransaction.new(attributes["credit_card_transaction"]))
        end
      end
    end
  end
end
