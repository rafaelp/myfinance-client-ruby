require "spec_helper"

describe Myfinance do
  it "has a version number" do
    expect(Myfinance::VERSION).to_not be_nil
  end

  describe "configuration" do
    it "should be done via block initialization" do
      Myfinance.configure do |c|
        c.user_agent = "My App v1.0"
        c.url = "https://sandbox.myfinance.com.br"
      end

      expect(Myfinance.configuration.user_agent).to eq("My App v1.0")
      expect(Myfinance.configuration.url).to eq("https://sandbox.myfinance.com.br")
    end

    it "uses a singleton object for the configuration values" do
      config1 = Myfinance.configuration
      config2 = Myfinance.configuration
      expect(config1).to eq(config2)
    end
  end

  describe ".client" do
    it "instantiates a new client" do
      expect(Myfinance::Client).to receive(:new).with("abc", 12).and_call_original
      Myfinance.client("abc", 12)
    end

    context "with invalid authentication token", vcr: true do
      it "raises error when using some endpoint" do
        client = Myfinance.client("42424242424242")
        expect { client.custom_classifiers.find_all }.to raise_error(Myfinance::RequestError) do |error|
          expect(error.code).to eq(401)
        end
      end
    end
  end
end
