class Account < ApplicationRecord
  has_many :transactions

  validates :name, presence: true


  def transactions
    Transaction.where("credit_account_id = ? OR debit_account_id = ?", self.id, self.id)
  end
end
