require "spec_helper"

describe Myfinance::Entities::AccountCollection do
  it_behaves_like :entity_collection, Myfinance::Entities::Account
end
