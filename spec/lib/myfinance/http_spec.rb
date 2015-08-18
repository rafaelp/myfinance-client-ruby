require 'spec_helper'

describe Myfinance::Http do
  let(:account_id) { 12 }
  subject { Myfinance::Http.new('b552dd5a8598ca089b91c5e355a83b86e4696aefac9eaa05', account_id) }

  describe '#get' do
    let(:http_method) { :get }
    let(:url) { '/accounts' }
    let(:params) { {} }

    it_behaves_like 'available http request methods'
  end

  describe '#post' do
    let(:http_method) { :post }
    let(:url) { '/entities' }
    let(:params) { { entity: { name: 'Second entity' } } }

    it_behaves_like 'available http request methods'
  end

  describe '#put' do
    let(:http_method) { :put }
    let(:url) { '/entities/3798' }
    let(:params) { { entity: { name: 'Second updated entity' } } }

    it_behaves_like 'available http request methods'
  end

  describe '#delete' do
    let(:http_method) { :delete }
    let(:url) { '/entities/3799' }
    let(:params) { {} }

    it_behaves_like 'available http request methods'
  end
end
