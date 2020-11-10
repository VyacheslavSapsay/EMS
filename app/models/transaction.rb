class Transaction < ApplicationRecord
  belongs_to :account
  belongs_to :author, class_name: :AdminUser, foreign_key: :author_id
  belongs_to :agent, optional: true
  belongs_to :category, optional: true
  belongs_to :project, optional: true

  validate :correct_date
  validates :description, :occured_at, presence: true

  private

  def correct_date
    errors.add(:occured_at, 'must be in past or present time') if occured_at > 5.minutes.from_now
  end

end
