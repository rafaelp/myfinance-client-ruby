require "myfinance/request"
require "myfinance/response"

module Myfinance
  class Client
    attr_reader :http

    def initialize(token, account_id = nil)
      @http = Http.new(token, account_id)
    end

    def authenticated?
      http.get("/accounts") { |response| response.code == 200 }
    rescue RequestError => e
      raise e unless [401, 403].include?(e.code)
      false
    end

    def entities
      Myfinance::Resources::Entity.new(http)
    end

    def financial_transactions
      Myfinance::Resources::FinancialTransaction.new(http)
    end

    def payable_accounts
      Myfinance::Resources::PayableAccount.new(http)
    end

    def receivable_accounts
      Myfinance::Resources::ReceivableAccount.new(http)
    end

    def attachments
      Myfinance::Resources::Attachment.new(http)
    end

    def classification_centers
      Myfinance::Resources::ClassificationCenter.new(http)
    end

    def categories
      Myfinance::Resources::Category.new(http)
    end

    def accounts
      Myfinance::Resources::Account.new(http)
    end

    def deposit_accounts
      Myfinance::Resources::DepositAccount.new(http)
    end

    def people
      Myfinance::Resources::Person.new(http)
    end

    def webhooks
      Myfinance::Resources::Webhook.new(http)
    end

    def taxes
      Myfinance::Resources::Tax.new(http)
    end

    def credit_cards
      Myfinance::Resources::CreditCard.new(http)
    end

    def credit_card_transactions
      Myfinance::Resources::CreditCardTransaction.new(http)
    end

    def reconciles
      Myfinance::Resources::Reconcile.new(http)
    end

    def bank_statements
      Myfinance::Resources::BankStatement.new(http)
    end

    def sales
      Myfinance::Resources::Sale.new(http)
    end

    def sale_accounts
      Myfinance::Resources::SaleAccount.new(http)
    end

    def sale_rules
      Myfinance::Resources::SaleRule.new(http)
    end

    def custom_classifiers
      Myfinance::Resources::CustomClassifier.new(http)
    end

    def custom_classifier_values
      Myfinance::Resources::CustomClassifierValue.new(http)
    end
  end
end
