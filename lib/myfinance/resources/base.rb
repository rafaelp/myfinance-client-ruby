module Myfinance
  module Resources
    class Base
      attr_accessor :http

      def initialize(http)
        @http = http
      end

      private

      def build_search_endpoint(params)
        query_string = query(params).join("&")
        "#{endpoint}?#{query_string}"
      end

      def query(params)
        page = params.delete(:page)
        query = params.map { |key, value| "search[#{key}]=#{CGI.escape(value.to_s)}" }
        query << "page=#{page}" if page
        query
      end

      def respond_with_collection(response)
        collection_klass = Myfinance::Entities.const_get("#{entity_klass_name}Collection")
        collection_klass.build(response)
      end

      def respond_with_object(response, key)
        entity_klass = Myfinance::Entities.const_get(entity_klass_name)
        entity_klass.new(response.parsed_body(key))
      end

      def entity_klass_name
        self.class.to_s.gsub("Resources", "Entities")
      end
    end
  end
end
