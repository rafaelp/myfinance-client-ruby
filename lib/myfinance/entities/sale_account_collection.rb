module Myfinance
  module Entities
    class SaleAccountCollection < Collection
      def build_collection
        response.parsed_body.each do |attributes|
          collection.push(
            Myfinance::Entities::SaleAccount.new(attributes["sale_account"])
          )
        end
      end
    end
  end
end
