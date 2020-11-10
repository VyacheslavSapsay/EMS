class Transaction < ApplicationRecord
  belongs_to :credit_account, class_name: 'Account',
    foreign_key: 'credit_account_id', optional: true
  belongs_to :debit_account, class_name: 'Account',
    foreign_key: 'debit_account_id', optional: true
  belongs_to :author, class_name: :AdminUser, foreign_key: :author_id
  belongs_to :agent, optional: true
  belongs_to :category, optional: true
  belongs_to :project, optional: true

  validate :correct_date, :debit_or_credit?
  validates :description, :occured_at, presence: true

  private

  def correct_date
    errors.add(:occured_at, 'must be in past or present time') if occured_at > 5.minutes.from_now
  end

  def debit_or_credit?
    if credit_account_id && debit_account_id
      errors.add(:base, :credit_or_debit_account_blank,
        message: "Choose debit or credit account")
    elsif credit_account_id || debit_account_id
      if credit_account_id
        errors.add(:credit_amount, "Can't be blank") if credit_amount.nil?
      else
        errors.add(:debit_amount, "Can't be blank") if debit_amount.nil?
      end
    else
      errors.add(:base, :credit_or_debit_account_blank,
        message: "Choose debit or credit account")
    end
  end

end
