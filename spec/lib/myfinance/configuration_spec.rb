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

  it 'allows setting the configuration parameters' do
    subject.url = "https://sandbox.myfinance.com.br"
    subject.user_agent = "My specific user agent"

    expect(subject.url).to eq("https://sandbox.myfinance.com.br")
    expect(subject.user_agent).to eq("My specific user agent")
  end

  it 'does not respond to #token' do
    expect(subject).to_not respond_to(:token)
  end
end
