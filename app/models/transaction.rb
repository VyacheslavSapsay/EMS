class Transaction < ApplicationRecord
  belongs_to :credit_account, class_name: 'Account',
    foreign_key: 'credit_account_id', optional: true
  belongs_to :debit_account, class_name: 'Account',
    foreign_key: 'debit_account_id', optional: true
  belongs_to :author, class_name: :AdminUser, foreign_key: :author_id
  belongs_to :agent, optional: true
  belongs_to :category, optional: true
  belongs_to :project, optional: true

  validates :description, :occured_at, presence: true
  validates :debit_amount_cents, :credit_amount_cents,
  numericality: { greater_than_or_equal_to: 0, message: "must be greater than 0" }
  validates :occured_at, inclusion: { in: DateTime.now..DateTime.now + 5.minutes }
  validate :debit_or_credit?

  monetize :credit_amount_cents, :debit_amount_cents

  private

  def debit_or_credit?
    if credit_account_id && debit_account_id
      errors.add(:base, :credit_or_debit_account_blank,
        message: "Choose debit or credit account")
    elsif credit_account_id || debit_account_id
      if credit_account_id
        errors.add(:credit_amount, "Can't be blank") if credit_amount == 0
        errors.add(:debit_amount,
          "must be 0") if credit_amount && debit_amount > 0
      else
        errors.add(:debit_amount, "Can't be blank") if debit_amount == 0
        errors.add(:credit_amount,
          "must be 0") if credit_amount > 0 && debit_amount
      end
    else
      errors.add(:base, :credit_or_debit_account_blank,
        message: "Choose debit or credit account")
    end
  end

end
