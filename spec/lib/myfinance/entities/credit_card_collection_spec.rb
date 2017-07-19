require "spec_helper"

describe Myfinance::Entities::CreditCardCollection do
  it_behaves_like :entity_collection, Myfinance::Entities::CreditCard
end
