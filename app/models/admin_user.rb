class AdminUser < ApplicationRecord
  extend Enumerize

  has_many :transactions, foreign_key: :author_id

  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, :role, presence: true

  enumerize :role, in: %i[super user], predicates: true

  def display_name
    "#{first_name} #{last_name}"
  end
end
