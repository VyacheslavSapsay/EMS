class Transaction < ApplicationRecord
  RESERVE_OF_TIME_FOR_SUBMITTING = 5.minutes

  belongs_to :credit_account, class_name: 'Account',
    foreign_key: 'credit_account_id', optional: true
  belongs_to :debit_account, class_name: 'Account',
    foreign_key: 'debit_account_id', optional: true
  belongs_to :author, class_name: 'AdminUser', foreign_key: :author_id
  belongs_to :agent, optional: true
  belongs_to :category, optional: true
  belongs_to :project, optional: true

  validates :description, :occured_at, presence: true
  validates :debit_amount_cents, :credit_amount_cents,
    numericality: { greater_than_or_equal_to: 0, message: 'must be greater than 0' }
  validate :validate_debit_account, :validate_credit_account,
    :validate_that_selected_both, :correct_date

  scope :owner, ->(user){ where(author_id: user.id) }

  monetize :credit_amount_cents, :debit_amount_cents

  private

  def account_type; end

  def amount; end

  def account_id; end

  def validate_debit_account
    if debit_account_id.present?
      errors.add(:debit_amount, "Can't be blank") if debit_amount.zero?
      errors.add(:credit_amount, 'must be 0') if debit_amount.present? && credit_amount > 0
    end
  end

  def validate_credit_account
    if credit_account_id.present?
      errors.add(:credit_amount, "Can't be blank") if credit_amount.zero?
      errors.add(:debit_amount, 'must be 0') if credit_amount.present? && debit_amount > 0
    end
  end

  def validate_that_selected_both
    if credit_account_id.present? && debit_account_id.present?
      errors.add(:base, :credit_or_debit_account_blank, message: 'Choose debit or credit account')
    elsif credit_account_id.blank? && debit_account_id.blank?
      errors.add(:base, :credit_or_debit_account_blank, message: 'Choose debit or credit account')
    end
  end

  def correct_date
    return if occured_at.blank?
    if occured_at > RESERVE_OF_TIME_FOR_SUBMITTING.minutes.from_now
      errors.add(:occured_at, 'must be in past or present time')
    end
  end
end
