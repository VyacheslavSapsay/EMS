class Account < ApplicationRecord
  include Transactionable

  def transactions
    Transaction.where("credit_account_id = ? OR debit_account_id = ?", id, id)
  end
end
