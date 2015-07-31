require "spec_helper"

describe Myfinance::Request do
  describe "#run" do
    subject { described_class.new({ method: 'post', params: {}, url: Myfinance.configuration.url, user_agent: 'My Test User-Agent', token: 'my-auth-hash' }) }

    it "does a request using Typhoeus::Request" do
      expect(Typhoeus::Request).to receive(:new).with("https://sandbox.myfinance.com.br", { method: "post", params: {}, headers: { "Accept" => "application/json", "Content-Type" => "application/json", "User-Agent" => "My Test User-Agent", "Authorization" => "Basic bXktYXV0aC1oYXNoOlg=" }, accept_encoding: "gzip" }).and_return(double(run: true, response: true))
      subject.run
    end

    it "invokes Typhoeus::Request#run" do
      expect_any_instance_of(Typhoeus::Request).to receive(:run)
      subject.run
    end

    it "invokes Typhoeus::Request#response" do
      allow_any_instance_of(Typhoeus::Request).to receive(:run)
      expect_any_instance_of(Typhoeus::Request).to receive(:response)
      subject.run
    end

    it 'generates the base 64 of the user token' do
      allow_any_instance_of(Typhoeus::Request).to receive(:run)
      expect(Base64).to receive(:strict_encode64).with("my-auth-hash:X").and_call_original
      subject.run
    end
  end
end
