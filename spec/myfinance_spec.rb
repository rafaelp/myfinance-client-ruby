require 'spec_helper'

describe Myfinance do
  it 'has a version number' do
    expect(Myfinance::VERSION).to_not be_nil
  end

  describe 'configuration' do
    it 'should be done via block initialization' do
      Myfinance.configure do |c|
        c.user_agent = "My App v1.0"
        c.url = "https://sandbox.myfinance.com.br"
      end

      expect(Myfinance.configuration.user_agent).to eq("My App v1.0")
      expect(Myfinance.configuration.url).to eq("https://sandbox.myfinance.com.br")
    end

    it 'uses a singleton object for the configuration values' do
      config1 = Myfinance.configuration
      config2 = Myfinance.configuration
      expect(config1).to eq(config2)
    end
  end
end
