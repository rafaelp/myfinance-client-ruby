require 'spec_helper'

describe Myfinance::Http do
  subject { Myfinance::Http.new('b552dd5a8598ca089b91c5e355a83b86e4696aefac9eaa05') }

  shared_examples 'available request methods' do
    it "instantiates a new Request object" do
      VCR.use_cassette("client/#{http_method}/request") do
        expect(Myfinance::Request).to receive(:new).and_call_original
        subject.send(http_method, url, body: params)
      end
    end

    it 'runs the request' do
      VCR.use_cassette("client/#{http_method}/request") do
        expect_any_instance_of(Myfinance::Request).to receive(:run).and_call_original
        subject.send(http_method, url, body: params)
      end
    end

    it 'instantiates a new Response object' do
      VCR.use_cassette("client/#{http_method}/request") do
        expect(Myfinance::Response).to receive(:new).and_call_original
        subject.send(http_method, url, body: params)
      end
    end

    it 'resolves the response of the request a new Response object' do
      VCR.use_cassette("client/#{http_method}/request") do
        expect_any_instance_of(Myfinance::Response).to receive(:resolve!).and_call_original
        subject.send(http_method, url, body: params)
      end
    end
  end

  describe '#get' do
    let(:http_method) { :get }
    let(:url) { '/accounts' }
    let(:params) { {} }

    it_behaves_like 'available request methods'
  end

  describe '#post' do
    let(:http_method) { :post }
    let(:url) { '/entities' }
    let(:params) { { entity: { name: 'Second entity' } } }

    it_behaves_like 'available request methods'
  end

  describe '#put' do
    let(:http_method) { :put }
    let(:url) { '/entities/3798' }
    let(:params) { { entity: { name: 'Second updated entity' } } }

    it_behaves_like 'available request methods'
  end

  describe '#delete' do
    let(:http_method) { :delete }
    let(:url) { '/entities/3799' }
    let(:params) { {} }

    it_behaves_like 'available request methods'
  end
end
