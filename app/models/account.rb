class Account < ApplicationRecord
  has_many :debit_account_transactions,
  class_name: 'Transaction',
  foreign_key: 'debit_account_id',
  dependent: :nullify
has_many :credit_account_transactions,
  class_name: 'Transaction',
  foreign_key: 'credit_account_id',
  dependent: :nullify

  def transactions
    Transaction.where("credit_account_id = ? OR debit_account_id = ?", id, id)
  end
end
