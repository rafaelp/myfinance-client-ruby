module Myfinance
  module Resources
    class Base
      def initialize(attribute={})
        attribute.each do |k, v|
          set_attribute(k, v)
        end
      end

      def self.client
        Myfinance.client
      end

      private

      def self.parsed_body(response, key=nil)
        return MultiJson.load(response.body)[key] unless key.nil?
        MultiJson.load(response.body)
      rescue MultiJson::ParseError
        {}
      end

      def set_attribute(key, value)
        object_value = Myfinance::AttributeHandler.handle(value)
        instance_variable_set("@#{key}", object_value)
      end
    end
  end
end
