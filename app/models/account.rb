class Account < ApplicationRecord
  include Validatable

  def transactions
    Transaction.where("credit_account_id = ? OR debit_account_id = ?", self.id, self.id)
  end
end
