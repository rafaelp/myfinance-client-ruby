require "spec_helper"

describe Myfinance::Client do
  subject { described_class.new(Myfinance.configuration.token) }

  describe "#authenticated?" do
    context "with a valid token" do
      it "returns true" do
        VCR.use_cassette("client/authenticated/true") { expect(subject.authenticated?).to be_truthy }
      end
    end

    context "with an invalid token" do
      subject { described_class.new("FAKE-TOKEN") }

      it "returns false" do
        VCR.use_cassette("client/authenticated/false") { expect(subject.authenticated?).to be_falsey }
      end
    end
  end

  describe '#get' do
    it "instantiates a new Request object" do
      VCR.use_cassette("client/get/request") do
        expect(Myfinance::Request).to receive(:new).and_call_original
        subject.get('/accounts')
      end
    end
  end

  describe '#post' do
    it "instantiates a new Request object" do
      VCR.use_cassette("client/post/request") do
        expect(Myfinance::Request).to receive(:new).and_call_original
        subject.post('/entities', body: { entity: { name: 'Second entity' } })
      end
    end
  end

  describe '#put' do
    it "instantiates a new Request object" do
      VCR.use_cassette("client/put/request") do
        expect(Myfinance::Request).to receive(:new).and_call_original
        subject.put('/entities/3798', body: { entity: { name: 'Second updated entity' } })
      end
    end
  end

  describe '#delete' do
    it "instantiates a new Request object" do
      VCR.use_cassette("client/delete/request") do
        expect(Myfinance::Request).to receive(:new).and_call_original
        subject.delete('/entities/3799')
      end
    end
  end
end
