module Myfinance
  module Entities
    class CreditCardCollection < Collection
      def build_collection
        response.parsed_body.each do |attributes|
          collection.push(Myfinance::Entities::CreditCard.new(attributes["credit_card"]))
        end
      end
    end
  end
end
