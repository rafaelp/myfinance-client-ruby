module Myfinance
  module Entities
    class ReconcileCollection < Collection
      def build_collection
        response.parsed_body.each do |attributes|
          type = attributes.first
          if type == "financial_transactions" || type == "financial_accounts"
            create_collection(type, attributes)
          end
        end
      end

      private
      
      def create_collection(type, attributes)
        klass = klass_name(type)

        attributes.delete(attributes.first)
        attributes.each do |attribute|
          collection.push(klass.new(attribute.first))
        end
      end

      def klass_name(type)
        return Myfinance::Entities::FinancialTransaction if type == "financial_transactions"
        Myfinance::Entities::FinancialAccount
      end
    end
  end
end
