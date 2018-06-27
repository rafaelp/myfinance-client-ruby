module Myfinance
  module Entities
    class ReceivableAccount < FinancialAccount
      attribute :eletronic_invoices, Array[Hash]
    end
  end
end
