# encoding: utf-8
require 'spec_helper'

describe Myfinance::Configuration do
  subject { Myfinance::Configuration.new }

  it "uses the production Myfinance URL by default" do
    expect(subject.url).to eq("https://app.myfinance.com.br")
  end

  it "uses a default user agent" do
    expect(subject.user_agent).to eq("Myfinance Ruby Client v#{Myfinance::VERSION}")
  end

  it "does not set any token by default" do
    expect(subject.token).to be_nil
  end

  it 'allows setting the configuration parameters' do
    subject.url = "https://sandbox.myfinance.com.br"
    subject.token = "my-token"
    subject.user_agent = "My specific user agent"

    expect(subject.url).to eq("https://sandbox.myfinance.com.br")
    expect(subject.token).to eq("my-token")
    expect(subject.user_agent).to eq("My specific user agent")
  end

  describe "#credentials" do
    it "returns the HTTP Basic Auth header value for the given token" do
      subject.token = "some-user-token"
      expect(subject.credentials).to eq("Basic c29tZS11c2VyLXRva2VuOlg=")
    end

    it "requires the token to be set" do
      expect { subject.credentials }.to raise_error(ArgumentError, 'token not set')
    end
  end
end
