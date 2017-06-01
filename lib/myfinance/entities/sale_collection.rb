module Myfinance
  module Entities
    class SaleCollection < Collection
      def build_collection
        response.parsed_body.each do |attributes|
          collection.push(
            Myfinance::Entities::Sale.new(attributes["sale"])
          )
        end
      end
    end
  end
end
