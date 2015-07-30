require "myfinance/exception"

module Myfinance
  RequestTimeout = Class.new(Exception)
  RequestError   = Class.new(Exception)

  class Response < SimpleDelegator

    def resolve!(&block)
      if success?
        block_given? ? yield(self) : self
      elsif timed_out?
        timeout!
      else
        error!
      end
    end

    def parsed_body(key=nil)
      return MultiJson.load(self.body)[key] unless key.nil?
      MultiJson.load(self.body)
    rescue MultiJson::ParseError
      {}
    end

    private

    def timeout!
      raise RequestTimeout
    end

    def error!
      raise RequestError.new(
        code:    code,
        message: status_message,
        body:    body
      )
    end

  end
end
