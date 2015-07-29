module Myfinance
  module Resources
    #
    # A wrapper to Myfinance entities collection
    #
    class EntityCollection < Collection
      attr_reader :name

      private

      def build_collection
        Myfinance::Resources::Base.parsed_body(response).each do |attributes|
          collection.push(Myfinance::Resources::Entity.new(attributes['entity']))
        end
      end
    end
  end
end
