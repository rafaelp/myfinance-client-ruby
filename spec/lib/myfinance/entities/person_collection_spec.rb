require 'spec_helper'

describe Myfinance::Entities::PersonCollection do
  it_behaves_like :entity_collection, Myfinance::Entities::Person
end
