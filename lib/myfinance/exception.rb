module Myfinance
  class Exception < StandardError
    attr_accessor :code, :body, :headers

    def initialize(args = {})
      super(args[:message])
      @code     = args[:code]
      @body     = args[:body]
      @headers  = args[:headers]
    end
  end
end
