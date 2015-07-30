module Myfinance
  module Resources
    class Base

      attr_accessor :http

      def initialize(http)
        @http = http
      end

      private

      def respond_with_collection(response)
        collection_klass = Myfinance::Entities.const_get("#{entity_klass_name}Collection")
        collection_klass.build(response)
      end

      def respond_with_object(response)
        entity_klass = Myfinance::Entities.const_get(entity_klass_name)
        entity_klass.new(response.parsed_body('entity'))
      end

      def entity_klass_name
        self.class.to_s.gsub('Resources', 'Entities')
      end

      def response_key
        self.class.to_s.split('::').last.downcase
      end
    end
  end
end
