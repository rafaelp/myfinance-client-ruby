module Myfinance
  module Entities
    #
    # A wrapper to Myfinance entities collection
    #
    class EntityCollection < Collection
      def build_collection
        response.parsed_body.each do |attributes|
          collection.push(Myfinance::Entities::Entity.new(attributes['entity']))
        end
      end
    end
  end
end
