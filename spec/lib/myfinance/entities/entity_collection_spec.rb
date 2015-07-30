require 'spec_helper'

describe Myfinance::Resources::OrderCollection do
  subject { described_class.new(response) }

  describe '#build' do
    it 'returns order collection' do
      expect(subject.build.class).to eq(Ecommerce::Resources::OrderCollection)
    end

    it "returns orders" do
      orders = subject.build.orders
      expect(orders.count).to eq(4)
      expect(orders.first.class).to eq(Ecommerce::Resources::Order)
    end
  end
end
